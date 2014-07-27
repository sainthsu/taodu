<?php
require_once("dbconfig.php");

class RecDAO
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
	
	public function createRec($ad)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('INSERT INTO '.$DBconfig['DB_PREFIX'].'recommend(iid,pic,rank,title,st,et) VALUES(?,?,?,?,?,?)');
		$sth->execute(array($ad['iid'], $ad['pic'], $ad['rank'], $ad['title'], $ad['st'],$ad['et']));
		var_dump($sth->errorInfo());
        	return $this->pdo->lastInsertId();	
	}

	public function updateRec($ad,$id)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX'].'recommend SET iid=?,pic=?,rank=?,title=?,st=?,et=? WHERE id='.$id);
		$sth->execute(array($ad['iid'], $ad['pic'], $ad['rank'], $ad['title'], $ad['st'],$ad['et']));
		//var_dump($sth->errorInfo());
        	return $sth->rowCount();	
	}

	public function getRec($limit,$where=null)
	{
		global $DBconfig;

		if($where)
		{
        	$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'recommend WHERE '.$where.' ORDER BY rank LIMIT '.$limit;
		}
		elseif($limit)
		{
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'recommend ORDER BY rank LIMIT '.$limit;
		}
		else
		{
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'recommend ORDER BY rank';
		}		
		
        $result = $this->pdo->query($sql);
		$result->setFetchMode(PDO::FETCH_ASSOC);
		$ads=$result->fetchAll();
        return $ads;
	}

	public function getRecById($id)
	{
		global $DBconfig;
        $sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'recommend WHERE id='.$id;
		
        $result = $this->pdo->query($sql);
		$ad=$result->fetch(PDO::FETCH_ASSOC);
        return $ad;
	}

	public function deleteRec($id)
    {
		global $DBconfig;
        return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'recommend where id = '.$id);
    }

	public function getCount($where)
	{
		global $DBconfig;
        $sql = 'SELECT COUNT(id) FROM '.$DBconfig['DB_PREFIX'].'recommend';
		if($where)
		$sql .= ' WHERE '.$where;
        $num = $this->pdo->query($sql);
	    $num->setFetchMode(PDO::FETCH_ASSOC);
		$nums=$num->fetch();
        return $nums['COUNT(id)'];
	}

}
