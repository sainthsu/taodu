
<?php
require_once("dbconfig.php");

class UserDAO
{
	/**
     	* @var PDO
     	*/
    	protected $pdo;
	
    	public function __construct()
    	{
        	global $tjfqPDO;
        	$this->pdo =  $tjfqPDO;
    	}
	
	public function createUser($username)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('INSERT INTO '.$DBconfig['DB_PREFIX'].'user(username,last_login) VALUES(?,?)');
		$sth->execute(array($username,date("Y-m-d H:i:s")));
        	return $this->pdo->lastInsertId();	
	}

	public function updateUser($user,$username)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX']."user SET realname=?,qq=?,phone=?,email=?,address=? WHERE username='".$username."'");
		$sth->execute(array($user['realname'], $user['qq'], $user['phone'],$user['email'],$user['address']));
		
		//var_dump($sth->errorInfo());
        	return $sth->rowCount();	
	}

	public function updateShopUrl($url,$username)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX']."user SET shop_url=? WHERE username='".$username."'");
		$sth->execute(array($url));
		
		//var_dump($sth->errorInfo());
        	return $sth->rowCount();	
	}

	public function updateLogin($username)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX']."user SET login_times=login_times+1,last_login=? WHERE username='".$username."'");
		$sth->execute(array(date("Y-m-d H:i:s")));
		
		//var_dump($sth->errorInfo());
        	return $sth->rowCount();	
	}

	public function updatePoints($point,$username)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX']."user SET points=points+?,last_roll=? WHERE username='".$username."'");
		$sth->execute(array($point,date('Y-m-d')));
		//var_dump($sth->errorInfo());
		$eventinfo = 'ÕäÖé+'.$point.',³é½±³éµ½'.$point.'¿ÅÕäÖé£¡';
		$this->createEvent(array('username'=>$username,'event'=>$eventinfo,"type"=>2));
        	return $sth->rowCount();	
	}

	public function updateInfoPoints($credit,$username)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX']."user SET points=points+? WHERE username='".$username."'");
		$sth->execute(array($credit));
		//var_dump($sth->errorInfo());
		if($credit!=0)
		{
			$eventinfo = 'ÕäÖé+'.$credit.',²¹È«ÐÅÏ¢£¬µÃµ½'.$credit.'¿ÅÕäÖé£¡';
			$this->createEvent(array('username'=>$username,'event'=>$eventinfo,"type"=>6));
		}
        	return $sth->rowCount();	
	}

	public function signUp($username)
	{
		global $DBconfig;
		$user = $this->getUserByName($username);
		$today=date('Y-m-d');

		$query=$this->pdo->exec('SELECT * FROM '.$DBconfig['DB_PREFIX'].'sign WHERE sign_date=\''.$today.'\' AND username=\''.$username.'\'');
		if($query != null)
		{
			return -1;
		}		

		$result=$this->pdo->exec('INSERT INTO '.$DBconfig['DB_PREFIX'].'sign (username,sign_date) VALUES (\''.$username.'\',\''.$today.'\')');

		$lastsign = $user['last_sign'];
		$day=(strtotime($lastsign)-strtotime($today))/3600/24;
		//var_dump($day);
		//var_dump($lastsign);
		//var_dump($today);
		
		if($lastsign!=null&&$day==-1)
		{
			$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX'].'user SET last_sign=?,sign_times=sign_times+1,points=? WHERE username=\''.$username.'\'');
			if($user['sign_times']>=5)
				$credit=5;
			else if($user['sign_times']!=0)
				$credit=$user['sign_times']+1;
			else
				$credit=1;
			$sth->execute(array($today,$credit+$user['points']));
			$eventinfo = 'ÕäÖé+'.$credit.',Á¬Ç©'.$credit.'Ìì';
			$this->createEvent(array('username'=>$username,'event'=>$eventinfo,'type'=>1));
			return $credit;
			
		}
		else
		{
			$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX'].'user SET last_sign=?,sign_times=1,points=? WHERE username = \''.$username.'\'');
			$sth->execute(array($today,$user['points']+1));
			$eventinfo = 'ÕäÖé+1,Ê×ÈÕÇ©µ½£¡';
			$this->createEvent(array('username'=>$username,'event'=>$eventinfo,'type'=>1));
			return 1;		
		}

		if(!$result)
		{
			return 0;
		}
			
	}

	public function getUser($limit,$where=null)
	{
		global $DBconfig;

		if($where&&$limit)
		{
        		$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'user WHERE '.$where.' ORDER BY id desc LIMIT '.$limit;
		}
		else if($limit)
		{
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'user ORDER BY id desc LIMIT '.$limit;
		}
		else
		{		
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'user ORDER BY id desc';
		}
        	$result = $this->pdo->query($sql);
		$result->setFetchMode(PDO::FETCH_ASSOC);
		$users=$result->fetchAll();
        	return $users;
	}

	public function getSigns($username)
	{
		global $DBconfig;
		
		$month = date('Y-m');
		$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'sign WHERE date_format(sign_date,\'%Y-%m\')=\''.$month.'\' AND username = \''.$username.'\' ORDER BY sign_date';
		
		$result = $this->pdo->query($sql);
		$result->setFetchMode(PDO::FETCH_ASSOC);
		$signs=$result->fetchAll();
        	return $signs;
	}

	public function getUserByName($username)
	{
		global $DBconfig;
        	$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'user WHERE username = \''.$username.'\'';
		
        	$result = $this->pdo->query($sql);
		$user=$result->fetch(PDO::FETCH_ASSOC);
        	return $user;
	}

	public function deleteUser($username)
    	{
		global $DBconfig;
        	return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'user where username = \''.$username.'\'');
    	}

	public function deleteLastSigns($username)
	{
		global $DBconfig;
        	return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'sign where username = '.$username.'AND sign_date=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),\'%Y-%m\')');
	}

	public function getCount($where)
	{
		global $DBconfig;
        $sql = 'SELECT COUNT(id) FROM '.$DBconfig['DB_PREFIX'].'user';
		if($where)
		$sql .= ' WHERE '.$where;
        $num = $this->pdo->query($sql);
	    $num->setFetchMode(PDO::FETCH_ASSOC);
		$nums=$num->fetch();
        return $nums['COUNT(id)'];
	}

	public function getEventCount($username)
	{
		global $DBconfig;
        	$sql = 'SELECT COUNT(id) FROM '.$DBconfig['DB_PREFIX'].'event';
		if($username)
		$sql .= ' WHERE username=\''.$username.'\'';
        	$num = $this->pdo->query($sql);
	    	$num->setFetchMode(PDO::FETCH_ASSOC);
		$nums=$num->fetch();
		
        	return $nums['COUNT(id)'];
	}

	public function exchange($username,$id)
	{
		global $DBconfig;

		$pro= $this->pdo->query('SELECT points,title FROM '.$DBconfig['DB_PREFIX'].'pro WHERE id=' . $id);
		$proResult=$pro->fetch(PDO::FETCH_ASSOC);
		
		$user = $this->pdo->query('SELECT * FROM '.$DBconfig['DB_PREFIX'].'user WHERE username=\''.$username.'\'');
		$userResult=$user->fetch(PDO::FETCH_ASSOC);

		if($userResult['points'] < $proResult['points'])
			return -1;
		if($userResult['realname']==null||$userResult['phone']==null||$userResult['qq']==null||$userResult['email']==null||$userResult['address']==null)
			return 2;
		$exquery = $this->pdo->query('SELECT id FROM '.$DBconfig['DB_PREFIX'].'exchange WHERE usernick=\''.$username.'\' AND proid='.$id);
		$expro = $exquery->fetch(PDO::FETCH_ASSOC);

                if($expro)
			return -2;
		$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX'].'user SET points=points-'.$proResult['points'].' WHERE username=\''.$username.'\'');
		$sth->execute();
		$this->createEvent(array('username'=>$username,'event'=>'ÕäÖé-'.$proResult['points'].',¶Ò»»ÉÌÆ·£¡','type'=>5));		

		$data = array(
			$username,
			$userResult['realname'],
			$id,
			$proResult['title'],
			$proResult['points'],
			$userResult['phone'],
			$userResult['qq'],
			$userResult['postcode']?$userResult['postcode']:310000,
			$userResult['address'],
			date('Y-m-d'),
			);
		$exchange = $this->pdo->prepare('INSERT INTO '.$DBconfig['DB_PREFIX'].'exchange (username,realname,pro_id,title,shell,phone,qq,postcode,address,date) VALUES(?,?,?,?,?,?,?,?,?,?)');
		$exchange->execute($data);

		if($exchange->rowCount()&$sth->rowCount() == 1)
			return 1;
		else
			return 0;
	}

	public function getExchanges($username)
	{
		global $DBconfig;
		
		$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'exchange WHERE username=\''.$username.'\' ORDER BY date';
		$result = $this->pdo->query($sql);
		$result->setFetchMode(PDO::FETCH_ASSOC);
		$exchanges=$result->fetchAll();
        	return $exchanges;
	}
	
	public function createEvent($event)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('INSERT INTO '.$DBconfig['DB_PREFIX'].'event(username,description,type,time) VALUES(?,?,?,?)');
		$sth->execute(array($event['username'],$event['event'],$event['type'],date("Y-m-d H:i:s")));
		//var_dump($sth->errorInfo());
        	return $this->pdo->lastInsertId();
	}

	public function getEvents($username,$limit)
	{
		global $DBconfig;
		
		if($limit&&$username)
		{
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'event WHERE username=\''.$username.'\' ORDER BY time desc LIMIT '.$limit;
		}
		else if($username)
		{
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'event WHERE username=\''.$username.'\' ORDER BY time desc';
		}
		else if($limit)
		{
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'event ORDER BY time desc LIMIT '.$limit;
		}
		else
		{
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'event ORDER BY time desc';
		}

		$result = $this->pdo->query($sql);
		$result->setFetchMode(PDO::FETCH_ASSOC);
		$events=$result->fetchAll();
        	return $events;

	}

	public function getLimitEvents($limit)
	{
		global $DBconfig;
		
		$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'event ORDER BY time desc'.' LIMIT '.$limit;

		$result = $this->pdo->query($sql);
		$result->setFetchMode(PDO::FETCH_ASSOC);
		$events=$result->fetchAll();
        	return $events;
	}
	
	public function delEvent($id,$username)
	{
		global $DBconfig;

        	return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'event where username = \''.$username.'\' AND id='.$id);
	}
	
	public function delAllEvents($username)
	{

		global $DBconfig;
        	return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'event where username = \''.$username.'\'');
	}
}
