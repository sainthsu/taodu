<?php

include("../dao/pro_dao.php");
include("../dao/user_dao.php");
include("../dao/banner_dao.php");
include("func.php");

class UserService
{
	public function index()
	{
		$browser = $context->getBrowser();
		
	        $tab = $_REQUEST['tab']?$_REQUEST['tab']:1;
		
	        $page=$_REQUEST['page']?(int)$_REQUEST['page']:1;
		
		$proDAO = new ProDAO();
		$bannerDAO = new BannerDAO();
		$userDAO = new UserDAO();

		$exNum = $proDAO->getNumByWhere('ischeck=1 AND type=3');
		
		$banner=$bannerDAO->getBanner(3,"cat=98");

		switch($tab)
		{
			case 2:
			$products = $proDAO->findPro("type=3 AND ischeck=1","id desc",16);
			break;
			case 4:
			if($browser)
			{
			$username = $context->getBrowser()->getNick();
			$page_size=16;
			$nums = $userDAO->getEventCount($username)-1;
			$pageStr = multi($nums,$page_size,$page,'/d/user?tab=4');
			$events = $userDAO->getEvents($username,($page_size*($page-1)).','.$page_size);
			}
			break;
		}
		
		/*
		$signs=$userDAO->getSigns($username);
		$signNum = count($signs);
		
		foreach($signs as $s)
		{
			$days[] = intval(substr(($s['signdate']),-2));
		}
		
		$signDays = implode(",",$days);
		$name = urlencode($username);
		*/

		$smarty = new Smarty();
		$smarty->assign("banner",$banner);
		$smarty->assign("exNum",$exNum);

		if($browser)
		{
			$username = $context->getBrowser()->getNick();
			
			$user = $userDAO->getUserByName($username);
			if(!$user)
			{
			$userDAO->createUser($username);
		       $user = $userDAO->getUserByName($username);
			}
			$smarty->assign("username",substr($username,0,2));
			$smarty->assign("user",$user);
			$smarty->assign("pearl",$user['points']);
		}		
		$smarty->assign("exPros",$products);
		$smarty->assign("eventList",$events);
		$smarty->assign("pageStr",$pageStr);
		$smarty->assign("tab",$tab);
		//$smarty->assign("signs",$signs);
		//$smarty->assign("signNum",$signNum);
		//$smarty->assign("signDays",$signDays);

		$smarty->display("templates/user.tpl");
	}	
	
	public function getUserInfo()
	{
		$browser = $context->getBrowser();
		$userDAO = new UserDAO();
		if($browser)
		{
			$username = $context->getBrowser()->getNick();
			$user = $userDAO->getUserByName($username);
			if($user)
			{
			echo request('callback').'({"result":1,"user":'.json_encode($user).'})';
			}
			else
			{
			echo request('callback').'({"result":0,"user":"����δ�����Ա�,���ȵ��룡"})';
			}
		}
		else
		{
			echo request('callback').'({"result":0,"user":"����δ�����Ա�,���ȵ��룡"})';
		}
	}

	public function exPro()
	{
		$proDAO = new ProDAO();
		$products = $proDAO->findPro("type=3 AND ischeck=1","id desc",16);
	       if($products)
		{
			echo request('callback').'({"result":1,"pros":'.json_encode($products).'})';
		}
		else
		{
			echo request('callback').'({"result":0,"pros":"���޶һ���Ʒ��"})';
		}
	}

	public function saveUser()
	{
		$browser = $context->getBrowser();
		if($browser==null)
		{
			echo request('callback').'({"result":0,"user":"����δ�����Ա�,���ȵ��룡"})';
			return;
		}
		$username = $context->getBrowser()->getNick();

		$realname = $_GET['realname'];
		$qq = $_REQUEST['qq'];
		$phone = $_REQUEST['phone'];
		$email = $_REQUEST['email'];
		$address = $_REQUEST['address'];
		
		if($username==null||$realname==null||$qq==null||$phone==null||$email==null||$address==null)
		{
			$result=request('callback').'({"result":0,"info":"��Ϣ������,����ȫ!"})';
			echo $result;
			return;
		}

		$user = array('realname'=>$realname,'qq'=>$qq,'phone'=>$phone,'email'=>$email,'address'=>$address);
	
		$userDAO = new UserDAO;
		$olduser = $userDAO->getUserByName($username);
		if($userDAO->updateUser($user,$username))
		{
			if($olduser['realname']==null||$olduser['qq']==null||$olduser['phone']==null||$olduser['email']==null||$olduser['address']==null)
			{
					$userDAO->updateInfoPoints(4,$username);
					$result=request('callback').'({"result":2,"info":"�޸ĳɹ�!���4�����飡"})';
			}
			else
			{
				$result=request('callback').'({"result":1,"info":"�޸ĳɹ�!"})';
			}
		}
		else
		{
			$result=request('callback').'({"result":0,"info":"�޸�ʧ��!"})';
		}
		echo $result;
	}


	public function checkShop()
	{
		$uid = $_REQUEST['uid'];
		if($uid==false)
		{
			$result=get('callback').'({"result":0,"info":"����δ�����Ա�,���ȵ��룡"})';
			echo $result;
			return;
		}
		$shopUrl = $_REQUEST['shop'];
		 
		if($shopUrl)
		{
			
			$html = get_url_content($shopUrl);
			
			$userId = get_word($html,'"userId":"','"');	
			$user_nick = get_word($html,'"user_nick":"','"');
			if($userId==null)
			{
				$result=get('callback').'({"result":-1,"info":"������������������!"})';
			}
			if($uid != $userId)
			{
				$result=get('callback').'({"result":0,"info":"�˵��̲������ĵ��̣���ֻ��Ϊ�Լ��ĵ������ƹ㡣"})';
			}
			else
	 		{
				$userDAO = new UserDAO();
				$username = $context->getBrowser()->getNick();
				$userDAO->updateShopUrl($shopUrl,$username);
				$result=$_GET[callback].'({"result":1})';
			}
			echo $result;
		}
	}

	public function sign()
	{
		$browser = $context->getBrowser();
		
		if($browser==null)
		{
			$result=get('callback').'({"result":0,"info":"����δ�����Ա�,���ȵ��룡"})';
			echo $result;
			return;
		}
		$username = $context->getBrowser()->getNick();

		$userDAO = new UserDAO();
		$query = $userDAO->signUp($username);
		if($query == -1)
		{
			$signs = $userDAO->getSigns($username);
			$signNum = count($signs);
		
			foreach($signs as $s)
			{
				$days[] = intval(substr(($s['sign_date']),-2));
			}
		
			$signDays = implode(",",$days);
			$result=get('callback').'({"result":2,"info":"��������ǩ��!","days":"'.$signDays.'","num":'.$signNum.'})';
		}
		else if($query >= 1)
		{
			$result=get('callback').'({"result":1,"info":"ǩ���ɹ�","pearl":'.$query.'})';
		}
		else
		{
			$result=get('callback').'({"result":0,"info":"ǩ��ʧ�ܣ�����ϵ����Ա"})';
		}
		echo $result;
		return;
	}

	public function exchange()
	{
		$browser = $context->getBrowser();
		if($browser==null)
		{
			$result=get('callback').'({"result":3,"info":"����δ�����Ա�,���ȵ��룡"})';
			echo $result;
			return;
		}
		$username = $context->getBrowser()->getNick();
		
		$proId = $_GET['id'];
		
		$userDAO = new UserDAO();
		$info = $userDAO->exchange($username,$proId);
		if($info==-1)
		{
			$result=get('callback').'({"result":0,"info":" ���鲻������Ŭ��Ŷ��"})';
		}
		else if($info==-2)
		{
			$result=get('callback').'({"result":3,"info":"���Ѿ��һ����ˣ����������Ʒ�ɣ�"})';
		}
		else if($info==1)
		{
			$user = $userDAO->getUserByName($username);
			$result=get('callback').'({"result":1,"info":"�һ��ɹ��������ĵȴ�������","pearl":'.$user['credits'].'})';
		}
		else if($info==2)
		{
			$result=get('callback').'({"result":3,"info":"�һ�ʧ�ܣ�����ϵ����Ա"})';
		}
		echo $result;
		return;
	}

	public function his()
	{
		$browser = $context->getBrowser();
		if(!$browser)
		{
			$result=get('callback').'({"result":0,"info":"����δ�����Ա�,���ȵ��룡"})';
			echo $result;
			return;
		}
		$username = $context->getBrowser()->getNick();
		
		$userDAO = new UserDAO();
		if(isset($_REQUEST['index']))
		{
			$count = $userDAO->getEventCount();
			$events = $userDAO->getLimitEvents($index%($count/16).'16');
		}
		else
		{
			$events = $userDAO->getEvents($username);
		}
		if($events)
		{	
			$result=get('callback').'({"result":1,"events":'.json_encode($events).'})';
		}
		else
		{
			$result=get('callback').'({"result":0,"info":"����������֧��¼��"})';
		}
		echo $result;
		return;		
	}

	public function eventDel()
	{
		$browser = $context->getBrowser();
		if(!$browser)
		{
			$result=get('callback').'({"result":0,"info":"����δ�����Ա�,���ȵ��룡"})';
			echo $result;
			return;
		}
		$id=$_REQUEST['id'];
		$username = $context->getBrowser()->getNick();
		
		$userDAO = new UserDAO();
		if($id)
		{
		$events = $userDAO->delEvent($id,$username);
		}
		else
		{
		$events = $userDAO->delAllEvents($username);
		}

		if($events)
		{	
			$result=get('callback').'({"result":1,"info":"ɾ���ɹ���"})';
		}
		else
		{
			$result=get('callback').'({"result":0,"info":"ɾ��ʧ�ܣ�"})';
		}
		echo $result;
		return;	
		
	}
}
