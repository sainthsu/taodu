<?php
include("../dao/pro_cat_dao.php");
include("../dao/pro_dao.php");
include("../dao/user_dao.php");
include("../dao/link_dao.php");
include("../dao/group_dao.php");
include("../dao/banner_dao.php");
include("../dao/shop_dao.php");
include("../dao/act_dao.php");
include("func.php");


class Beauty
{
	public function index()
	{
		$skin = get('skin');
		$linkDAO = new LinkDAO();

		if(get("from",true))
		{
			$from=get('from');
			$linkDAO->updateClick($from);
		}
		else if(get("fromid",true))
		{
			$id=get('fromid');
			$linkDAO->updateClickById($id);
		}

		$now = date('H');
		if($skin=="day"||($now>=6&&$now<=24))
		{
		
			//$bannerDAO = new BannerDAO();
			//$banner = $bannerDAO->getBanner(3,"cat=100");//3 banners
		
			$proCatDAO = new ProCatDAO();
			$proDAO = new ProDAO();
	
			$catList = $proCatDAO->getProCatList();
			foreach($catList as &$cat)
			{
				$cat['num'] = $proDAO->getNumByWhere('ischeck=1 AND type=2 AND cat='.$cat['rank']);
			}

			$orderArray = array(1=>"discount ASC","volume DESC","post_date desc");
			$cate=$_REQUEST['cate']?$_REQUEST['cate']:0;
			$order=$_REQUEST['order']?$_REQUEST['order']:0;
			$page_size=90;
			$page=$_REQUEST['page']?(int)$_REQUEST['page']:1;

			$orderStr = $order==0?'rank,id DESC':$orderArray[$order].",rank,id DESC";
			if($cate==0)
			{
				$nums = $proDAO->getNumByWhere('ischeck=1 AND type=2');
				$pageStr = multi($nums,$page_size,$page,'/d/index?nocache=1');
				$product=$proDAO->findPro('ischeck=1 AND type=2',$orderStr,($page_size*($page-1)).','.$page_size);

			}
			else
			{
				$nums = $proDAO->getNumByWhere('ischeck=1 AND type=2 AND cat in ('.$cate.')');

				$pageStr = multi($nums,$page_size,$page,'/d/index?nocache=1&cate='.$cate);

				$product=$proDAO->findPro('ischeck=1 AND type=2 AND cat in ('.$cate.')',$orderStr,($page_size*($page-1)).','.$page_size);
			}
  
			$recommend = $proDAO->getRecommend(4,12);

			$userDAO = new UserDAO();

			
			$bigLinks = $linkDAO->getLink(21);			
			
			$smarty = new Smarty();
		
			//$smarty->assign("banner",$banner);
			$smarty->assign("index",1);
			$smarty->assign("cate",$cate);
			$smarty->assign("order",$order);
			$smarty->assign("page",$page);
			//$smarty->assign("catList",$catList);
			$smarty->assign("product",$product);
			$smarty->assign("pageStr",$pageStr);
			$smarty->assign("bigLinks",$bigLinks);
			$smarty->assign("recommend",$recommend);

			$smarty->display("templates/index_new.tpl");
		}
		else
		{
			$bannerDAO = new BannerDAO();
			$banner = $bannerDAO->getBanner(5,"cat=99");

			$smarty = new Smarty();
			//$smarty->assign("events",$events);
			$smarty->assign("banner",$banner);
			$smarty->display("templates/index_night.tpl");
		}
	}
	
	public function act()
	{
		$actDAO = new ActDAO();
		$act = $actDAO->getAct(1); //1 ablumn
		
		$proDAO = new ProDAO();
		$top = $proDAO->getSpecial(2,5); //5 type 2 recommend pros
		$exchange = $proDAO->getExchange(1,3);

		$shopDAO = new ShopDAO();
		$rightShop=$shopDAO->getShop(3,"rec_type=1");

		$page_size=6;
		$page=$_REQUEST['page']?(int)$_REQUEST['page']:1;

		$nums = $actDAO->getCount()-1;

		$pageStr = multi($nums,$page_size,$page,'/d/index?action=album');

		$albums = $actDAO->getAct(($page_size*($page-1)).','.$page_size);

		//var_dump($albums);
		$smarty = new Smarty();
		$smarty->assign("action",2);
		$smarty->assign("curAct",$curAct);
		$smarty->assign("act",$act);
		$smarty->assign("exchange",$exchange);
		$smarty->assign("top",$top);
		$smarty->assign("rightShop",$rightShop);
		$smarty->assign("albums",$albums);
		$smarty->assign("pageStr",$pageStr);
		$smarty->assign("index",2);

		$smarty->display("templates/album.tpl");
	}

	public function pro()
	{
		$cat=$_REQUEST['cat']?$_REQUEST['cat']:0;
		$page_size=60;
		$page=$_REQUEST['page']?(int)$_REQUEST['page']:1;
		
		$proCatDAO = new ProCatDAO();
		$proDAO = new ProDAO();
		if($cat==0)
		{
			$nums = $proDAO->getNumByWhere('ischeck=1 AND type=2');
			$pageStr = multi($nums,$page_size,$page,'/d/index?action=special');
			//$cate = $proCatDAO->getProCatList();
			$pros=$proDAO->findPro('ischeck=1 AND type=2','rank,id desc,post_date desc',($page_size*($page-1)).','.$page_size);
			//var_dump($pros);
		}
		else
		{
		$nums = $proDAO->getNumByWhere('ischeck=1 AND type=2 AND cat in ('.$cat.')');

		$pageStr = multi($nums,$page_size,$page,'/d/index?action=special&cat='.$cat);
		$cate = $proCatDAO->getProCatList();
		$pros=$proDAO->findPro('ischeck=1 AND type=2 AND cat in ('.$cat.')','rank,id desc,post_date desc',($page_size*($page-1)).','.$page_size);
		}
		//$bannerDAO = new BannerDAO();
		//$foot_banner = $bannerDAO->getBanner(1,"cat=99");

		$smarty=new Smarty();
		//$smarty->assign("action",3);
		//$smarty->assign("cate",$cate);
		//$smarty->assign("cat",$cat);
		$smarty->assign("pros",$pros);
		$smarty->assign("pageStr",$pageStr);
		//var_dump($pageStr);
		$smarty->assign("index",3);

		$smarty->display("templates/special.tpl");
	}

	public function shop()
	{
		$cat=$_REQUEST['cat']?(int)$_REQUEST['cat']:0;
		$page_size=6;
		$page=$_REQUEST['page']?(int)$_REQUEST['page']:1;

		$proDAO = new ProDAO();
		$shopDAO = new ShopDAO();
		if($cat==0)
		{
			$nums = $shopDAO->getCount();

			$pageStr = multi($nums,$page_size,$page,'/d/index?action=shop');

			$shopList=$shopDAO->getShop(($page_size*($page-1)).','.$page_size);
		}
		else
		{
			$nums = $shopDAO->getCount('cat='.$cat);

			$pageStr = multi($nums,$page_size,$page,'/d/index?action=shop');

			$shopList=$shopDAO->getShop(($page_size*($page-1)).','.$page_size,'cat='.$cat);
		}
		foreach($shopList as &$shop)
		{
			$shop['pros'] = $proDAO->findPro('seller_nick=\''.$shop['nick'].'\' AND type=4 AND ischeck=1','id desc',6);
			//var_dump($shop['pros']);
		}
		
		//$bannerDAO = new BannerDAO();
		//$foot_banner = $bannerDAO->getBanner(1,"cat=99");

		$smarty=new Smarty();
		//$smarty->assign("action",4);
		$smarty->assign("shopList",$shopList);
		$smarty->assign("pageStr",$pageStr);
		$smarty->assign("index",2);

		$smarty->display("templates/shop.tpl");
	}

	public function group()
	{
		$page_size=20;
		$page=$_REQUEST['page']?(int)$_REQUEST['page']:1;

		$proDAO = new ProDAO();
		$treasure = $proDAO->getTreasure(1,12); //12 treasure pros

		$groupDAO = new GroupDAO();
		$nums = $groupDAO->getCount();
		$pageStr = multi($nums,$page_size,$page,'/d/index?action=group');

		$groups=$groupDAO->getGroup(($page_size*($page-1)).','.$page_size);
		
		$userDAO = new UserDAO();
		$events = $userDAO->getLimitEvents(16);
		foreach($events as &$e)
		{
			$e['username'] = substr($e['username'],0,2);

		}		
		unset($e);

		$smarty=new Smarty();
		$smarty->assign("events",$events);
	        $smarty->assign("treasure",$treasure);
		$smarty->assign("groups",$groups);
		$smarty->assign("pageStr",$pageStr);
		$smarty->assign("index",2);

		$smarty->display("templates/group.tpl");
	}

	public function show()
	{
		$gid = $_REQUEST['gid'];
		$proDAO = new ProDAO();
		$top = $proDAO->getSpecial(2,5); //5 type 2 recommend pros
		$date = date("Y-m-d");
		$updateNum = $proDAO->getNumByWhere("ischeck=1 AND post_date>=$date");

		$groupDAO = new GroupDAO();
		$group=$groupDAO->getGroupById($gid);
		$pre=$groupDAO->getGroupById($gid-1);
		$next=$groupDAO->getGroupById($gid+1);	

		$proStr = $group['pro_list'];
		$pidArray = explode(";",$proStr);
		$catArray = explode(";",$group['types']);
		$proCatDAO = new ProCatDAO();
		$catList = $proCatDAO->getProCatList();

		foreach($pidArray as $pid)
		{
			$proList[]=$proDAO->getProByIid($pid,'*');
		}

		$smarty=new Smarty();
		$smarty->assign("updateNum",$updateNum);
	        $smarty->assign("top",$top);
		$smarty->assign("group",$group);
		$smarty->assign("pre",$pre);
		$smarty->assign("next",$next);
		$smarty->assign("proList",$proList);
		$smarty->assign("catArray",$catArray);
		$smarty->assign("catList",$catList);
		$smarty->assign("index",2);

		$smarty->display("templates/show.tpl");
	}

	public function addus()
	{
		$cmd=$_REQUEST['cmd'];
		$proDAO = new ProDAO();
	
		$browser = $context->getBrowser();
		if($cmd==2)
		{
			if(!$browser)
			{
				header("KissyIoDataType:jsonp");
				$result=request('callback').'({"result":0,"info":"您还未登入淘宝,请先登入！"})';
				echo $result;
				return;
			}
			if($proDAO->getNumByWhere('iid='.$_REQUEST['id']))
			{
				header("KissyIoDataType:jsonp");
				$result=request('callback').'({"result":0,"info":"商品已存在"})';
				echo $result;
			}
			else
			{
				header("KissyIoDataType:jsonp");
				$result=request('callback').'({"result":1,"info":"商品已添加"})';
				echo $result;
			}
			return;
		}

		if($cmd==1)
		{
			if(!$browser)
			{
				header("KissyIoDataType:jsonp");
				$result=request('callback').'({"result":0,"info":"您还未登入淘宝,请先登入！"})';
				echo $result;
				return;
			}
			if($proDAO->getNumByWhere('iid='.$_REQUEST['id']))
			{
				header("KissyIoDataType:jsonp");
				$result=request('callback').'({"result":2,"info":"商品已存在"})';
				echo $result;
				return;
			}
			
			$pic=$_REQUEST['pic'];
			$carriage=0;
			$username=$browser->getNick();
			$userDAO = new UserDAO();
			$user = $userDAO->getUserByName($username);

			$art=array(
				'pic'=>$pic,
				'cat'=>$_REQUEST['cat'],
				'type'=>$_REQUEST['type'],
				'iid'=>$_REQUEST['id'],
				'oprice'=>$_REQUEST['oprice'],
				'nprice'=>$_REQUEST['nprice'],
				'start_time'=>date('Y-m-d H:i'),
				'end_time'=>date('Y-m-d H:i'),
				'rank'=>(int)$_REQUEST['rank'],
				'title'=>$_REQUEST['title'],
				'num'=>200,
				'volume'=>200,
				'seller_nick'=>$_REQUEST['shop'],
				'rec_pic'=>$_REQUEST['rec_pic'],
				'sid'=>(int)post('sid'),
				'points'=>0,
				'reason'=>$_REQUEST['reason'],
				'discount'=>10*$_REQUEST['nprice']/$_REQUEST['oprice'],
				'post_date'=>date('Y-m-d'),
				'carriage'=>$carriage,
				'type'=>(int)$_REQUEST['type'],
				'shop_type'=>$_REQUEST['shop_type'],
				'rec_type'=>0,
				'ischeck'=>0,
				'user_id'=>$user['id'],
			);
			//var_dump($art);
			if($proDAO->createPro($art))
			{
				header("KissyIoDataType:jsonp");
				$result=request('callback').'({"result":1,"info":"添加成功"})';
			}
			else
			{
				header("KissyIoDataType:jsonp");
				$result=request('callback').'({"result":0,"info":"添加失败，请联系管理员"})';
			}
			echo $result;
			return;
		}
		
		$procat = new ProCatDAO();	
		$cats = $procat->getProCatList();
		
		if($browser)
		{
			$username = $context->getBrowser()->getNick();

			$userDAO = new UserDAO();
			$user = $userDAO->getUserByName($username);
			
			if(!$user)
			{
				$userDAO->createUser($username);
				$user = $userDAO->getUserByName($username);
			}
			//var_dump($user);
			if($user['shop_url'])
			{
				$state=1
			}
			else
			{
				$state=0;
			}

			$page_size=10;
			$page=$_REQUEST['page']?(int)$_REQUEST['page']:1;

			$nums = $proDAO->getNumByWhere('user_id='.$user['id']);
			$pageStr = multi($nums,$page_size,$page,'/d/index?action=addus');
			//$cate = $proCatDAO->getProCatList();
			$signPros=$proDAO->findPro('user_id='.$user['id'],'rank,id desc',($page_size*($page-1)).','.$page_size);
				
		}
		else
		{
			$state=0;
		}
		$userDAO = new UserDAO();

		$smarty = new Smarty();
		$smarty->assign("cats",$cats);
		$smarty->assign("state",$state);
		$smarty->assign("signPros",$signPros);
		$smarty->assign("pageStr",$pagerStr);

		$smarty->display("templates/addus.tpl");
	}

	public function info()
	{
		$id=$_GET['id'];

		if($id)
		{
			include_once('item_service.php');
	
			$pro=getItemDetail($id);
			
			if($pro)
			{		
				//$volume=get_word(get_url_content('http://detailskip.taobao.com/json/ifq.htm?id='.$id.'&sid=842397175&opt=&q=1'),'quanity: ',','); //ȡ\B5\C3\CF\FA\C1\BF

				$itemjson = json_encode($pro);
				echo request('callback').'({"result":"1"},{"item":'.$itemjson.'})';
			}
			else
			{
				echo request('callback').'({"result":"0"},{"item":"0"})'; //\B7\C7\CCԿ\CD\C9\CCƷ	
			}
		}
	}
}
