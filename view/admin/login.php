<?php
	define("ADMINNAME","admin");
	define("ADMINPSW","taodu");

	include_once('../../services/func.php');

	$admin = $cacheService->get('admin');
	if($admin)
	{
		if(request('cmd')=='out')
		{
			if($cacheService->delete('admin'))
			header('Location:/d/admin/login');
			return;
		}
		header('Location:/d/admin/pro');
		return;
	}
	else
	{
		if(post('submit',1))
		{
			if(post('adminname')==ADMINNAME && post('adminpsw')==ADMINPSW)
			{
				$cacheService->set("admin",1,3000);
				header('Location:/d/admin/pro');
			}
			else
			{
				$tips='ÕËºÅ»òÃÜÂë´íÎó';
			}
		}

		$smarty = new Smarty();
		$smarty->assign("tips",$tips);
		$smarty->assign("admin",$admin);
    		$smarty->display("templates/login.tpl");

	}
 
?>
