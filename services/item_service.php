<?php

include_once '../top/topclient.php';
include_once '../top/TbkItemsGetRequest.php';
include_once '../top/TbkItemsDetailGetRequest.php';
include_once '../top/TbkShopsDetailGetRequest.php';
include_once '../top/SpItemExtraInfoGetRequest.php';
include_once '../top/UmpPromotionGetRequest.php';


function getItemDetail($num_iid)
{
	$app = array(
	'appKey' =>'21702734',
	'appSecret' =>'b334ff3171bfb22d5ae79316293a27d6',
	'siteKey'=>'fkf4ffz45z38kk0e93578z51fkdl99f0',
	);

	$c = new TopClient;
	$c->appkey = "yourkey";
	$c->secretKey = "yourkey";
	$req = new TbkItemsDetailGetRequest;

	$req->setFields("num_iid,seller_id,nick,title,price,volume,pic_url,item_url,shop_url");
	$req->setNumIids($num_iid);

	$resp = $c->execute($req);
	$resp = object_to_array($resp->tbk_items->tbk_item);

	$c->appkey = $app['appKey'];
	$c->secretKey = $app['appSecret'];
	$proReq = new UmpPromotionGetRequest;
	$proReq->setItemId($num_iid);
	$result = $c->execute($proReq, null);
	$result = object_to_array($result->promotions->promotion_in_item->promotion_in_item);
	if(count($result)>0)
	{
		$nprice = $result[0]['item_promo_price'];
		$startTime = $result[0]['start_time'];
		$endTime = $result[0]['end_time'];
	}
	else
	{
		$nprice = $resp[0]['price'];
		$startTime = date("Y-m-d H:i:s");
		$endTime = date("Y-m-d H:i:s",time()+(5 * 24 * 60 * 60))
	}
	//var_dump($result[0]['item_promo_price']);
	/*
	$c->appkey = $app['appKey'];
	$c->secretKey = $app['appSecret'];
	$itemReq = new SpItemExtraInfoGetRequest;
	$itemReq->setId($num_iid);
	$itemReq->setSiteKey($app['siteKey']);
	$extra = $c->execute($itemReq);

	$itemExtra = json_decode($item,true);
	$item = $itemExtra['sp_item_extra_info_get_response']['value'];
	var_dump($extra);
	*/
	
	$item = array(
			"title"=>htmlspecialchars($resp[0]['title']),
			"pic"=>htmlspecialchars($resp[0]['pic_url'].'_b.jpg'),
			"oprice"=>$resp[0]['price'],
			"nprice"=>$nprice,
			"seller_nick"=>htmlspecialchars($resp[0]['nick']),
			"link"=>htmlspecialchars(str_replace('15252835','88888888',$resp[0]['item_url'])),
			"volume"=>$resp[0]['volume'],
			"start_time"=>$startTime,
			"end_time"=>$endTime,
			);
	//var_dump($item);
	return $item;
}


function getItemList($keyword,$cid,$sort,$startPrice,$endPrice,$pageNo,$pageSize)
{
	$c = new TopClient;
	$c->appkey = "yourkey";
	$c->secretKey = "yourkey";
	$req = new TbkItemsGetRequest;

	$req->setFields("num_iid,seller_id,nick,title,price,volume,pic_url,item_url,shop_url");
	
	$req->setKeyword($keyword);
	$req->setCid($cid);
	$req->setStartPrice($startPrice);
	$req->setEndPrice($endPrice);
	//$req->setAutoSend("true");
	//$req->setArea("杭州");
	//$req->setStartCredit("1heart");
	//$req->setEndCredit("1heart");

	//$req->setGuarantee("true");
	$req->setStartCommissionRate(1000);
	$req->setEndCommissionRate(8000);
	//$req->setStartCommissionNum("1000");
	//$req->setEndCommissionNum("10000");
	//$req->setStartTotalnum("1");
	//$req->setEndTotalnum("1000");
	//$req->setCashCoupon("true");
	//$req->setVipCard("true");
	//$req->setOverseasItem("true");
	//$req->setSevendaysReturn("true");
	//$req->setRealDescribe("true");
	//$req->setOnemonthRepair("true");
	//$req->setCashOndelivery("true");
	$req->setMallItem(true);
	$req->setSort($sort);
	$req->setPageNo($pageNo);
	$req->setPageSize(40);
	$req->setIsMobile("false");
	$resp = $c->execute($req);
	$num = $resp->total_results;
	//var_dump($num);
	$list = object_to_array($resp->tbk_items->tbk_item);

	foreach($list as &$l)
	{
		$pro = getPromotion($l['num_iid']);
		$l = array_merge($l,$pro);
	}
	//var_dump($list);
	return $list;
}

function getPromotion($num_iid)
{
	if($num_iid == null)
	{
		return null;
	}

	$app = array(
	'appKey' =>'21702734',
	'appSecret' =>'b334ff3171bfb22d5ae79316293a27d6',
	'siteKey'=>'fkf4ffz45z38kk0e93578z51fkdl99f0',
	);

	$c = new TopClient;
	$c->appkey = $app['appKey'];
	$c->secretKey = $app['appSecret'];
	$proReq = new UmpPromotionGetRequest;
	$proReq->setItemId($num_iid);
	$result = $c->execute($proReq, null);
	$result = $result->promotions->promotion_in_item->promotion_in_item;

	//var_dump($result[0]->item_promo_price);
	if(count($result)>0)
	{
		$pro['nprice'] = $result[0]->item_promo_price;
		$pro['start_time'] = $result[0]->start_time?$result[0]->start_time:date("Y-m-d H:i:s");
		$pro['end_time'] = $result[0]->end_time?$result[0]->end_time:date("Y-m-d H:i:s",time()+(5 * 24 * 60 * 60));
	}
	else
	{
		$pro['nprice'] = null;
		$pro['start_time'] = date("Y-m-d H:i:s");
		$pro['end_time'] = date("Y-m-d H:i:s",time()+(5 * 24 * 60 * 60))
	}
	
	return $pro;
}


function getShopDetail($seller_id)
{
	$c = new TopClient;
	$c->appkey = "yourkey";
	$c->secretKey = "yourkey";
	$req = new TbkShopsDetailGetRequest;
	$req->setFields("user_id,shop_title,seller_nick,shop_url,pic_url");
	
	$req->setSids($seller_id);
	//$req->setSellerNicks("sellerNick1");

	$resp = $c->execute($req);
	//var_dump($resp);
	$resp = object_to_array($resp->taobaoke_shops->taobaoke_shop);
	//var_dump($resp);
	return $resp;	
}

function object_to_array($obj)
{
		$_arr = is_object($obj) ? get_object_vars($obj) : $obj;
		foreach ($_arr as $key => $val)
		{
			$val = (is_array($val) || is_object($val)) ? object_to_array($val) : $val;
			$arr[$key] = $val;
		}
		return $arr;
}
