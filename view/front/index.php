<?php 
require_once('../../services/taodu_service.php');
$beauty = new Beauty();

//会自动加cate
switch($_REQUEST['action'])
{
	case 'index':
	$beauty->index();
	break;

	case 'album':
	$beauty->act();
	break;
	
	case 'group':
	$beauty->group();
	break;

	case 'special':
	$beauty->pro();
	break;

	case 'show':
	$beauty->show();
	break;

	case 'shop':
	$beauty->shop();
	break;
	
	case 'addus':
	$beauty->addus();
	break;

	case 'info':
	$beauty->info();
	break;

	default:
	$beauty->index();
	break;
}
?>
