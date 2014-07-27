<?php

include_once '../top/topclient.php';
include_once '../top/SpContentPublishRequest.php';
include_once '../top/SpContentDeletebyidsRequest.php';

function publishItems($items)
{
	$app = array(
	'appKey' =>'21702734',
	'appSecret' =>'b334ff3171bfb22d5ae79316293a27d6',
	'siteKey'=>'fkf4ffz45z38kk0e93578z51fkdl99f0',
	);
	
	
	foreach($items as $item)
	{
		$c = new TopClient;
		$c->appkey = '21702734';
		$c->secretKey = 'b334ff3171bfb22d5ae79316293a27d6';
		$req = new SpContentPublishRequest;
		$req->setSiteKey('fkf4ffz45z38kk0e93578z51fkdl99f0');
		$req->setSchemaName("1");
		$req->setTags($item['name']);
		
		$value = array(
		"title"=>$item['title'],
		"className"=>$item['name'],
		"detailUrl"=>"http://taodu.uz.taobao.com/",
		"items"=>"http://item.taobao.com/item.htm?id=".$item['iid'],
		"comments"=>$item['title']
		);
		$req->setValue(json_encode($value));
		$resp = $c->execute($req);
		if($resp->sp_content_publish_response != null)
		{	
			$id[]['pro_id'] = $item['id'];
			$id[]['sp_id'] = $resp->sp_content_publish_response->value;
		}
	}
	
	return $id;
	
}

function deleteItems()
{
	$ids = '115092105,115092103,115090536,115091245,115092925,115092924,115091244,115090541,115092106,115090540,115091242,115090543,115092923,115092108,115090537,115092101,115090531,115091245,115092096,115091244,115092922,115092921,115090543,115092099,115092098,115091235,115091236,115092913,115092094,115092907,115092915,115090526,115090541,115090540,115090523,115092924,115092909,115092088,115090531,115092105,115092921,115092101,115092096,115092108,115092099,115091236,115092106,115092908';
	$ids2 = '115092903,115091227,115090528,115090520,115092090,115092089,115091232,115092922,115091226,115092902,115092093,115092095,115092098,115092915,115091235,115090526,115092900,115092911,115092092,115090517,115090522,115090521';
	
	$c = new TopClient;
	$c->appkey = '21702734';
	$c->secretKey = 'b334ff3171bfb22d5ae79316293a27d6';
	$req = new SpContentDeletebyidsRequest;
	$req->setSiteKey('fkf4ffz45z38kk0e93578z51fkdl99f0');
	$req->setIds($ids);
	$resp = $c->execute($req);
}

