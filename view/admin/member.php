<?php

require_once('../../services/member_service.php');

$proService = new MemberService();

switch($_REQUEST['cmd'])
{
	case 'event':
	$proService->event();
	break;

	case 'mod':
	$proService->mod();
	break;

	case 'cat':
	$proService->cat();
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
	
	case 'getPros':
	$proService->getPros();
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
	
	case 'index':
	default:
	$proService->index();
}
