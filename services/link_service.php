<?php

include("../dao/link_dao.php");
include("../dao/pro_cat_dao.php");
include("func.php");

class LinkService
{
	public $linkDAO;
	
	public $act;
	public $id;

	public function __construct()
	{
		$this->act=$_GET['act'];
		$this->id=$_GET['id'];
		$this->linkDAO = new LinkDAO();
	}

	public function askDel()
	{
		echo '<span>ȷ��ɾ����<a href="/d/admin/link?act=del&id='.$this->id.'" >��</a><a href="/d/admin/ad">��</a></span>';
	}

	public function index()
	{
		$links=$this->linkDAO->getLink();
		$smarty = new Smarty();
		$smarty->assign("admin",2);
		$smarty->assign("links",$links);
		$smarty->assign("act",$this->act);
		$act = $this->act;
		$id=$this->id;

		if(post('submit',1))
		{
			
			if($id)
			{
				$link = array(
				'link'=>$_POST['link'],
				'type'=>$_POST['type'],
				'mini_logo'=>$_POST['mini_logo'],
				'big_logo'=>$_POST['big_logo'],
				'wangwang'=>$_POST['wangwang'],
				);

				$res = $this->linkDAO->updateLink($link,$id);
				if($res)
				{
				$result = "�޸ĳɹ�";
				$url="/d/admin/link";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
				}
				else
				{
					$result = "�޸�ʧ�ܣ�����ϵ����Ա";
					$url="/d/admin/link";
					$smarty->assign("result",$result);
					$smarty->assign("url",$url);
					$smarty->display("templates/ad_note.tpl");
					
				}
				return;
			}
			else
			{
				$link = array(
				'link'=>$_POST['link'],
				'type'=>$_POST['type'],
				'mini_logo'=>$_POST['mini_logo'],
				'big_logo'=>$_POST['big_logo'],
				'wangwang'=>$_POST['wangwang'],
				'token'=>md5(time()),
				);
				$res = $this->linkDAO->createLink($link);

				if($res)
				{
				$result = "��ӳɹ�";
				$url="/d/admin/link";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
				}
				else
				{
					$result = "���ʧ�ܣ�����ϵ����Ա";
					$url="/d/admin/link";
					$smarty->assign("result",$result);
					$smarty->assign("url",$url);
					$smarty->display("templates/note.tpl");
					
				}
				return;
			}
		}
		if($act=='mod')
		{
			$linkinfo=$this->linkDAO->getLinkById($id);
			$smarty->assign("linkinfo",$linkinfo);
			$smarty->display("templates/link.tpl");
			return;
			
		}
		elseif($act=='del')
		{
			$res = $this->linkDAO->deleteLink($id);
			if($res)
			{
				$result = "ɾ���ɹ�";
				$url="/d/admin/link";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}			
			else
			{
					$result = "ɾ��ʧ�ܣ�����ϵ����Ա";
					$url="/d/admin/link";
					$smarty->assign("result",$result);
					$smarty->assign("url",$url);
					$smarty->display("templates/note.tpl");
					
			}
			return;
		}

		
		$smarty->display("templates/link.tpl");

	}

	public function add()
	{
		$link = array(
					'logo'=>post('src'),
					'link'=>post('link'),
					'rank'=>(int)post('rank'),
					'type'=>post('type')
					);
				$res = $this->linkDAO->createLink($link);

				if($res)
				{
				$result = "�޸ĳɹ�";
				$url="/d/admin/link";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
				}
				else
				{
					$result = "�޸�ʧ�ܣ�����ϵ����Ա";
					$url="/d/admin/link";
					$smarty->assign("result",$result);
					$smarty->assign("url",$url);
					$smarty->display("templates/note.tpl");
					
				}
				return;
			$smarty->display("templates/link.tpl");
	}

	
}
