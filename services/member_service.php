<?php

include("../dao/pro_dao.php");
include("../dao/user_dao.php");
include("../dao/pro_cat_dao.php");
include("func.php");

class MemberService
{
	public $proDAO;
	public $cmd;
	public $type;
	public $id;
	public $cat;
	public $page;
	public $act;
	public $catalogs;
	public $subnav;	
	
	public function __construct()
	{
		$this->proDAO = new ProDAO();
		$this->cmd=$_REQUEST['cmd'];
		$this->type=$_REQUEST['type'];
		$this->id=$_REQUEST['id'];
		$this->page=$_REQUEST['page']?$_REQUEST['page']:1;
		$this->act=$_REQUEST['act'];
	}


	public function askDel()
	{
		echo '<span>确定删除？<a href="/d/admin/member?cmd=del&id='.$this->id.'" >是</a><a href="/d/admin/member">否</a></span>';
	}

	public function index()
	{
			$page_size=30;
			$sub_pages=10;
			$procat = new ProCatDAO();	
			$page = $this->page;
			$type = $this->type;
			$cats = $procat->getProCatList();

			$userDAO = new UserDAO();

			$smarty = new Smarty();
			$smarty->assign("cats",$cats);
			$smarty->assign("nav",'0');				
			
			if($type)
			{ 	$sql.=' and a.type='.$type;
				$countsql.=' and type='.$type;
			}

			if($_REQUEST['q'])
			{
				$sql=' and (a.title like "%'.$_REQUEST['q'].'%" or a.iid like "%'.$_REQUEST['q'].'%")';
				$countsql='and title like "%'.$_REQUEST['q'].'%" or iid like "%'.$_REQUEST['q'].'%"';
			}
			if($_REQUEST['cat'])
			{
				$sql.=' and a.cat='.$_REQUEST['cat'];
				$countsql.=' and cat='.$_REQUEST['cat'];
			}
			if(isset($_REQUEST['check']))
			{
				$sql.=' and a.ischeck='.$_REQUEST['check'];
				$countsql.=' and ischeck='.$_REQUEST['check'];
			}
			
			if($_REQUEST['order'])
				$order=$_REQUEST['order'].',';
			if($sql)
			{
				$pros = $this->proDAO->getList('beauty_v2_pro as a,beauty_v2_procat as b','a.*,b.rank as catid,b.name','where a.cat=b.rank'.$sql.' order by '.$order.'a.ischeck,a.id desc limit '.($page-1)*$page_size.','.$page_size);
			}
			else
			{
				$users = $userDAO->getUser(($page-1)*$page_size.','.$page_size);
			}
			
			//var_dump($pros);
			$nums=$userDAO->getCount($countsql);
			$pageStr=multi($nums,$page_size,$page,'/d/admin/member?'.getPageStr('page,cat'));
			$title='商品管理';
			
			
			$smarty->assign("users",$users);
			$smarty->assign("pageStr",$pageStr);
			$smarty->assign("admin",1);
			$smarty->assign("q",$_REQUEST['q']);
			$smarty->assign("order",$_REQUEST['order']);
			$smarty->display("templates/member.tpl");
	}

	public function event()
	{
		$page_size=20;
		$sub_pages=10;
		
		$page = $this->page;

		$userDAO = new UserDAO();
		$events = $userDAO->getEvents('',($page-1)*$page_size.','.$page_size);
		$nums=$userDAO->getEventCount();

		$pageStr=multi($nums,$page_size,$page,'/d/admin/member?'.getPageStr('page,cat'));

		$smarty = new Smarty();
		$smarty->assign("nav",'1');
		$smarty->assign("subnav",$this->subnav);

		$smarty->assign("pageStr",$pageStr);
		$smarty->assign("events",$events);
		$smarty->assign("admin",1);
		$smarty->display("templates/member_event.tpl");
	}

	public function mod()
	{
		$proinfo = $this->proDAO->findProById($this->id);
		
		$smarty = new Smarty();
		$smarty->assign("subnav",$this->subnav);
		$smarty->assign("catalogs",$this->catalogs);
		$smarty->assign("nav",'1');

		if(post('submit',1))
		{
			
			if($proinfo['iid']!=post('proid'))
			{
				if($this->proDAO->getNumByWhere('iid='.post('proid')))
				{
					$result="商品已存在";
					$url="/d/admin/pro?cmd=add";
					$smarty->assign("result",$result);
					$smarty->assign("url",$url);
					$smarty->display("templates/note.tpl");
					return;
				}
			}
			
			$pic=post('pic');
			if(post('carriage'))
			{
				$carriage=post('carriage');
			}
			else
			{
				$carriage=isBY(post('proid'));
			}

			$art=array(
				'pic'=>$pic,
				'cat'=>post('cat'),
				'iid'=>post('proid'),
				'oprice'=>post('oprice'),
				'nprice'=>post('nprice'),
				'rank'=>(int)post('rank'),
				'st'=>post('st'),
				'et'=>post('et'),
				'title'=>post('title'),
				'num'=>(int)post('num'),
				'volume'=>post('volume'),
				'rpic'=>post('rpic'),
				'seller_nick'=>post('seller_nick'),
				'xujf'=>(int)post('xujf'),
				'zk'=>10*post('nprice')/getpost('oprice'),
				'remark'=>post('remark'),
				'carriage'=>$carriage?$carriage:0,
				'type'=>post('type',true)?post('type'):0,
				'shop_type'=>post('shop_type',true)?post('shop_type'):0,
				'rec_type'=>post('rec_type',true)?post('rec_type'):0,
			);
			
			if($this->proDAO->updatePro($art,$this->id))
			{
				$result = "修改成功";
				header('Location:/d/admin/pro');
				return;
			}
			else
			{
				$result="修改失败，请联系管理员！";
				$url="/d/admin/pro";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}
			
			return;
		}

		$procat = new ProCatDAO();	
		$cats = $procat->getProCatList();


		$smarty->assign("proinfo",$proinfo);
		$smarty->assign("cats",$cats);
		$smarty->assign("admin",1);
		$smarty->display("templates/pro_mod.tpl");
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

		if(post('submit',1))
		{
			$isshow = post('isshow',true)?post('isshow'):0;
			if($id)
			{
				$res = $procat->updateProCat(array('name'=>post('name'),'rank'=>post('rank'),'isshow'=>$isshow),$id);
				
				$result = "修改成功";
				//$url="/d/admin/pro?cmd=cat";
				header('Location:/d/admin/pro?cmd=cat');
				return;
			}
			else
			{
				$res = $procat->createProCat(array('name'=>post('name'),'rank'=>post('rank'),'isshow'=>$isshow));
				
				$result = "添加成功";
				header('Location:/d/admin/pro?cmd=cat');
				return;
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
				header('Location:/d/admin/pro?cmd=cat');
				return;

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
	
	public function check()
	{
		$smarty = new Smarty();
		$smarty->assign("nav",'1');
		$id = $_REQUEST['id'];
		
		if(post('submit',1))
		{
			$state = $_REQUEST['ischeck'];
			$reason = $_REQUEST['fail_reason'];
			$reason = $reason?$reason:'管理员很懒，什么也没写！';
			if($this->proDAO->updateCheck($id,$state,$reason))
			{
				$result = "操作成功";
				header('Location:/d/admin/pro');
				return;
			}
			else
			{
				$result = "操作失败，请联系管理员！";
				$url="/d/admin/pro";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}
			return;
		}
		$proinfo = $this->proDAO->findProById($id);
		$smarty->assign("proinfo",$proinfo);
		
		$smarty->assign("admin",1);
		$smarty->display("templates/check.tpl");
	}
	public function del()
	{
		$smarty = new Smarty();
		$smarty->assign("nav",'1');

		if($_REQUEST['callback'])
		{
			if($context->getBrowser()==null)
			{
				$result=request('callback').'({"result":0,"info":"您还未登入淘宝,请先登入！"})';
				echo $result;
				return;
			}
			$username = $context->getBrowser()->getNick();
			$pro = $this->proDAO->findProById($this->id);
			$userDAO = new UserDAO();
			$user = $userDAO->getUserByName($username);
			if($pro['userid']!=$user['id'])
			{
				$result=request('callback').'{"result":0,"info":"您无权删除他人的商品！"})';
				echo $result;
				return;
			}
		}

		
		if($this->proDAO->deleteProById($this->id))
		{
			if($_REQUEST['callback'])
			{
				echo  request('callback').'({"result":"1"})';
				return;
			}
			$result = "删除成功";
			header('Location:/d/admin/pro');
			return;
		}
		else
		{
			if($_REQUEST['callback'])
			{
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
	
	public function delAll()
	{
		if($context->getBrowser()==null)
		{
			$result=request('callback').'({"result":0,"info":"您还未登入淘宝,请先登入！"})';
			echo $result;
			return;
		}
		$username = $context->getBrowser()->getNick();
		if($username)
		{
			$userDAO = new UserDAO();
			$user = $userDAO->getUserByName($username);
			$this->proDAO->deletePro($user['id']);
			echo request('callback').'({"result":"1"})';
		}
		else
		{
			echo  request('callback').'({"result":"0"})';
		}
		
	}

	public function getPro()
	{
		$id=$this->id;
		if($id)
		{
			$pro=$this->proDAO->findProById($id);
			echo request('callback').'({"result":"1","pro":'.json_encode($pro).'})';
		}
		else
		{
			echo  request('callback').'({"result":"0"})';
		}
	}

	public function getPros()
	{
		if($context->getBrowser()==null)
		{
			$result=request('callback').'({"result":0,"info":"您还未登入淘宝,请先登入！"})';
			echo $result;
			return;
		}

		$username = $context->getBrowser()->getNick();
		if($username)
		{
			$userDAO = new UserDAO();
			$user = $userDAO->getUserByName($username);
			
			$where = "userid=".$user['id'];
			$pros=$this->proDAO->findPro($where,'rank',18);
			echo request('callback').'({"result":"1","pros":'.json_encode($pros).'})';
		}
		else
		{
			echo  request('callback').'({"result":"0"})';
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
