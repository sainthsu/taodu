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
		echo '<span>确定删除？<a href="/d/admin/link?act=del&id='.$this->id.'" >是</a><a href="/d/admin/ad">否</a></span>';
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
				$result = "修改成功";
				$url="/d/admin/link";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
				}
				else
				{
					$result = "修改失败，请联系管理员";
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
				$result = "添加成功";
				$url="/d/admin/link";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
				}
				else
				{
					$result = "添加失败，请联系管理员";
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
				$result = "删除成功";
				$url="/d/admin/link";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}			
			else
			{
					$result = "删除失败，请联系管理员";
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
				$result = "修改成功";
				$url="/d/admin/link";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
				}
				else
				{
					$result = "修改失败，请联系管理员";
					$url="/d/admin/link";
					$smarty->assign("result",$result);
					$smarty->assign("url",$url);
					$smarty->display("templates/note.tpl");
					
				}
				return;
			$smarty->display("templates/link.tpl");
	}

	
}
