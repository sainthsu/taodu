<?php

$admin = $cacheService->get('admin');
if(!$admin)
{
		header('Location:/d/admin/login');
		return;

}
require_once('../../services/group_service.php');

$groupService = new GroupService();

switch($_REQUEST['cmd'])
{
	case 'add':
		$groupService->add();
		break;
	case 'mod':
		$groupService->mod();
		break;
	case 'del':
		$groupService->del();
		break;
	case 'askDel':
		$groupService->askDel();
		break;
	default:
		$groupService->index();
}

