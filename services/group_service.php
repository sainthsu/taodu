<?php
include("../dao/pro_dao.php");
include("../dao/pro_cat_dao.php");
include("../dao/group_dao.php");
include("func.php");

class GroupService
{
	public $groupDAO;
	public $proDAO;

	public $cmd;
	public $id;
	public $cat;
	public $page;
	public $act;
	
	public function __construct()
	{
		$this->groupDAO = new GroupDAO();
		$this->proDAO = new ProDAO();

		$this->cmd=get('cmd');
		$this->id=get('id');
		$this->page=get('page',true)?get('page'):1;
		$this->act=get('act');
	}


	public function askDel()
	{
		echo '<span>确定删除？<a href="/d/admin/group?cmd=del&id='.$this->id.'" >是</a><a href="/d/admin/group">否</a></span>';
	}

	public function index()
	{
			$page_size=20;
			$sub_pages=10;
			$procat = new ProCatDAO();	
			$page = $this->page;
			$cats = $procat->getProCatList();
			$smarty = new Smarty();
			
			$smarty->assign("cats",$cats);
			$smarty->assign("nav",'0');
		
			$q = get('q');
	
			if($q)
			{
				$sql='title like "%'.$q.'%" or iid like "%'.$q.'%")';
			}
			
			$groups = $this->groupDAO->getGroup(($page-1)*$page_size.','.$page_size,$sql);	
			
			foreach($groups as &$g)
			{
				$proArray = explode(";",$g['pro_list']);
				//var_dump($proArray);

				foreach($proArray as $piid)
				{
					$g['pros'][] = $this->proDAO->getProByIid($piid,"id,title");
				}
			}
			unset($g);
			$nums=$this->groupDAO->getCount($sql);
			$pageStr=multi($nums,$page_size,$page,'/d/admin/group?'.getPageStr('page'));
			
			$smarty->assign("groups",$groups);
			$smarty->assign("pageStr",$pageStr);
			$smarty->assign("admin",1);
			$smarty->assign("q",request('q'));
			$smarty->display("templates/group.tpl");
	}

	public function add()
	{
		$smarty = new Smarty();
		$smarty->assign("nav",'1');
		
		if(post('submit',true))
		{
			
			$pic=post('pic');
			$pro_list = post('pro_list');
			$proArray = explode(";",$pro_list);
			
			foreach($proArray as $piid)
			{
				$pros[] = $this->proDAO->getProByIid($piid,"id,title,nprice,cat");
			}
			
			$price = 0;
			foreach($pros as $pro)
			{
				$catArray[] = $pro['cat'];
				$price += $pro['nprice'];
			}

			$num = count($pros);
			
			$types = implode(';',$catArray);

			if(post('carriage'))
			{
				$carriage=post('carriage');
			}
			else
			{
				//$carriage=isBY(getpost('proid'));
				$carriage=isBY(post('proid'));
			}

			$art=array(
				'pic'=>$pic,
				'title'=>post('title'),
				'pro_list'=>post('pro_list'),
				'types'=>$types,
				'num'=>$num,
				'price'=>round($price,2),
				'rank'=>100,
				'intro'=>post('intro'),
				'rec_type'=>post('rec_type'),
			);
			if($this->groupDAO->createGroup($art))
			{
				$result="添加成功";
				$url="/d/admin/group";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}
			else
			{
				$result="添加失败，请联系管理员";
				$url="/d/admin/group?cmd=add";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}
			return;
		}
		
		$procat = new ProCatDAO();	
		$cats = $procat->getProCatList();

		$smarty->assign("admin",1);
		$smarty->display("templates/group_add.tpl");
	}

	public function mod()
	{
		$smarty = new Smarty();
		$smarty->assign("nav",'1');

		$id = $_REQUEST['id'];
		if(post('submit',true))
		{
			$pic=post('pic');
			$pro_list = post('pro_list');
			$proArray = explode(";",$pro_list);
			
			foreach($proArray as $piid)
			{
				$pros[] = $this->proDAO->getProByIid($piid,"id,title,nprice,cat");
			}

			$price = 0;
			foreach($pros as $pro)
			{
				$catArray[] = $pro['cat'];
				$price += $pro['nprice'];
			}

			$num = count($pros);
			
			$types = implode(';',$catArray);
			if(post('carriage',true))
			{
				$carriage=post('carriage');
			}
			else
			{
				$carriage=isBY(post('proid'));
			}

			$art=array(
				'pic'=>$pic,
				'title'=>post('title'),
				'pro_list'=>post('pro_list'),
				'types'=>$types,
				'num'=>$num,
				'price'=>round($price,2),
				'rank'=>100,
				'intro'=>post('intro'),
				'rec_type'=>post('rec_type'),
			);
			if($this->groupDAO->updateGroup($art,$id))
			{
				$result = "修改成功";
				$url="/d/admin/group";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}
			else
			{
				$result="修改失败，请联系管理员！";
				$url="/d/admin/group";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}
			
			return;
		}

		$groupinfo = $this->groupDAO->getGroupById($id);
		$procat = new ProCatDAO();	
		$cats = $procat->getProCatList();


		$smarty->assign("groupinfo",$groupinfo);
		$smarty->assign("cats",$cats);
		$smarty->assign("admin",1);
		$smarty->display("templates/group_mod.tpl");
	}

	public function cat()
	{
		$procat = new ProCatDAO();

		$smarty = new Smarty();
		$smarty->assign("subnav",$this->subnav);
		$smarty->assign("catalogs",$this->catalogs);
		$smarty->assign("nav",'2');
		$act = $this->act;
		$id = $this->id;

		if(post('submit',true))
		{
			$isshow = post('isshow',true)?post('isshow'):0;
			if($id)
			{
				$res = $procat->updateProCat(array('name'=>post('name'),'rank'=>post('rank'),'isshow'=>$isshow),$id);
				
				$result = "修改成功";
				$url="/d/admin/pro?cmd=cat";
				$smarty->assign("result",$result);

				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}
			else

			{
				$res = $procat->createProCat(array('name'=>post('name'),'rank'=>post('rank'),'isshow'=>$isshow));
				
				$result = "添加成功";
				$url="/d/admin/pro?cmd=cat";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);


				$smarty->display("templates/note.tpl");
			}
			return;
		}

		if($act=='mod')
		{
			$catinfo=$procat->findProCatById($id);
		}
		elseif($act =='del')
		{
			if($procat->deleteProCat($id))
			{
				$result = "删除成功";
				$url="/d/admin/pro?cmd=cat";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");

			}
			else
			{
				$result = "删除失败，请联系管理员！";
				$url="/d/admin/pro?cmd=cat";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			
			}
			return;
		}

		elseif($act == 'ask')
		{
			echo '<span>确定删除？<a href="/d/admin/pro?cmd=cat&act=del&id='.$this->id.'" >是</a><a href="/d/admin/pro?cmd=cat">否</a></span>';
			return;
		}
		
		$cats = $procat->getProCatList();
		
		$smarty->assign("cats",$cats);
		$smarty->assign("catinfo",$catinfo);

		$smarty->assign("admin",1);
		$smarty->assign("act",$act);
		$smarty->display("templates/pro_cat.tpl");
	}

	public function del()
	{
		$smarty = new Smarty();
		$smarty->assign("nav",'1');

		if($this->groupDAO->deleteGroup($this->id))
		{
			if(isset($_REQUEST['callback']))
			{
				header("KissyIoDataType:jsonp");
				echo  request('callback').'({"result":"1"})';
				return;
			}
			$result = "删除成功";
			$url="/d/admin/pro";
			$smarty->assign("result",$result);
			$smarty->assign("url",$url);
			$smarty->display("templates/note.tpl");
		}
		else
		{
			if($_REQUEST['callback'])
			{
				header("KissyIoDataType:jsonp");
				echo  request('callback').'({"result":"0"})';
				return;
			}
			$result = "删除失败，请联系管理员！";
			$url="/d/admin/pro";
			$smarty->assign("result",$result);
			$smarty->assign("url",$url);
			$smarty->display("templates/note.tpl");
		}
	}

	public function info()
	{
		$id=$this->id;

		if($id)
		{
			include_once('item_service.php');
	
			$result = getItemDetail($id);
			//var_dump($result);
			
			header("KissyIoDataType:jsonp");
			if($result)
			{
				$nprice=$result[0]['item']['price'];
				
				$volume=get_word(get_url_content('http://detailskip.taobao.com/json/ifq.htm?id='.$id.'&sid=842397175&opt=&q=1'),'quanity: ',','); //取得销量

				
				$item = array(
				"title"=>htmlspecialchars($result[0]['item']['title']),
				"pic"=>htmlspecialchars($result[0]['item']['pic_url'].'_b.jpg'),
				"oprice"=>$result[0]['item']['price'],
				"nprice"=>$nprice,
				"seller_nick"=>htmlspecialchars($result[0]['item']['nick']),
				"link"=>htmlspecialchars(str_replace('15252835','88888888',$result[0]['item']['detail_url'])),
				"volume"=>$volume,
				);
				$itemjson = json_encode($item);
				echo request('callback').'({"result":"1"},{"item":'.$itemjson.'})';
			}
			else
			{
				echo request('callback').'({"result":"0"},{"item":"0"})'; //非淘客商品	
			}
		}
	}
}
