<?php
require_once("dbconfig.php");

class GroupDAO
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
	
	public function createGroup($ad)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('INSERT INTO '.$DBconfig['DB_PREFIX'].'group(title,intro,pic,rec_type,pro_list,num,types,price,rank) VALUES(?,?,?,?,?,?,?,?,?)');
		$sth->execute(array($ad['title'], $ad['intro'],
                           $ad['pic'],$ad['rec_type'], $ad['pro_list'], $ad['num'], $ad['types'], $ad['price'], $ad['rank']));
		//var_dump($sth->errorInfo());
        	return $this->pdo->lastInsertId();	
	}

	public function updategroup($ad,$id)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX'].'group SET title=?,intro=?,pic=?,rec_type=?,pro_list=?,num=?,types=?,price=?,rank=? WHERE id='.$id);
		$sth->execute(array($ad['title'], $ad['intro'],$ad['pic'],$ad['rec_type'],$ad['pro_list'],$ad['num'],$ad['types'], $ad['price'],$ad['rank']));
		//var_dump($sth->errorInfo());
        return $sth->rowCount();	
	}

	public function getGroup($limit,$where=null)
	{
		global $DBconfig;

		if($where)
		{
        	$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'group WHERE '.$where.' order by id desc LIMIT '.$limit;
		}
		else if($limit)
		{
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'group order by id desc LIMIT '.$limit;
		}
		else
		{
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'group order by id desc';
		}

		//echo $sql;
        	$result = $this->pdo->query($sql);
		$result->setFetchMode(PDO::FETCH_ASSOC);
		$groups=$result->fetchAll();
        	return $groups;
	}

	public function getGroupById($id)
	{
		global $DBconfig;
        	$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'group WHERE id='.$id;
		//echo $sql;return;
        	$result = $this->pdo->query($sql);
		$ad=$result->fetch(PDO::FETCH_ASSOC);
        	return $ad;
	}

	public function deleteGroup($id)
    {
		global $DBconfig;
        return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'group where id = '.$id);
    }

	public function getCount($where)
	{
		global $DBconfig;
        	$sql = 'SELECT COUNT(id) FROM '.$DBconfig['DB_PREFIX'].'group';
		if($where)
		$sql .= ' WHERE '.$where;
        	$num = $this->pdo->query($sql);
	        $num->setFetchMode(PDO::FETCH_ASSOC);
		$nums=$num->fetch();
        	return $nums['COUNT(id)'];
	}

}
