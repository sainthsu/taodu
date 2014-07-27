<?php
$tjfqPDO = new PDO();
$id=$_GET['id']?(int)$_GET['id']:1;
$countSql = 'select * from beauty_newshop where id='.$id;
$num =$tjfqPDO->query($countSql);
$num->setFetchMode(PDO::FETCH_ASSOC);
$shop=$num->fetch();


$sql='select * from beauty_shoppro where seller_nick=\''.$shop['nick'].'\'';
$result =$tjfqPDO->query($sql);
$result->setFetchMode(PDO::FETCH_ASSOC);
$products = $result->fetchAll();

//var_dump($products);

$words = "不错的店铺，值得购买";
$smarty = new Smarty();
$smarty->assign('title',$shop['name'].'-'.$shop['catName']);
$smarty->assign('keywords',$shop['name'].','.$words);
$smarty->assign('description',$shop['name'].','.$words);
$smarty->assign('intro',$intro);
$smarty->assign('shop',$shop);
$smarty->assign('products',$products);

$smarty->display('./detail.tpl');
?>
