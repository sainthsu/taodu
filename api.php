<?php   
require_once("dao/dbconfig.php");
require_once("services/item_service.php");
$today=date("Y-m-d"); 
function str_substr($start, $end, $str) // �ַ�����ȡ����      
{      
    $temp = explode($start, $str, 2);      
    $content = explode($end, $temp[1], 2);      
    return $content[0];      
}   
	
// ---------------- ʹ��ʵ�� ----------------   

$str = $result = $fetchService->fetchByGet("http://meilijingxuan.uz.taobao.com/open.php?iid=0");
  
//echo $str;
//$propro=base64_decode($_REQUEST['propro']);//base64����
$propro=str_substr("apiapis", "apiapie", $str);
//echo $propro;
$prolist=explode("|",$propro);//��|Ϊ�ֽ��
for($i=0; $i<=count($prolist); $i++)
{
 $pro= $prolist[$i]; 
 $proone=explode(",",$pro);//��,Ϊ�ֽ��
 $title= $proone[0];//����
 $oprice= $proone[1];//ԭ��
 $nprice= $proone[2];//�ּ�
 $cat= $proone[3];//���
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

 $pic= $proone[4];//ͼƬ
 $st= $proone[5];//��ʼʱ��
 $et= $proone[6];//����ʱ��
 $rank= $proone[7];//����
 $seller= $proone[8];//����Դ
 $iid= $proone[9];//��ƷID
 $zk= $proone[10];//�ۿ�
 $volume= $proone[11];//����
 $postdt= $proone[12];//�ύʱ��

 $item = getItemDetail($iid);
 $volume = $item['volume'];
 //$seller = $item['seller_nick'];

	if($oprice>0)
	{ //��sql��
	$sql2='insert ignore into taodu_pro (user_id,title,oprice,nprice,pic,start_time,end_time,cat,ischeck,is_collect,rank,shop_type,type,rec_type,num ,seller_nick,points,iid,discount,volume,post_date,carriage,remark) value (0,\''.$title.'\',\''.$oprice.'\',\''.$nprice.'\',\''.$pic.'\',\''.$st.'\',\''.$et.'\',\''.$cat.'\',1,1,\''.$rank.'\',1,2,0,200,\''.$seller.'\',0,\''.$iid.'\',\''.$zk.'\','.($volume+200).',\''.$postdt.'\',1,\'����ʵ�ݣ�ͦ�����Ŷ��\')';
	//ִ��
	//echo "(".$volume.')';
	$tjfqPDO->exec($sql2);
	}
//var_dump($tjfqPDO->errorInfo());
}

	$sql3 = 'SELECT COUNT(id) FROM taodu_pro WHERE ischeck=1 AND type=2 and iid<>0 and date(start_time)>=\''.$today.'\'';
    $num1 = $tjfqPDO->query($sql3);
	$num1->setFetchMode(PDO::FETCH_ASSOC);
	$nums=$num1->fetch();
    echo 'jsonp110({"info":"�����'.$nums['COUNT(id)'].'����Ʒ"})';
?>
