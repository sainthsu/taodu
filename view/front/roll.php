<?php 
include("../../dao/pro_dao.php");
include("../../dao/user_dao.php");
$proDAO = new ProDAO();
$userDAO = new UserDAO();
$username = $context->getBrowser()->getNick();

if($_REQUEST['callback'])
{
	if($username)
	{
	
		$user = $userDAO->getUserByName($username);
		$today = date("Y-m-d");
		if($user['lastroll']==$today)
		{
			$result=$_GET['callback'].'({"result":0})';
			echo $result;
		}
		else
		{
			$roll = rand(0,1);
			if($roll==1)
			{
				$pearl = rand(5,10);
				$userDAO->updateCredits($pearl,$username);
				$result=$_GET['callback'].'({"result":1,"pearl":'.$pearl.'})';
				echo $result;
			}
			else
			{
				$pearl = 0;
				$userDAO->updateCredits($pearl,$username);
				$result=$_GET['callback'].'({"result":0,"pearl":'.$pearl.'})';
				echo $result;
			}
		}
	}
	else
	{
		$result=$_GET['callback'].'({"result":0})';
		echo $result;
	}

}
else
{
$pid = $_REQUEST['pid'];
if($pid)
$pro=$proDAO->findProById($pid);

		$events = $userDAO->getLimitEvents(16);
		foreach($events as &$e)
		{
			$e['username'] = substr($e['username'],0,2);

		}		
		unset($e);

$smarty = new Smarty();
$smarty->assign("pro",$pro);
$smarty->assign("events",$events);
$smarty->display("/templates/roll.tpl");
}
?>
