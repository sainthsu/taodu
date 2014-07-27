<?php

include("../dao/banner_dao.php");
include("../dao/pro_cat_dao.php");
include("func.php");

class BannerService
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
		$this->catalogs = array( //�����
			 '0'=>'��ͨ��Ʒ',
			'100'=>'���ֶһ�',
			);
		$this->subnav = array(
			array('link'=>'/d/admin/banner?cmd=index','name'=>'Banner����',),
			array('link'=>'/d/admin/banner?cmd=add','name'=>'Banner����',)
			);
	}

	public function askDel()
	{
		echo '<span>ȷ��ɾ����<a href="/d/admin/banner?cmd=del&id='.$this->id.'" >��</a><a href="/d/admin/banner">��</a></span>';
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

		$pageStr=multi($nums,$page_size,$page,'/d/admin/banner?'.getPageStr('page'));
		
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

		if(post('submit',true))
		{
			$art=array(
				'link'=>post('link'),
				'pic'=>post('src'),
				'rank'=>(int)post('rank'),
				'title'=>post('title'),
				'remark'=>post('remark'),
				'start_time'=>post('st'),
				'end_time'=>post('et'),
				'target'=>post('target'),
				'cat'=>post('cat'),
			);

			if($this->bannerDAO->updateBanner($art,$id))
			{
				$result = "�޸ĳɹ�";
				$smarty->assign("result",$result);
				$smarty->display("templates/note.tpl");
			}
			else
			{
				$result = "�޸�ʧ�ܣ�����ϵ����Ա";
				$smarty->assign("result",$result);
				$smarty->display("templates/note.tpl");
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

		if(post('submit',1))
		{
			$art=array(
				'link'=>post('link'),
				'pic'=>post('src'),
				'rank'=>(int)post('rank'),
				'title'=>post('title'),
				'remark'=>post('remark'),
				'start_time'=>post('start_time'),
				'end_time'=>post('end_time'),
				'target'=>post('target'),
				'cat'=>post('cat')
			);

			if($this->bannerDAO->createBanner($art))
			{

				$result = "��ӳɹ�";
				$smarty->assign("result",$result);
				$smarty->display("templates/note.tpl");
			}
			else
			{
				
				$result = "���ʧ�ܣ�����ϵ����Ա";
				$smarty->assign("result",$result);
				$smarty->display("templates/note.tpl");
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
			$result = "ɾ���ɹ�";
			$smarty->assign("result",$result);
			$smarty->display("templates/note.tpl");
		}
		else
		{
			$result = "ɾ��ʧ�ܣ�����ϵ����Ա��";
			$smarty->assign("result",$result);
			$smarty->display("templates/note.tpl");
		}
	}
}
