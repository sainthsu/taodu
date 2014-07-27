<?php 
require_once('../../services/user_service.php');
$User = new UserService();

switch($_REQUEST['action'])
{
	case 'index':
	$User->index();
	break;

	case 'getUserInfo':
	$User->getUserInfo();
	break;

	case 'sign':
	$User->sign();
	break;
	
	case 'exchange':
	$User->exchange();
	break;

	case 'exPro':
	$User->exPro();
	break;

	case 'his':
	$User->his();
	break;
	
	case 'eventDel':
	$User->eventDel();
	break;

	case 'saveUser':
	$User->saveUser();
	break;
	
	case 'checkShop':
	$User->checkShop();
	break;

	default:
	$User->index();
	break;
}
?>
