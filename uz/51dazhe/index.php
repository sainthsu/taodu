<?php
require_once("./config.php");

function getRandomPros()
{
	$tjfqPDO = new PDO();
	$today = date("Y-m-d",time()-(5 * 24 * 60 * 60));
	$countSql = 'select COUNT(id) from taodu_pro where ischeck=1 AND type=2 and date(post_date)>=\''.$today.'\'';
	$num =$tjfqPDO->query($countSql);
	$num->setFetchMode(PDO::FETCH_ASSOC);
	$nums=$num->fetch();
    $count = $nums['COUNT(id)'];

	$ranMax = $count-40;
	$ranMax = $ranMax > 0?$ranMax:0;
	$random = rand(0,$ranMax);

	$sql='select * from taodu_pro where ischeck=1 AND type=2 and date(post_date)>=\''.$today.'\' LIMIT '.$random.',40';
	$result =$tjfqPDO->query($sql);
	$result->setFetchMode(PDO::FETCH_ASSOC);
	$pros = $result->fetchAll();
	global $name;
	foreach($pros as &$pro)
	{
		str_replace('¡¾.+¡¿','',$pro['title']);
		$pro['title'] = '¡¾'.$name.'¡¿'.$pro['title'];
	}
	return $pros;
}

$products = getRandomPros();
//var_dump($products);

$smarty = new Smarty();
$smarty->assign('title',$title);
$smarty->assign('keywords',$keywords);
$smarty->assign('description',$description);
$smarty->assign('intro',$intro);
$smarty->assign('products',$products);

$smarty->display('../tpl/index.tpl');

