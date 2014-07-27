<?php

include("../dao/rec_dao.php");
include("../dao/pro_cat_dao.php");
include("func.php");

class RecService
{
	public $recDAO;
	
	public $act;
	public $id;

	public function __construct()
	{
		$this->act=$_GET['act'];
		$this->id=$_GET['id'];
		$this->recDAO = new RecDAO();
	}

	public function askDel()
	{
		echo '<span>确定删除？<a href="/d/admin/rec?act=del&id='.$this->id.'" >是</a><a href="/d/admin/rec">否</a></span>';
	}

	public function index()
	{
		$recs=$this->recDAO->getRec();
		$smarty = new Smarty();
		$smarty->assign("admin",2);
		$smarty->assign("recs",$recs);
		$smarty->assign("act",$this->act);
		$act = $this->act;
		$id=$this->id;

		if(getpost('submit',1))
		{
			
			if($id)
			{
				$res = $this->recDAO->updateRec(array('title'=>getpost('title'),'iid'=>getpost('iid'),'st'=>getpost('st'),'et'=>getpost('et'),'pic'=>getpost('pic'),'rank'=>getpost('rank')),$id);
				if($res)
				{
				$result = "修改成功";
				$url="/d/admin/rec";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
				}
				else
				{
					$result = "修改失败，请联系管理员";
					$url="/d/admin/rec";
					$smarty->assign("result",$result);
					$smarty->assign("url",$url);
					$smarty->display("templates/note.tpl");
					
				}
				return;
			}
			else
			{
				$res = $this->recDAO->createRec(array('title'=>getpost('title'),'iid'=>getpost('iid'),'st'=>getpost('st'),'et'=>getpost('et'),'pic'=>getpost('pic'),'rank'=>getpost('rank')));
				if($res)
				{
				$result = "添加成功";
				$url="/d/admin/rec";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
				}
				else
				{
					$result = "添加失败，请联系管理员";
					$url="/d/admin/rec";
					$smarty->assign("result",$result);
					$smarty->assign("url",$url);
					$smarty->display("templates/note.tpl");
					
				}
				return;
			}
		}
		if($act=='mod')
		{
			$recinfo=$this->recDAO->getRecById($id);
			$smarty->assign("recinfo",$recinfo);
			$smarty->display("templates/rec.tpl");
			return;
			
		}
		elseif($act=='del')
		{
			$res = $this->recDAO->deleteRec($id);
			if($res)
			{
				$result = "删除成功";
				$url="/d/admin/rec";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}			
			else
			{
					$result = "删除失败，请联系管理员";
					$url="/d/admin/rec";
					$smarty->assign("result",$result);
					$smarty->assign("url",$url);
					$smarty->display("templates/note.tpl");
					
			}
			return;
		}

		
		$smarty->display("templates/rec.tpl");

	}
	
}
