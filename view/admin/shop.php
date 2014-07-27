<?php

$admin = $cacheService->get('admin');
if(!$admin)
{
		header('Location:/d/admin/login');
		return;

}
require_once('../../services/shop_service.php');

$shopService = new ShopService();

switch($_GET['cmd'])
{
	case 'askDel':
		$shopService->askDel();
		break;
	case 'add':
		$shopService->add();
		break;
	case 'mod':
		$shopService->mod();
		break;
	case 'del':
		$shopService->del();
		break;
	case 'cat':
		$shopService->cat();
		break;
	default:
		$shopService->index();
}

