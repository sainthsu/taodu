<?php 
include("../../dao/pro_dao.php");
include("../../dao/link_dao.php");
include("../../dao/user_dao.php");
$proDAO = new ProDAO();
$userDAO = new UserDAO();
$linkDAO = new LinkDAO;
if($context->getBrowser())
{
	$username = $context->getBrowser()->getNick();
}
else
{
	$username = null;
}
$action = empty($_GET['action'])?null:$_GET['action'];
if($action == 'add')
{
	header("KissyIoDataType:jsonp");

	if($username==null)
	{
		echo $_GET['callback'].'({"result":0,info:"���ȵ����Ա���"})';
	}
	
	else if($linkDAO->getLinkByToken($username))
	{
		echo $_GET['callback'].'({"result":2,info:"���ʺ����������ύ��",link:"http://taodu.uz.taobao.com/d/index?nocache=1&from='.$username.'"})';
	}

	else
	{
		$link = array(
		'link'=>$_GET['link'],
		'type'=>$_GET['type'],
		'mini_logo'=>$_GET['mini_logo'],
		'big_logo'=>$_GET['big_logo'],
		'wangwang'=>$_GET['wangwang'],
		'token'=>$username,
		);
	
		$result = $linkDAO->createLink($link);
		if($result)
		{
			echo $_GET['callback'].'({"result":1,link:"http://taodu.uz.taobao.com/d/index?nocache=1&from='.$username.'"})';
		}
		else
		{
			echo $_GET['callback'].'({"result":0,info:"���ʧ�ܣ�"})';
		}
	}
}
else
{

	$smarty = new Smarty();
	$smarty->assign("pro",$pro);
	$smarty->assign("events",$events);
	$smarty->display("/templates/link.tpl");
}
?>
