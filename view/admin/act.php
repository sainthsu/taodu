<?php

$admin = $cacheService->get('admin');
if(!$admin)
{
		header('Location:/d/admin/login');
		return;

}
require_once('../../services/act_service.php');

$actService = new ActService();

switch($_GET['cmd'])
{
	case 'add':
		$actService->add();
		break;
	case 'mod':
		$actService->mod();
		break;
	case 'del':
		$actService->del();
		break;
	case 'askDel':
		$actService->askDel();
		break;
	default:
		$actService->index();
}

