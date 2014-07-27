<?php

include("../dao/pro_dao.php");
include("../dao/pro_cat_dao.php");
include("func.php");


class ProService
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
		echo '<span>确定删除？<a href="/d/admin/pro?cmd=del&id='.$this->id.'" >是</a><a href="/d/admin/pro">否</a></span>';
	}

	public function index()
	{
			$page_size=30;
			$sub_pages=10;
			$procat = new ProCatDAO();	
			$page = $this->page;
			$type = $this->type;
			$cats = $procat->getProCatList();
			$smarty = new Smarty();		
			$smarty->assign("cats",$cats);

			if($type)
			{ 	$sql.=' and a.type='.$type;
				$countsql.=' and type='.$type;
			}

			if(request('q'))
			{
				$sql=' and (a.title like "%'.request('q').'%" or a.iid like "%'.request('q').'%")';
				$countsql='and title like "%'.request('q').'%" or iid like "%'.request('q').'%"';
			}
			if(request('cat'))
			{
				$sql.=' and a.cat='.request('cat');
				$countsql.=' and cat='.request('cat');
			}
			if(isset($_GET['check']))
			{
				$sql.=' and a.ischeck='.request('check');
				$countsql.=' and ischeck='.request('check');
			}
			
			if(request('order',true))
				$order=request('order').',';
			if($sql)
			{
				$pros = $this->proDAO->getList('taodu_pro as a,taodu_procat as b','a.*,b.rank as catid,b.name','where a.cat=b.rank'.$sql.' order by '.$order.'a.ischeck,a.id desc limit '.($page-1)*$page_size.','.$page_size);
			}
			else
			{
				$pros = $this->proDAO->getList('taodu_pro as a,taodu_procat as b','a.*,b.rank as catid,b.name','where a.cat=b.rank order by '.$order.'a.ischeck,a.id desc limit '.($page-1)*$page_size.','.$page_size);
			}
			
			//var_dump($pros);
			$nums=$this->proDAO->getNumByWhere('cat in (select rank from taodu_procat)'.$countsql);
			$pageStr=multi($nums,$page_size,$page,'/d/admin/pro?'.getPageStr('page,cat'));
			$title='商品管理';
			
			
			$smarty->assign("pros",$pros);
			$smarty->assign("pageStr",$pageStr);
			$smarty->assign("admin",1);
			$smarty->assign("q",request('q'));
			$smarty->assign("order",request('order'));
			$smarty->display("templates/pro.tpl");
	}

	public function add()
	{
		$smarty = new Smarty();
		$smarty->assign("nav",'1');
		$smarty->assign("subnav",$this->subnav);
		$smarty->assign("catalogs",$this->catalogs);

		
		if(post('submit',1))
		{
			if($this->proDAO->getNumByWhere('iid='.post('proid')))
			{
				$result='商品已存在';
				$url="/d/admin/pro";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
				return;
			}
			
			$pic=post('pic');
			
			if(post('carriage',true))
			{
				$carriage=post('carriage');
			}
			else
			{
				$carriage=isBY(post('proid'));
			}
			$points = (int)post('points');
			$points = $points?$points:0;
			$art=array(
				'pic'=>$pic,
				'cat'=>post('cat'),
				'iid'=>post('proid'),
				'oprice'=>post('oprice'),
				'nprice'=>post('nprice'),
				'start_time'=>post('start_time'),
				'end_time'=>post('end_time'),
				'rank'=>(int)post('rank'),
				'title'=>post('title'),
				'num'=>(int)post('num'),
				'volume'=>post('volume'),
				'seller_nick'=>post('seller_nick'),
				'rec_pic'=>post('rec_pic'),
				'sid'=>(int)post('sid'),
				'points'=>$points,
				'remark'=>post('remark'),
				'discount'=>round(10*post('nprice')/post('oprice'),2),
				'post_date'=>date('Y-m-d'),
				'carriage'=>$carriage,
				'type'=>post('type'),
				'shop_type'=>post('shop_type'),
				'rec_type'=>$_POST['rec_type'],
				'ischeck'=>1,
				'user_id'=>0,
			);
			if($this->proDAO->createPro($art))
			{
				$result="添加成功";
				$url="/d/admin/pro";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}
			else
			{
				$result="添加失败，请联系管理员";
				$url="/d/admin/pro?cmd=add";
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
		$smarty->display("templates/pro_add.tpl");
	}

	public function mod()
	{
		$proinfo = $this->proDAO->findProById($this->id);
		
		$smarty = new Smarty();
	
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
				'start_time'=>post('start_time'),
				'end_time'=>post('end_time'),
				'rank'=>(int)post('rank'),
				'title'=>post('title'),
				'num'=>(int)post('num'),
				'volume'=>post('volume'),
				'seller_nick'=>post('seller_nick'),
				'rec_pic'=>post('rec_pic'),
				'points'=>(int)post('points'),
				'remark'=>post('remark'),
				'discount'=>round(10*post('nprice')/post('oprice'),2),
				'post_date'=>date('Y-m-d'),
				'carriage'=>$carriage,
				'type'=>post('type'),
				'shop_type'=>post('shop_type'),
				'rec_type'=>post('rec_type'),
				'ischeck'=>1,
				'user_id'=>0,
			);
			if($this->proDAO->updatePro($art,$this->id))
			{
				$result = "修改成功";
				$url="/d/admin/pro";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
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
			if($id)
			{
				$res = $procat->updateProCat(array('name'=>post('name'),'rank'=>post('rank'),'is_show'=>post('is_show')),$id);
				
				$result = "修改成功";
				$url="/d/admin/pro?cmd=cat";
				$smarty->assign("result",$result);

				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}
			else

			{
				$res = $procat->createProCat(array('name'=>post('name'),'rank'=>post('rank'),'is_show'=>post('is_show')));
				
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
	
	public function collect()
	{

		$procat = new ProCatDAO();
		$catList = $procat->getProCatList();
		

		if(post('submit',1))
		{
			
			$order = array('default', 'price_desc', 'price_asc', 'credit_desc', 'credit_asc', 'commissionRate_desc', 'commissionRate_asc', 'delistTime_desc', 'delistTime_asc');

			$q = $_REQUEST['q'];
			$cat = $_REQUEST['cat']?$_REQUEST['cat']:'1';
			$cid = $_REQUEST['cid']?$_REQUEST['cid']:'16';
			
			$catInput = request('catInput');
			$cidInput = request('cidInput');
			//$cids=explode(',',$cid);
			//$cats=explode(',',$cat);

			$orderNo = $_REQUEST['order']?$_REQUEST['order']:0;
			$orderStr = $order[$orderNo];
			$spage = (int)$_REQUEST['spage'];
			$epage = (int)$_REQUEST['epage'];
			$startPrice = $_REQUEST['startprice'];
			$endPrice = $_REQUEST['endprice'];

			include_once('item_service.php');
			include_once("../dao/collect_dao.php");
			$collect = new CollectDAO;
			$collect->clearPro();
			//foreach($cats as $c)
			//{
				//$catArray = $catToCids[$cat];
				
				//foreach($catArray as $requestCid)
				//{
					for($i = $spage;$i<=$epage;$i++)
					{
						$proList = getItemList($q,$cidInput,$orderStr,$startPrice,$endPrice,$i);
						//var_dump($proList);
						
						if($proList)
						{
							$collect->createPro($proList,$cat);
						}
					}
				//}
			//}
			header("Location:/d/admin/pro?cmd=collect&list=1");
			
		}
		else if($_REQUEST['list'])
		{
			include_once("../dao/collect_dao.php");
			$collect = new CollectDAO;
			if(post('import',1))
			{
				$proList = $this->proDAO->getList('taodu_collect');
				$this->proDAO->createPros($proList);
				header("Location:/d/admin/pro?cmd=collect&nocache=1");
			}
			else
			{
			

			$page_size=50;
			$page = $this->page;
			
			$pros = $this->proDAO->getList('taodu_collect as a,taodu_procat as b','a.*,b.rank as catid,b.name','where a.cat=b.rank order by a.id desc limit '.($page-1)*$page_size.','.$page_size);
			
			//var_dump($pros);
			$nums=$collect->getNumByWhere('cat in (select rank from taodu_procat)');
			$pageStr=multi($nums,$page_size,$page,'/d/admin/pro?'.getPageStr('page,cat'));
			
			$smarty = new Smarty();
			$smarty->assign("cats",$catList);
			$smarty->assign("pageStr",$pageStr);
			$smarty->assign("pros",$pros);
			$smarty->assign("admin",1);
			$smarty->assign("act",$act);
			$smarty->display("templates/pro_result.tpl");
			}
		}
		else if($_REQUEST['id']&&$_REQUEST['del'])
		{
			include_once("../dao/collect_dao.php");
			$collect = new CollectDAO;
			$id = (int)$_REQUEST['id'];
			if($collect->deleteProById($id))
			{
				header("Location:/d/admin/pro?cmd=collect&list=1");
			}
			else
			{
				echo "删除失败！请重试";
			}
		}
		else
		{
			$smarty = new Smarty();
			$smarty->assign("cats",$catList);
			include_once("cids.php");
			$smarty->assign("api_cids",$api_cids);
			$smarty->assign("admin",1);
			$smarty->assign("act",$act);
			$smarty->display("templates/pro_collect.tpl");
		}
		
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
		$smarty->assign("subnav",$this->subnav);
		$smarty->assign("catalogs",$this->catalogs);
		$smarty->assign("nav",'1');

		if($this->proDAO->deleteProById($this->id))
		{
			if($_REQUEST['callback'])
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
	
	public function delAll()
	{
		header("KissyIoDataType:jsonp");
		$username = $context->getBrower->getNick();
		if($username)
		{
			$this->proDAO->delAll($username);

			echo  request('callback').'({"result":"1"})';
		}
		else
		{
			echo  request('callback').'({"result":"0"})';
		}
		
	}


	public function getPro()
	{
		header("KissyIoDataType:jsonp");
		$id=$this->id;
		if($id)
		{
			$pro=$this->proDAO->findProById($id);
			echo request('callback').'({"result":"1"},"pro":'.json_encode($pro).')';
		}
		else
		{
			echo  request('callback').'({"result":"0"})';
		}
	}

	public function info()
	{
		header("KissyIoDataType:jsonp");
		$id=$this->id;

		if($id)
		{
			include_once('item_service.php');
	
			$result = getItemDetail($id);
			//var_dump($result);
			
			if($result)
			{
				$itemjson = json_encode($result);
				echo request('callback').'({"result":"1"},{"item":'.$itemjson.'})';
			}
			else
			{
				echo request('callback').'({"result":"0"},{"item":"0"})'; //非淘客商品	
			}
		}
	}

	public function uz()
	{
		if(post('submit',true))
		{
			$url = post('uz_url');
			$api = post('api_support');

			$content = get_url_content($url);

			$uzs = array(
			'jiukuaiyou'=>'http://jiukuaiyoucom.uz.taobao.com/',
			'zhe800'=>'http://zhe800.uz.taobao.com',
			'tejia'=>'http://jianshi.uz.taobao.com',
			'tejiamao'=>'http://mao.uz.taobao.com',
			'juanpi'=>'http://juanpi.uz.taobao.com',
			'huiyuangou'=>'http://huiyuangou.uz.taobao.com'
			);

			echo $content;
			$proZone = '/'.$zone_start.'(.*?)'.$zone_end.'/s';
			preg_match_all($proZone, $html, $match2);
			
			return;       
		}

		$smarty = new Smarty();
		$smarty->display("templates/pro_uz.tpl");		

	}

	public function uzEdit()
	{
		$smarty = new Smarty();
		$smarty->display("templates/pro_uz_edit.tpl");
	}
	
	public function publish()
	{
		header("KissyIoDataType:jsonp");
		$today=date("Y-m-d");
		$items = $this->proDAO->getList('taodu_pro as a,taodu_procat as b',
		'a.id,a.title,a.iid,a.remark,b.rank as catid,b.name',
		"where a.cat=b.rank AND a.ischeck=1 AND a.type=2 AND date(a.start_time)>='".$today."'");
		
		
		include_once('spContent.php');
		$ids = publishItems($items);
		global $tjfqPDO;
		
		$sth = $tjfqPDO->prepare('INSERT INTO sp_content_item (pro_id,sp_id) VALUES(?,?)');
		foreach($ids as $id)
		{
			$sth->execute(array($id['pro_id'],$id['sp_id']));
		}
		
		echo request('callback').'({"result":"1"})';
		//deleteItems();
	}
}


