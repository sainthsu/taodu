<?php
	require_once('../../dao/act_dao.php');
	$actDAO = new ActDAO();

	$id=$_GET['id'];
	if($id==null)
	{
		echo 'act id cant be null';
	}

	$actinfo = $actDAO->getActById($id);
	$location = "detail/".$actinfo['link'];
	
	echo htmlspecialchars_decode($fileStoreService->getFileText('/view/activity/'.$location));
?>
