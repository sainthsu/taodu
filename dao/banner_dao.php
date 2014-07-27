<?php
require_once("dbconfig.php");

class BannerDAO
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
	
	public function createBanner($ad)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('INSERT INTO '.$DBconfig['DB_PREFIX'].'banner(link,pic,rank,title,remark,start_time,end_time,target,cat) VALUES(?,?,?,?,?,?,?,?,?)');
		$sth->execute(array($ad['link'], $ad['pic'], $ad['rank'], $ad['title'],
                           $ad['remark'], $ad['start_time'],$ad['end_time'],$ad['target'],$ad['cat']));
		var_dump($sth->errorInfo());
        	return $this->pdo->lastInsertId();	
	}

	public function updateBanner($ad,$id)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX'].'banner SET link=?,pic=?,rank=?,title=?,remark=?,start_time=?,end_time=?,target=?,cat=? WHERE id='.$id);
		$sth->execute(array($ad['link'], $ad['pic'], $ad['rank'], $ad['title'],
                           $ad['remark'], $ad['start_time'],$ad['end_time'],$ad['target'],$ad['cat']));
		//var_dump($sth->errorInfo());
        return $sth->rowCount();	
	}

	public function getBanner($limit,$where=null)
	{
		global $DBconfig;

		if($where)
		{
        	$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'banner WHERE '.$where.' ORDER BY end_time LIMIT '.$limit;
		}
		else if($limit)
		{
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'banner ORDER BY end_time LIMIT '.$limit;
		}		
		//var_dump($sql);return;
        	$result = $this->pdo->query($sql);
		$result->setFetchMode(PDO::FETCH_ASSOC);
		$ads=$result->fetchAll();
        	return $ads;
	}

	public function getBannerById($id)
	{
		global $DBconfig;
        $sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'banner WHERE id='.$id;
		
        $result = $this->pdo->query($sql);
		$ad=$result->fetch(PDO::FETCH_ASSOC);
        return $ad;
	}

	public function deleteBanner($id)
    {
		global $DBconfig;
        return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'banner where id = '.$id);
    }

	public function getCount($where)
	{
		global $DBconfig;
        $sql = 'SELECT COUNT(id) FROM '.$DBconfig['DB_PREFIX'].'banner';
		if($where)
		$sql .= ' WHERE '.$where;
        $num = $this->pdo->query($sql);
	    $num->setFetchMode(PDO::FETCH_ASSOC);
		$nums=$num->fetch();
        return $nums['COUNT(id)'];
	}

}
