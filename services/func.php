<?php

function get($str,$iss=false)
{
	if($iss)
	{
		if(isset($_GET[$str]))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	return filterSpecial($_GET[$str]);
}

function post($str,$iss=false)
{
	if($iss)
	{
		if(isset($_POST[$str]))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	return filterSpecial($_POST[$str]);
}

function request($str,$iss=false)
{
	if($iss)
	{
		if(isset($_REQUEST[$str]))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	return filterSpecial($_REQUEST[$str]);
}

function mysubstr($str, $len, $append) 
{
	if(strlen($str)<$len){
		return $str;
	}
	$tmpstr = "";
	$strlen = $len;
	for($i = 0; $i < $strlen; $i++) {
		if(ord(substr($str, $i, 1)) > 0xa0) {
			$tmpstr .= substr($str, $i, 2);
			$i++;
		} else
			$tmpstr .= substr($str, $i, 1);
		}
	if($append){$tmpstr.=$append;}
	return $tmpstr;
}

function multi($num,$perpage,$curpage,$mpurl) 
{
	$multipage = '';
	if($num > $perpage) {
		$page = 9;
		$offset = 4;
		$pages = @ceil($num / $perpage);
		if($page >$pages) {
			$from = 1;
			$to = $pages;
		}else {
			$from = $curpage -$offset;
			$to = $curpage +$page -$offset -1;
			if($from <1) {
				$to = $curpage +1 -$from;
				$from = 1;
				if(($to -$from) <$page &&($to -$from) <$pages) {
					$to = $page;
				}
			}elseif($to >$pages) {
				$from = $curpage -$pages +$to;
				$to = $pages;
				if(($to -$from) <$page &&($to -$from) <$pages) {
					$from = $pages -$page +1;
				}
			}
		}
			$multipage = ($curpage -$offset >1 &&$pages >$page ?'<a href="'.$mpurl.'">第一页</a> ': '').($curpage >1 ?'<a class="page-prev" href="'.$mpurl.'&page='.($curpage -1).'">上一页</a>': '<span class="page-start">首页</span>');
			for($i = $from;$i <= $to;$i++) {
				$multipage .= $i == $curpage ?'<span class="page-cur">'.$i.'</span> ': (($i==1)?'<a href="'.$mpurl.'">'.$i.'</a> ':'<a href="'.$mpurl.'&page='.$i.'">'.$i.'</a> ');
			}
			$multipage .= ($curpage <$pages ?'<a class="page-next"  href="'.$mpurl.'&page='.($curpage +1).'">下一页</a>': '<span class="page-end">尾页</span>');


			 
			return $multipage; 
	}
	return $multipage;
}

function get_word($html,$star,$end)
{
	$pattern3 = '/'.$star.'(.*?)'.$end.'/s';
	preg_match_all($pattern3, $html, $match2);                
	$word= $match2[1][0];
	return $word;
}

function get_url_content($url)
{   
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 15);
	$contents = curl_exec($ch);
	curl_close($ch);
	return $contents;
}

function getNowprice($iid)
{
	$html =  $fetchService->fetchByGet('http://item.taobao.com/item.htm?id='.$iid);
	$price = (int)get_word($html,'','');
}

function getT($t)
{
	$t=(time()-strtotime($t))/60;
	if($t>60*24){
		$t=ceil($t/(60*24)).'天';
	}elseif($t>60){
		$t=ceil($t/60).'小时';
	}else{
		$t=ceil($t).'分钟';
	}
	return $t;
}

function getNprice($iid,$oprice=0)
{
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_HEADER, 0);

	$con1=get_url_content('http://item.taobao.com/item.htm?id='.$iid.'&now_t='.time());
	$p=(int)get_word($con1,'discount.*?: ',','); //限时折扣
	if($p){$p=$p/1000;}
	
	if(!$p){$p=(int)get_word($con1,'valVipRate":',',')/100;}  //vip价格
	if(!$p)
	{
		$promotionURL=get_word($con1,'apiPromoData": "','"');
		if($$promotionURL)
		{
			curl_setopt($ch, CURLOPT_URL, $promotionURL);
			curl_setopt($ch, CURLOPT_REFERER, 'http://item.taobao.com/item.htm?id='.$iid);
			$promotionDate = curl_exec($ch);
			$p=get_word($promotionDate,'price: "','"');
		}
	}
	if(!$p)
	{ 
		$promotionURL=get_word($con1,'initApi" : "','"');
		if($promotionURL)
		{
			curl_setopt($ch, CURLOPT_URL, $promotionURL);
			curl_setopt($ch, CURLOPT_REFERER, 'http://detail.tmall.com/item.htm?id='.$iid);
			$promotionDate = curl_exec($ch);
			$p=get_word($promotionDate,',"price":"','"');
		}
	}
	curl_close($ch);
	
	if($p>0&&$p<1){return $oprice*$p;}
	if($p)
	{
		return $p;
	}
	else
	{
		return $oprice;
	}
}

function isBY($iid){ //是否包邮
	$con = get_url_content('http://item.taobao.com/item.htm?id='.$iid.'&now_t='.time());
	$carriage=get_word($con,'u9012: ',' EMS');
	if($carriage){if($carriage<=1){return 1;}else{return 0;}}
	if(strstr($con,'卖家承担运费",')) return 1; 
	$con1=get_word($con,'apiItemInfo":"','"');
	
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_HEADER, 0);
	if($con1){
		curl_setopt($ch, CURLOPT_URL, $con1);
		$con1 = curl_exec($ch);
		if(strstr($con1,'卖家承担运费')){return 1;}
		$carriage=get_word($con1,'快递:','元');
		if($carriage&&$carriage<=1) return 1;
	}
	$con1=get_word($con,'initApi" : "','"');
	if($con1){
		curl_setopt($ch, CURLOPT_URL, $con1);
		curl_setopt($ch, CURLOPT_REFERER, 'http://detail.tmall.com/item.htm?id='.$iid);
		$con1 = curl_exec($ch);
		if(strstr($con1,'卖家承担运费')||strstr($con1,'商家承担运费')){return 1;}
		$carriage=get_word($con1,'快递:','EMS');
		if($carriage&&$carriage<=1) return 1;
	}
	curl_close($ch);
	return 0;
}

function isSoldout($iid){
	$con=file_get_contents('http://item.taobao.com/item.htm?id='.$iid.'&now_t='.time(),NULL,NULL,NULL,1024*40);
	if(strstr($con,'此商品已下架')||strstr($con,'此宝贝已下架')){
		return true;
	}
	return false;
}

function getPageStr($strip)
{
	parse_str(stripslashes($_SERVER['QUERY_STRING']),$arr);
	$strip=explode(',',$strip);
	foreach($strip as $v){
		unset($arr[$v]);
		unset($arr['amp;'.$v]);
	}
	foreach($arr as $k=>$v)
	{
		if($v)
		$str.=$k.'='.$v.'&';
	}
	
	return $str;
}

function checkLogin()
{
	$url="http://admin.uz.taobao.com/favor/footBarMyFavor.do";
	$result=json_decode(get_url_content($url),true);
	var_dump($result);
	if($result['isLogin'] == false)
	{
		return false;
	}
	else if($result['userid'])
	{
		return $result['userid'];
	}
}

function filterSpecial($str)
{
	if(empty($str)) return;  
	if($str=="") return $str;  
	$str=str_replace("&",chr(34),$str);  
	$str=str_replace(">",">",$str);  
	$str=str_replace("<","<",$str);  
	$str=str_replace("&","&",$str);  
	$str=str_replace(" ",chr(32),$str);  
	$str=str_replace(" ",chr(9),$str);  
	$str=str_replace("'",chr(39),$str);  
	$str=str_replace("<br />",chr(13),$str);  
	$str=str_replace("''","'",$str);  
	$str=str_replace("select","select",$str);  
	$str=str_replace("join","join",$str);  
	$str=str_replace("union","union",$str);  
	$str=str_replace("where","where",$str);  
	$str=str_replace("insert","insert",$str);  
	$str=str_replace("delete","delete",$str);  
	$str=str_replace("update","update",$str);  
	$str=str_replace("like","like",$str);  
	$str=str_replace("drop","drop",$str);  
	$str=str_replace("create","create",$str);  
	$str=str_replace("modify","modify",$str);  
	$str=str_replace("rename","rename",$str);  
	$str=str_replace("alter","alter",$str);  
	$str=str_replace("cas","cast",$str);  
	$farr = array(   
	"//s+/" , //过滤多余的空白   
	"/<(//?)(img|script|i?frame|style|html|body|title|link|meta|/?|/%)([^>]*?)>/isU" ,
	 //过滤 <script 防止引入恶意内容或恶意代码,如果不需要插入flash等,还可以加入<object的过滤   
	"/(<[^>]*)on[a-zA-Z]+/s*=([^>]*>)/isU" , //过滤javascript的on事件   
	);   
	$tarr = array(   
	" " ,   
	"<//1//2//3>" , //如果要直接清除不安全的标签，这里可以留空   
	"//1//2" ,   
	);   
	$str = preg_replace ( $farr , $tarr , $str );   
	return $str;  
}

?>
