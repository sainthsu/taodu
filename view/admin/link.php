<?php

$admin = $cacheService->get('admin');
if(!$admin)
{
		header('Location:/d/admin/login');
		return;

}
require_once('../../services/link_service.php');

$linkService = new LinkService();

switch($_GET['act'])
{
	case 'askDel':
	$linkService->askDel();
	break;
	default:
	$linkService->index();
}

