<?php 
require_once('../../services/tjfq_service.php');
$tjfqService = new Tejiafengqiang();
		
//���Զ���cate
switch($_REQUEST['action'])
{
	case 'cate':
	$tjfqService->category();
	break;

	case 'yugao':
	$tjfqService->yugao();
	break;

	case 'getmore':
	$tjfqService->getmore();
	break;
	
	case 'index':
	default:
	$tjfqService->index();
	break;
}
?>
