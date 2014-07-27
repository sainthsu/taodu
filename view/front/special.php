<?php 
include("../../dao/pro_dao.php");
include("../../services/func.php");
	$cat=$_REQUEST['cat']?(int)$_REQUEST['cat']:1;
	$page_size=24;
	$page=$_REQUEST['page']?(int)$_REQUEST['page']:1;
		
	$proDAO = new ProDAO();
	switch($cat)
	{
		case 1;
		$type=6;
		break;
		case 2;
		$type=7;
		break;
		case 3;
		$type=8;
		break;
		case 4;
		$type=9;
		break;
	}
		
	$nums = $proDAO->getNumByWhere('ischeck=1 AND type='.$type);
		$pageStr = multi($nums,$page_size,$page,'/d/special?cat='.$cat);
		$pros=$proDAO->findPro('ischeck=1 AND type='.$type,'id desc',($page_size*($page-1)).','.$page_size);
		//var_dump($pros);
		$smarty=new Smarty();
	
		$smarty->assign("pros",$pros);
		$smarty->assign("pageStr",$pageStr);
		$smarty->assign("cat",$cat);
		$smarty->display("/templates/pro.tpl");
?>
