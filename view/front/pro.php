<?php 
include("../../dao/pro_dao.php");
include("../../dao/user_dao.php");
include("../../services/func.php");

$proDAO = new ProDAO();
$userDAO = new UserDAO();

$orderArray = array(
	'id desc','nprice','nprice desc','discount','volume desc'	
	);
$filterArray = array(
	'9'=>'nprice<=15',
	'39'=>'nprice<=40 and nprice>=15',
	'8'=>'date(post_date)=curdate()',
	'15'=>'discount<6',
	);

if(isset($_REQUEST['action']))
{
	$action = get('action');
	if($action == 'json')
	{
		$filter = empty($_GET['filter'])?0:get('filter');
		$cate = empty($_GET['cate'])?0:get('cate');
		$order = empty($_GET['order'])?0:get('order');
		$page = empty($_GET['page'])?1:(int)$_GET['page'];
		
		$pageSize = 60;

		$where = 'ischeck=1';
		$where .= $filter==0?'':' and '.$filterArray[$filter];
		$where .= $cate==0?'':(' and cat='.$cate);

		$field = 'title,nprice,oprice,volume,iid,pic,discount,seller_nick';
		$count = $proDAO->getNumByWhere($where);
		if(ceil($count/$pageSize) < $page)
		{
			$pros=null;
		}
		else
		{
		$pros = $proDAO->findPro($where,$orderArray[$order],($page-1)*$pageSize.','.$pageSize,$field);
		}
		header("KissyIoDataType:jsonp");
		$result=get('callback').'({"result":1,list:'.json_encode($pros).'})';
		echo $result;
	}
	else
	{
		header("KissyIoDataType:jsonp");
		$result=get('callback').'({"result":0,info:"没有相关服务！"})';
		echo $result;
	}

}

?>
