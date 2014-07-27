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
		echo '<span>ȷ��ɾ����<a href="/d/admin/rec?act=del&id='.$this->id.'" >��</a><a href="/d/admin/rec">��</a></span>';
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
				$result = "�޸ĳɹ�";
				$url="/d/admin/rec";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
				}
				else
				{
					$result = "�޸�ʧ�ܣ�����ϵ����Ա";
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
				$result = "��ӳɹ�";
				$url="/d/admin/rec";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
				}
				else
				{
					$result = "���ʧ�ܣ�����ϵ����Ա";
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
				$result = "ɾ���ɹ�";
				$url="/d/admin/rec";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}			
			else
			{
					$result = "ɾ��ʧ�ܣ�����ϵ����Ա";
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
