<?php

include("../dao/act_dao.php");
include("../dao/pro_cat_dao.php");
include("func.php");

class ActService
{
	public $actDAO;
	
	public $cmd;
	public $id;
	public $page;
	public $subnav;

	public function __construct()
	{
		$this->cmd=$_GET['cmd'];
		$this->id=$_GET['id'];
		$this->page=$_GET['page']?$_GET['page']:1;
		$this->actDAO = new actDAO();
	
		$this->subnav = array(
			array('link'=>'/d/admin/act?cmd=index','name'=>'活动管理',),
			array('link'=>'/d/admin/act?cmd=add','name'=>'活动发布',)
			);
	}

	public function askDel()
	{
		echo '<span>确定删除？<a href="/d/admin/act?cmd=del&id='.$this->id.'" >是</a><a href="/d/admin/act">否</a></span>';
	}

	public function index()
	{
		$page = $this->page;
		$page_size = 10;
		
		$q = get('q');
		if($q)
		{
			header("Location:/d/admin/pro?q=".$q);
			return;
		}
		
		$acts=$this->actDAO->getAct(($page-1)*$page_size.','.$page_size);

		$nums=$this->actDAO->getCount();

		$pageStr=multi($nums,$page_size,$page,'/d/admin/act?'.getPageStr('page'));
		
		$smarty = new Smarty();
		
		$smarty->assign("subnav",$this->subnav);
		$smarty->assign("acts",$acts);
		$smarty->assign("pageStr",$pageStr);
		$smarty->assign("admin",1);

		$smarty->display("templates/act.tpl");

	}
	
	public function mod()
	{
		$actinfo=$this->actDAO->getActById($this->id);

		$location='/view/activity/detail/'.$actinfo['link'];
		$content=$fileStoreService->getFileText($location);

		$smarty = new Smarty();
		$smarty->assign("subnav",$this->subnav);
		$smarty->assign("nav",'1');
		$id = $this->id;

		if(getpost('submit',1))
		{
			$art=array(
				'link'=>$actinfo['link'],
				'pic'=>getpost('pic'),
				'title'=>getpost('title'),
				'thumb'=>getpost('thumb'),
				'intro'=>getpost('intro'),
			);

			$content = post('content');
			if($fileStoreService->deleteFile($location)==0)
			{
				$return = $fileStoreService->saveTextFile($content,$location);
			}
			else
			{
				echo '活动页面删除失败';
			}
			if($this->actDAO->updateAct($art,$id)&&$return)
			{
				$result = "修改成功";
				$url="/d/admin/act";
				$smarty->assign("result",$result);
				$smarty->display("templates/note.tpl");
			}
			else
			{
				$result = "修改失败，请联系管理员";
				$smarty->assign("result",$result);
				$smarty->display("templates/note.tpl");
			}
			return;
		}

		$smarty->assign("actinfo",$actinfo);
		$smarty->assign("content",$content);
		$smarty->assign("admin",1);
		$smarty->display("templates/act_edit.tpl");
		
	}

	public function add()
	{
						
		$smarty = new Smarty();
		$smarty->assign("subnav",$this->subnav);	
		$smarty->assign("nav",'1');

		if(post('submit',true))
		{
			$link = time().'.tpl';
			$art=array(
				'link'=>$link,
				'pic'=>post('pic'),
				'title'=>post('title'),
				'thumb'=>post('thumb'),
				'intro'=>post('intro'),
			);
			$location = '/view/activity/detail/'.$link;
			$content = $_POST['content'];
			$return = $fileStoreService->saveTextFile($content,$location);
			if($this->actDAO->createAct($art)&&$return)
			{

				$result = "添加成功";
				$smarty->assign("result",$result);
				$smarty->display("templates/note.tpl");
			}
			else
			{
				
				$result = "添加失败，请联系管理员";
				$smarty->assign("result",$result);
				$smarty->display("templates/note.tpl");
			}
			return;
		}

		$smarty->assign("admin",1);
		$smarty->display("templates/act_edit.tpl");

	}	
	

	public function del()
	{
		$id=$this->id;
		$smarty = new Smarty();
		$smarty->assign("subnav",$this->subnav);
		
		$smarty->assign("nav",'1');
		
		$actinfo=$this->actDAO->getActById($this->id);
		$location='/view/activity/detail/'.$actinfo['link'];
		$return = $fileStoreService->deleteFile($location);

		if($this->actDAO->deleteAct($id)&&$return==0)
		{
			$result = "删除成功";
			$smarty->assign("result",$result);
			$smarty->display("templates/note.tpl");
		}
		else
		{
			$result = "删除失败，请联系管理员！";
			$smarty->assign("result",$result);
			$smarty->display("templates/note.tpl");
		}
	}
}
