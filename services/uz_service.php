<?php

include("../dao/uz_dao.php");
include("../dao/pro_cat_dao.php");
include("func.php");

class UzService
{
	public $proDAO;
	
	public $cmd;
	public $type;
	public $id;
	public $cat;
	public $page;
	public $act;
	public $subnav;	
	
	public function __construct()
	{
		$this->uzDAO = new UzDAO();
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
			
			if(request('order',true))
				$order=request('order').',';
			
			$uzs = $this->uzDAO->getUzs('1',$order.'id desc',($page-1)*$page_size.','.$page_size);
			
			//var_dump($uzs);
			$nums=$this->uzDAO->getNumByWhere('1');
			$pageStr=multi($nums,$page_size,$page,'/d/admin/pro?'.getPageStr('page,cat'));
			
			$smarty->assign("uzs",$uzs);
			$smarty->assign("pageStr",$pageStr);
			$smarty->assign("admin",1);
			$smarty->assign("order",request('order'));
			$smarty->display("templates/uz_index.tpl");
	}

	public function add()
	{
		$smarty = new Smarty();
		$smarty->assign("nav",'1');
		$smarty->assign("subnav",$this->subnav);

		if(post('submit',1))
		{
			if($this->uzDAO->getNumByWhere("url='".post('url')."'"))
			{
				$result='站点已存在！';
				$url="/d/admin/uz";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
				return;
			}
			
			$art=array(
				'name'=>post('name'),
				'url'=>post('url'),
				'page_str'=>post('page_str'),
				'zone_start'=>post('zone_start'),
				'zone_end'=>post('zone_end'),
				'iid_start'=>post('iid_start'),
				'iid_end'=>post('iid_end'),
				'title_start'=>post('title_start'),
				'title_end'=>post('title_end'),
				'pic_start'=>post('pic_start'),
				'pic_end'=>post('pic_end'),
				'pro_start'=>post('pro_start'),
				'pro_end'=>post('pro_end'),
				'oprice_start'=>post('oprice_start'),
				'oprice_end'=>post('oprice_end'),
				'nprice_start'=>post('nprice_start'),
				'nprice_end'=>post('nprice_end'),
				'remark_start'=>post('remark_start'),
				'remark_end'=>post('remark_end'),
				'isstart_start'=>post('isstart_start'),
				'isstart_end'=>post('isstart_end'),
				'volume_start'=>post('volume_start'),
				'volume_end'=>post('volume_end'),
				'starttime_start'=>post('starttime_start'),
				'starttime_end'=>post('starttime_end'),
				'shoptype_start'=>post('shoptype_start'),
				'shoptype_end'=>post('shoptype_end'),
				'like_start'=>post('like_start'),
				'like_end'=>post('like_end'),
				'diy_start'=>post('diy_start'),
				'diy_end'=>post('diy_end'),
				'diy_column'=>post('diy_column')
			);
			if($this->uzDAO->createUz($art))
			{
				$result="添加成功";
				$url="/d/admin/uz";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}
			else
			{
				$result="添加失败，请联系管理员";
				$url="/d/admin/uz?cmd=add";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}
			return;
		}
		
		$procat = new ProCatDAO();	
		$cats = $procat->getProCatList();

		$smarty->assign("admin",1);
		$smarty->display("templates/uz_edit.tpl");
	}

	public function mod()
	{
		$proinfo = $this->uzDAO->findUzById($this->id);
		
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
		$smarty->display("templates/uz_edit.tpl");
	}

	
	public function collect()
	{

		$procat = new ProCatDAO();
		$catList = $procat->getProCatList();
		
		$uz_id = $_GET['id'];
		$uz = $this->uzDAO->getUzById($uz_id);
		
		$content = get_url_content($uz['url']);
		
		
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

}


