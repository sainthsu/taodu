<?php
require_once("dbconfig.php");

class ShopDAO
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
	
	public function createShop($ad)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('INSERT INTO '.$DBconfig['DB_PREFIX'].'shop(link,nick,title,intro,thumb,cat,rec_type,shop_type,tip,discount) VALUES(?,?,?,?,?,?,?,?,?,?)');
		$sth->execute(array($ad['link'], $ad['nick'], $ad['title'], $ad['intro'],$ad['thumb'],$ad['cat'],$ad['rec_type'],$ad['shop_type'],$ad['tip'],$ad['discount']));
		//var_dump($sth->errorInfo());
        	return $this->pdo->lastInsertId();	
	}

	public function updateshop($ad,$id)
	{
		global $DBconfig;
		$sth = $this->pdo->prepare('UPDATE '.$DBconfig['DB_PREFIX'].'shop SET link=?,nick=?,title=?,intro=?,thumb=?,cat=?,rec_type=?,shop_type=?,tip=?,discount=? WHERE id='.$id);
		$sth->execute(array($ad['link'], $ad['nick'], $ad['title'], $ad['intro'],$ad['thumb'],$ad['cat'],$ad['rec_type'],$ad['shop_type'],$ad['tip'],$ad['discount']));
		//var_dump($sth->errorInfo());
        return $sth->rowCount();	
	}

	public function getShop($limit,$where=null)
	{
		global $DBconfig;

		if($where)
		{
        	$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'shop WHERE '.$where.' order by id desc LIMIT '.$limit;
		}
		else if($limit)
		{
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'shop order by id desc LIMIT '.$limit;
		}
		else
		{
			$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'shop order by id desc';
		}
		//echo $sql;
        	$result = $this->pdo->query($sql);
		$result->setFetchMode(PDO::FETCH_ASSOC);
		$shops=$result->fetchAll();
        	return $shops;
	}

	public function getShopById($id)
	{
		global $DBconfig;
        $sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'shop WHERE id='.$id;
		
        $result = $this->pdo->query($sql);
		$ad=$result->fetch(PDO::FETCH_ASSOC);
        return $ad;
	}

	public function deleteshop($id)
    {
		global $DBconfig;
        return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'shop where id = '.$id);
    }

	public function getCount($where)
	{
		global $DBconfig;
        $sql = 'SELECT COUNT(id) FROM '.$DBconfig['DB_PREFIX'].'shop';
		if($where)
		$sql .= ' WHERE '.$where;
        $num = $this->pdo->query($sql);
	    $num->setFetchMode(PDO::FETCH_ASSOC);
		$nums=$num->fetch();
        return $nums['COUNT(id)'];
	}

}
