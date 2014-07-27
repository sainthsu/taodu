<?php

$admin = $cacheService->get('admin');
if(!$admin)
{
		header('Location:/d/admin/login');
		return;

}
require_once('../../services/banner_service.php');

$adService = new BannerService();

switch($_REQUEST['cmd'])
{
	case 'add':
		$adService->add();
		break;
	case 'mod':
		$adService->mod();
		break;
	case 'del':
		$adService->del();
		break;
	case 'askDel':
		$adService->askDel();
		break;
	default:
		$adService->index();
}

