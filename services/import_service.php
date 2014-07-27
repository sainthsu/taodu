<?
include("../dao/dbconfig.php");
include("func.php");
class ImportService
{
	function __construct()
	{
	}

	public function index()
	{
		if(post('sql',true))
		{
			global $tjfqPDO;
			
			$success=0;
			$sql=str_replace(array('INSERT','UPDATE','DELETE','REPLACE'),array('insert','update','delete','replace'),post('sql'));
			preg_match_all('/(insert|update|delete|replace)(.*?);(\r|$)/s',$sql, $matchitem);
			foreach($matchitem[0] as $v)
			{
				$result=$tjfqPDO->exec($v);
				if($result==-1)
				{
					echo '已成功执行'.$success.'条<br />';
					var_dump($tjfqPDO->errorInfo());
					break;
				}
				$success++;
			}
			if($success==count($matchitem[0]))
				echo '执行成功 '.$success.'条';
		}
		$smarty = new Smarty();
		$smarty->assign("admin",1);
		$smarty->display("templates/import.tpl");
	}
}
?>
