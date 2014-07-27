<?php
$admin = $cacheService->get('admin');

if(!$admin)
{
	header('Location:/d/admin/login');
	return;
}

require_once('../../services/pro_service.php');

$proService = new ProService();

switch($_REQUEST['cmd'])
{
	case 'add':
	$proService->add();
	break;

	case 'mod':
	$proService->mod();
	break;

	case 'cat':
	$proService->cat();
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

	case 'getPro':
	$proService->getPro();
	break;

	case 'check':
	$proService->check();
	break;

	case 'info':
	$proService->info();	
	break;

	case 'askDel':
	$proService->askDel();
	break;

	case 'uz':
	$proService->uz();
	break;
	
	case 'publish':
	$proService->publish();
	break;
	
	case 'index':
	default:
	$proService->index();
}
