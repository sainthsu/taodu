<?php
$admin = $cacheService->get('admin');

if(!$admin)
{
	header('Location:/d/admin/login');
	return;
}

require_once('../../services/uz_service.php');

$proService = new UzService();

switch($_REQUEST['cmd'])
{
	case 'add':
	$proService->add();
	break;

	case 'mod':
	$proService->mod();
	break;

	case 'collect':
	$proService->collect();
	break;

	case 'del':
	$proService->del();
	break;

	case 'delAll':
	$proService->delAll();
	break;

	case 'askDel':
	$proService->askDel();
	break;
	
	case 'index':
	default:
	$proService->index();
}
