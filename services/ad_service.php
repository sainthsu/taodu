<?php

include("../dao/banner_dao.php");
include("../dao/pro_cat_dao.php");
include("func.php");

class ADService
{
	public $bannerDAO;
	
	public $cmd;
	public $id;
	public $cat;
	public $page;
	public $catalogs;
	public $subnav;

	public function __construct()
	{
		$this->cmd=$_GET['cmd'];
		$this->id=$_GET['id'];
		$this->cat=$_GET['cat'];
		$this->page=$_GET['page']?$_GET['page']:1;
		$this->bannerDAO = new bannerDAO();
		$this->catalogs = array( //活动类型
			 '0'=>'普通商品',
			'100'=>'积分兑换',
			);
		$this->subnav = array(
			array('link'=>'/d/admin/ad?cmd=index','name'=>'Banner广告管理',),
			array('link'=>'/d/admin/ad?cmd=add','name'=>'Banner广告发布',)
			);
	}

	public function askDel()
	{
		echo '<span>确定删除？<a href="/d/admin/ad?cmd=del&id='.$this->id.'" >是</a><a href="/d/admin/ad">否</a></span>';
	}

	public function index()
	{
		$cat = $this->cat;
		$page = $this->page;
		$page_size = 10;
		$procat = new ProCatDAO();

		$q = get('q');
		if($q)
		{
			header("Location:/d/admin/pro?q=".$q);
			return;
		}
		
		$cats = $procat->getProCatList();	
		$sqladd=$cat==100?'cat=0':($cat?'cat='.$cat:"");
		
		$arts=$this->bannerDAO->getBanner(($page-1)*$page_size.','.$page_size,$sqladd);

		$nums=$this->bannerDAO->getCount($sqladd);

		$pageStr=multi($nums,$page_size,$page,'/d/admin/ad?'.getPageStr('page'));
		
		$smarty = new Smarty();
		$smarty->assign("catalogs",$this->catalogs);
		$smarty->assign("subnav",$this->subnav);
		$smarty->assign("cats",$cats);
		$smarty->assign("arts",$arts);
		$smarty->assign("pageStr",$pageStr);
		$smarty->assign("admin",1);
		$smarty->display("templates/ad.tpl");

	}
	
	public function mod()
	{
		$adinfo=$this->bannerDAO->getBannerById($this->id);
		
		$procat = new ProCatDAO();		
		$cats = $procat->getProCatList();

		$id = $this->id;

		$smarty = new Smarty();
		$smarty->assign("subnav",$this->subnav);
		$smarty->assign("catalogs",$this->catalogs);
		$smarty->assign("nav",'1');

		if(getpost('submit',1))
		{
			$art=array(
				'link'=>post('link'),
				'src'=>post('src'),
				'rank'=>(int)post('rank'),
				'title'=>post('title'),
				'remark'=>post('remark'),
				'st'=>post('st'),
				'et'=>post('et'),
				'target'=>post('target'),
				'cat'=>post('cat'),
			);

			if($this->bannerDAO->updateAd($art,$id))
			{
				$result = "修改成功";
				$smarty->assign("result",$result);
				$smarty->display("templates/ad_note.tpl");
				header('Location:/d/admin/ad');
			}
			else
			{
				$result = "修改失败，请联系管理员";
				$smarty->assign("result",$result);
				$smarty->display("templates/ad_note.tpl");
				header('Location:/d/admin/ad');
			}
			return;
		}

		$smarty->assign("adinfo",$adinfo);
		$smarty->assign("cats",$cats);
		$smarty->assign("admin",1);
		$smarty->display("templates/ad_mod.tpl");
		
	}

	public function add()
	{
		$procat = new ProCatDAO();		
		$cats = $procat->getProCatList();
						
		$smarty = new Smarty();
		$smarty->assign("subnav",$this->subnav);
		$smarty->assign("catalogs",$this->catalogs);
		$smarty->assign("nav",'1');

		if(getpost('submit',1))
		{
			$art=array(
				'link'=>post('link'),
				'src'=>post('src'),
				'rank'=>(int)post('rank'),
				'title'=>post('title'),
				'remark'=>post('remark'),
				'st'=>post('st'),
				'et'=>post('et'),
				'target'=>post('target'),
				'cat'=>post('cat')
			);

			if($this->bannerDAO->createBanner($art))
			{

				$result = "添加成功";
				$smarty->assign("result",$result);
				$smarty->display("templates/ad_note.tpl");
				header('Location:/d/admin/ad?cmd=add');
			}
			else
			{
				
				$result = "添加失败，请联系管理员";
				$smarty->assign("result",$result);
				$smarty->display("templates/ad_note.tpl");
				header('Location:/d/admin/ad?cmd=add');
			}
			return;
		}

		$smarty->assign("cats",$cats);
		$smarty->assign("admin",1);
		$smarty->display("templates/ad_add.tpl");

	}	
	

	public function del()
	{
		$id=$this->id;
		$smarty = new Smarty();
		$smarty->assign("subnav",$this->subnav);
		$smarty->assign("catalogs",$this->catalogs);
		$smarty->assign("nav",'1');

		if($this->bannerDAO->deleteBanner($id))
		{
			$result = "删除成功";
			$smarty->assign("result",$result);
			$smarty->display("templates/ad_note.tpl");
			header('Location:/d/admin/ad');
		}
		else
		{
			$result = "删除失败，请联系管理员！";
			$smarty->assign("result",$result);
			$smarty->display("templates/ad_note.tpl");
			header('Location:/d/admin/ad');
		}
	}
}
