<?php

include("../dao/shop_dao.php");
include("../dao/pro_dao.php");
include("../dao/shop_cat_dao.php");
include("func.php");

class ShopService
{
	public $shopDAO;
	
	public $cmd;
	public $id;

	public function __construct()
	{
		$this->cmd=$_REQUEST['cmd'];
		$this->id=$_REQUEST['id'];
		$this->shopDAO = new ShopDAO();
	}

	public function askDel()
	{
		echo '<span>确定删除？<a href="/d/admin/shop?cmd=del&id='.$this->id.'" >是</a><a href="/d/admin/ad">否</a></span>';
	}

	public function index()
	{
		$page_size=30;
		$page=$_REQUEST['page']?$_REQUEST['page']:1;
		$proDAO = new ProDAO();

		if($_REQUEST['q'])
		{
				$sql=' and (a.title like "%'.$_REQUEST['q'].'%" or a.nick like "%'.$_REQUEST['q'].'%")';
				$countsql='and title like "%'.$_REQUEST['q'].'%" or nick like "%'.$_REQUEST['q'].'%"';
		}
		if($_REQUEST['cat'])
		{
				$sql.=' and a.cat='.$_REQUEST['cat'];
				$countsql.=' and cat='.$_REQUEST['cat'];
		}

		if($_REQUEST['order'])
				$order=$_REQUEST['order'].',';
		if($sql)
		{
				$shops = $proDAO->getList('taodu_shop as a,taodu_shopcat as b','a.*,b.rank as catid,b.name','where a.cat=b.rank'.$sql.' order by '.$order.'a.id desc limit '.($page-1)*$page_size.','.$page_size);
		}
		else
		{
				$shops = $proDAO->getList('taodu_shop as a,taodu_shopcat as b','a.*,b.rank as catid,b.name','where a.cat=b.rank order by '.$order.'a.id desc limit '.($page-1)*$page_size.','.$page_size);
		}
			
	//	var_dump($shops);
		$nums=$this->shopDAO->getCount('cat in (select rank from taodu_shopcat)'.$countsql);
		$pageStr=multi($nums,$page_size,$page,'/d/admin/shop?'.getPageStr('page,cat'));
		$smarty = new Smarty();
		$smarty->assign("pageStr",$pageStr);
		$smarty->assign("admin",1);
		$smarty->assign("q",$_REQUEST['q']);
		$smarty->assign("order",$_REQUEST['order']);
		$smarty->assign("shops",$shops);
		$smarty->assign("act",$this->cmd);
		
		$smarty->display("templates/shop.tpl");

	}
	
	public function add()
	{
		$smarty = new Smarty();
		$shopCatDAO = new ShopCatDAO();
		$cats = $shopCatDAO->getShopCatList();

		if(post('submit',1))
		{
			$shop = array('nick'=>post('nick'),
				'title'=>post('title'),
				'link'=>post('link'),
				'discount'=>post('discount'),
				'cat'=>post('cat'),
				'tip'=>post('tip'),
				'shop_type'=>post('shop_type'),
				'rec_type'=>post('rec_type'),
				'intro'=>post('intro'),
				'thumb'=>post('thumb'));
			$res = $this->shopDAO->createShop($shop);
			if($res)
			{
				$result = "添加成功";
				$url="/d/admin/shop";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}
			else
			{
				$result = "添加失败，请联系管理员";
				$url="/d/admin/shop";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
					
			}
			return;
		}
		$smarty->assign("cats",$cats);
		$smarty->display("templates/shop_add.tpl");
	}

	public function mod()
	{
		$smarty = new Smarty();
		$shopCatDAO = new ShopCatDAO();
		$cats = $shopCatDAO->getShopCatList();

		$id=$this->id;
		if(post('submit',1))
		{
			
			if($id)
			{
				$shop = array('nick'=>post('nick'),
				'title'=>post('title'),
				'link'=>post('link'),
				'discount'=>post('discount'),
				'cat'=>post('cat'),
				'tip'=>post('tip'),
				'shop_type'=>post('shop_type'),
				'rec_type'=>post('rec_type'),
				'intro'=>post('intro'),
				'thumb'=>post('thumb'));

				$res = $this->shopDAO->updateShop($shop,$id);
				if($res)
				{
				$result = "修改成功";
				$url="/d/admin/shop";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
				}
				else
				{
					$result = "修改失败，请联系管理员";
					$url="/d/admin/shop";
					$smarty->assign("result",$result);
					$smarty->assign("url",$url);
					$smarty->display("templates/note.tpl");
					
				}
				return;
			}
		}
		
		$shopinfo=$this->shopDAO->getShopById($id);
		$smarty->assign("shopinfo",$shopinfo);
		$smarty->assign("cats",$cats);
		$smarty->display("templates/shop_add.tpl");
		
	}

	public function del()
	{
		$smarty = new Smarty();
		$id=$this->id;
		$res = $this->shopDAO->deleteShop($id);
		if($res)
		{
				$result = "删除成功";
				$url="/d/admin/shop";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
		}			
		else
		{
					$result = "删除失败，请联系管理员";
					$url="/d/admin/shop";
					$smarty->assign("result",$result);
					$smarty->assign("url",$url);
					$smarty->display("templates/note.tpl");
					
		}

	}

	public function cat()
	{
		$shopcat = new ShopCatDAO();

		$smarty = new Smarty();
		
		$smarty->assign("nav",'2');
		$act = $this->act;
		$id = $this->id;

		if(post('submit',1))
		{
			$isshow = post('is_show',true)?post('is_show'):0;
			if($id)
			{
				$res = $shopcat->updateShopCat(array('name'=>post('name'),'rank'=>post('rank'),'is_show'=>$isshow),$id);
				
				$result = "修改成功";
				$url="/d/admin/shop?cmd=cat";
				$smarty->assign("result",$result);

				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			}
			else

			{
				$res = $shopcat->createShopCat(array('name'=>post('name'),'rank'=>post('rank'),'is_show'=>$isshow));
				
				$result = "添加成功";
				$url="/d/admin/shop?cmd=cat";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);


				$smarty->display("templates/note.tpl");
			}
			return;
		}

		if($act=='mod')
		{
			$catinfo=$shopcat->findShopCatById($id);
		}
		elseif($act =='del')
		{
			if($shopcat->deleteShopCat($id))
			{
				$result = "删除成功";
				$url="/d/admin/shop?cmd=cat";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");

			}
			else
			{
				$result = "删除失败，请联系管理员！";
				$url="/d/admin/shop?cmd=cat";
				$smarty->assign("result",$result);
				$smarty->assign("url",$url);
				$smarty->display("templates/note.tpl");
			
			}
			return;
		}

		elseif($act == 'ask')
		{
			echo '<span>确定删除？<a href="/d/admin/shop?cmd=cat&act=del&id='.$this->id.'" >是</a><a href="/d/admin/shop?cmd=cat">否</a></span>';
			return;
		}
		
		$cats = $shopcat->getShopCatList();
		
		$smarty->assign("cats",$cats);
		$smarty->assign("catinfo",$catinfo);

		$smarty->assign("admin",1);
		$smarty->assign("act",$act);
		$smarty->display("templates/shop_cat.tpl");
	}
}
