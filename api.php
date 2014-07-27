<?php   
require_once("dao/dbconfig.php");
require_once("services/item_service.php");
$today=date("Y-m-d"); 
function str_substr($start, $end, $str) // 字符串截取函数      
{      
    $temp = explode($start, $str, 2);      
    $content = explode($end, $temp[1], 2);      
    return $content[0];      
}   
	
// ---------------- 使用实例 ----------------   

$str = $result = $fetchService->fetchByGet("http://meilijingxuan.uz.taobao.com/open.php?iid=0");
  
//echo $str;
//$propro=base64_decode($_REQUEST['propro']);//base64解码
$propro=str_substr("apiapis", "apiapie", $str);
//echo $propro;
$prolist=explode("|",$propro);//以|为分界点
for($i=0; $i<=count($prolist); $i++)
{
 $pro= $prolist[$i]; 
 $proone=explode(",",$pro);//以,为分界点
 $title= $proone[0];//标题
 $oprice= $proone[1];//原价
 $nprice= $proone[2];//现价
 $cat= $proone[3];//类别
 switch($cat)
 {
	 case 3:
		$cat=4;
		break;
	 case 4:
	    $cat=8;
		break;
	 case 5:
	    $cat=6;
		break;
	 case 6:
	    $cat=9;
		break;
	 case 7:
		$cat=5;
		break;
	 case 9:
		$cat=11;
		break;
 }

 $pic= $proone[4];//图片
 $st= $proone[5];//开始时间
 $et= $proone[6];//结束时间
 $rank= $proone[7];//排序
 $seller= $proone[8];//数据源
 $iid= $proone[9];//商品ID
 $zk= $proone[10];//折扣
 $volume= $proone[11];//销量
 $postdt= $proone[12];//提交时间

 $item = getItemDetail($iid);
 $volume = $item['volume'];
 //$seller = $item['seller_nick'];

	if($oprice>0)
	{ //组sql串
	$sql2='insert ignore into taodu_pro (user_id,title,oprice,nprice,pic,start_time,end_time,cat,ischeck,is_collect,rank,shop_type,type,rec_type,num ,seller_nick,points,iid,discount,volume,post_date,carriage,remark) value (0,\''.$title.'\',\''.$oprice.'\',\''.$nprice.'\',\''.$pic.'\',\''.$st.'\',\''.$et.'\',\''.$cat.'\',1,1,\''.$rank.'\',1,2,0,200,\''.$seller.'\',0,\''.$iid.'\',\''.$zk.'\','.($volume+200).',\''.$postdt.'\',1,\'经济实惠，挺不错的哦！\')';
	//执行
	//echo "(".$volume.')';
	$tjfqPDO->exec($sql2);
	}
//var_dump($tjfqPDO->errorInfo());
}

	$sql3 = 'SELECT COUNT(id) FROM taodu_pro WHERE ischeck=1 AND type=2 and iid<>0 and date(start_time)>=\''.$today.'\'';
    $num1 = $tjfqPDO->query($sql3);
	$num1->setFetchMode(PDO::FETCH_ASSOC);
	$nums=$num1->fetch();
    echo 'jsonp110({"info":"添加了'.$nums['COUNT(id)'].'件商品"})';
?>
