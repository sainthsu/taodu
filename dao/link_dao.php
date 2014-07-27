<?php
require_once("dbconfig.php");

class LinkDAO
{
	/**
     * @var \PDO
     */
    protected $pdo;
	
    public function __construct()
    {
        global $tjfqPDO;
        $this->pdo =  $tjfqPDO;
    }
	
	public function createLink($link)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('INSERT INTO '.$DBconfig['DB_PREFIX'].'flink(link,type,mini_logo,big_logo,token,wangwang) VALUES(?,?,?,?,?,?)');
		$sth->execute(array($link['link'], $link['type'],$link['mini_logo'],$link['big_logo'],$link['token'], $link['wangwang']));
				//var_dump($sth->errorInfo());
        return $this->pdo->lastInsertId();
	}

	public function updateLink($link,$id)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX'].'flink SET link=?,type=?,mini_logo=?,big_logo=?,wangwang=? WHERE id='.$id);
		$sth->execute(array($link['link'], $link['type'], $link['mini_logo'], $link['big_logo'], $link['wangwang']));
		//var_dump($sth->errorInfo());
        return $sth->rowCount();	
	}

	public function updateClick($token)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX'].'flink SET click=click+1 WHERE token=\''.$token.'\'');
		$sth->execute();
		//var_dump($sth->errorInfo());
        return $sth->rowCount();	
	}


	public function updateClickById($id)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX'].'flink SET click=click+1 WHERE id=\''.$id.'\'');
		$sth->execute();
		//var_dump($sth->errorInfo());
        return $sth->rowCount();	
	}

	public function getLink($limit,$where=null)
	{
		global $DBconfig;

		if($where)
		{
        		$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'flink WHERE '.$where.' ORDER BY click desc LIMIT '.$limit;
		}
		else if($limit)
		{
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'flink ORDER BY click desc LIMIT '.$limit;
		}
		else
		{		
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'flink ORDER BY click desc';
		}
        $result = $this->pdo->query($sql);
		$result->setFetchMode(PDO::FETCH_ASSOC);
		$links=$result->fetchAll();
        return $links;
	}

	public function getLinkById($id)
	{
		global $DBconfig;
        $sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'flink WHERE id='.$id;
		
        $result = $this->pdo->query($sql);
		$link=$result->fetch(PDO::FETCH_ASSOC);
        return $link;
	}

	public function getLinkByToken($token)
	{
		global $DBconfig;
        $sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'flink WHERE token=\''.$token.'\'';
		
        $result = $this->pdo->query($sql);
		$link=$result->fetch(PDO::FETCH_ASSOC);
        return $link;
	}

	public function deleteLink($id)
    {
		global $DBconfig;
        return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'flink where id = '.$id);
    }

	public function getCount($where)
	{
		global $DBconfig;
        $sql = 'SELECT COUNT(id) FROM '.$DBconfig['DB_PREFIX'].'flink';
		if($where)
		$sql .= ' WHERE '.$where;
        $num = $this->pdo->query($sql);
	    $num->setFetchMode(PDO::FETCH_ASSOC);
		$nums=$num->fetch();
        return $nums['COUNT(id)'];
	}

}
