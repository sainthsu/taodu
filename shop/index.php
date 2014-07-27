<?php
require_once("../services/func.php");

$tjfqPDO = new PDO();
$countSql = 'select COUNT(id) from beauty_newshop';
$num =$tjfqPDO->query($countSql);
$num->setFetchMode(PDO::FETCH_ASSOC);
$nums=$num->fetch();
$count = $nums['COUNT(id)'];

$page_size=75;
$page=$_REQUEST['page']?(int)$_REQUEST['page']:1;
$pageStr = multi($count,$page_size,$page,'/shop/index.php?nocache=1');
$sql='select * from beauty_newshop LIMIT '.($page_size*($page-1)).','.$page_size;
$result =$tjfqPDO->query($sql);
$result->setFetchMode(PDO::FETCH_ASSOC);
$shops = $result->fetchAll();
//var_dump($shops);
$random=rand(0,74);
$words = '全网最齐全名店导购';
$smarty = new Smarty();
$smarty->assign('title',$shops[$random]['name'].'-'.$words);
$smarty->assign('keywords',$shops[$random]['name'].','.$words);
$smarty->assign('description',$shops[$random]['name'].','.$words);
$smarty->assign('shops',$shops);
$smarty->assign('pageStr',$pageStr);

$smarty->display('./index.tpl');
?>
