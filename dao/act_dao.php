<?php
require_once("dbconfig.php");

class ActDAO
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
	
	public function createAct($ad)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('INSERT INTO '.$DBconfig['DB_PREFIX'].'activity(link,pic,title,intro,thumb) VALUES(?,?,?,?,?)');
		$sth->execute(array($ad['link'], $ad['pic'], $ad['title'], $ad['intro'],
                           $ad['thumb']));
        return $this->pdo->lastInsertId();	
	}

	public function updateAct($ad,$id)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX'].'activity SET link=?,pic=?,title=?,intro=?,thumb=? WHERE id='.$id);
		$sth->execute(array($ad['link'], $ad['pic'], $ad['title'], $ad['intro'],
                           $ad['thumb']));
		//var_dump($sth->errorInfo());
        return $sth->rowCount();	
	}

	public function getAct($limit,$where=null)
	{
		global $DBconfig;

		if($where)
		{
        		$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'activity WHERE '.$where.' ORDER BY post_date LIMIT '.$limit;
		}
		else
		{
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'activity ORDER BY post_date LIMIT '.$limit;
		}		
		//var_dump($sql);
        	$result = $this->pdo->query($sql);
		$result->setFetchMode(PDO::FETCH_ASSOC);
		$ads=$result->fetchAll();
        	return $ads;
	}

	public function getActById($id)
	{
		global $DBconfig;
        	$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'activity WHERE id='.$id;
		
        	$result = $this->pdo->query($sql);
		$ad=$result->fetch(PDO::FETCH_ASSOC);
        	return $ad;
	}

	public function deleteAct($id)
    {
		global $DBconfig;
        	return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'activity where id = '.$id);
    }

	public function getCount($where)
	{
		global $DBconfig;
        	$sql = 'SELECT COUNT(id) FROM '.$DBconfig['DB_PREFIX'].'activity';
		if($where)
		$sql .= ' WHERE '.$where;
        	$num = $this->pdo->query($sql);
	    	$num->setFetchMode(PDO::FETCH_ASSOC);
		$nums=$num->fetch();
        	return $nums['COUNT(id)'];
	}

}
