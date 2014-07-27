<?php
require_once("dbconfig.php");

/**
 * 商品数据访问对象
 * @author Saint Hsu(saint.hsu@outlook.com)
 */
class CollectDAO
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

    /**
     * 根据id查询商品
     * @param $id
     * @return VoteItem
     */
    public function getProById($id)
    {
		global $DBconfig;
        $sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'collect WHERE id=' . $id;
        //var_dump($sql);
	
	$rows= $this->pdo->query($sql);
	$result=$rows->fetch(PDO::FETCH_ASSOC);
        return $result;
    }
    public function getProByIid($iid,$field)
    {
	    global $DBconfig;

        $sql = 'SELECT '.$field.' FROM '.$DBconfig['DB_PREFIX'].'collect WHERE num_iid=' . $iid;
        //var_dump($sql);
	
	$rows= $this->pdo->query($sql);
	$result=$rows->fetch(PDO::FETCH_ASSOC);
        return $result;
    }

	public function createPro($proList,$c)
	{
		global $DBconfig;
		
		$sth = $this->pdo->prepare('INSERT INTO '.$DBconfig['DB_PREFIX'].'collect (num_iid,nick,title,pic_url,item_url,cat,price,nprice,start_time,end_time,volume) VALUES(?,?,?,?,?,?,?,?,?,?,?)');
		foreach($proList as $pro)
		{
			if($pro['nprice'])
			{
				$sth->execute(array($pro['num_iid'],$pro['nick'],$pro['title'],$pro['pic_url'],$pro['item_url'],$c,$pro['price'],$pro['nprice'],$pro['start_time'],$pro['end_time'],$pro['volume']));
			}
		//var_dump($sth->errorInfo());
		}
        return $this->pdo->lastInsertId();
	}

	public function updatePro($pro,$id)
	{
		global $DBconfig;

		foreach($pro as $key=>$value)
		{
			if($key=='nprice'||$key=='oprice'||$key=='rank')
			{
				$set[]= $key.'='.$value;
			}
			else if(isset($value))
			{
				$set[]= $key.'=\''.$value.'\'';
			}
			else
			continue;
		}
		
		$sql = 'UPDATE '.$DBconfig['DB_PREFIX'].'collect SET '.implode(",",$set).' WHERE id='.$id;
		//echo $sql;
		return $this->pdo->exec($sql);;
	}

    /**
     * 查询所有商品
     * @param $userId number user id
     * @return VoteItem[]
     */
    public function getPros($where,$order,$limit)
    {
		global $DBconfig;
        

        	$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'collect WHERE '.$where.' ORDER BY '.$order.' limit '.$limit;
	//var_dump($sql);	
		$result=$this->pdo->query($sql);
		
		$list=$result->fetchAll(PDO::FETCH_ASSOC);
	//var_dump($result->errorInfo());
	
        	return $list;
    }

     public function getList($table,$field='*',$where='')
	{
		$field=$field?$field:'*';
		$sql="SELECT ".$field." FROM ".$table." ".$where;
		//var_dump($sql);return;
		$result=$this->pdo->query($sql);
		$list=$result->fetchAll(PDO::FETCH_ASSOC);

        	return $list;
	}

	/*
	public function getMoreByWhere($where)
	{
		global $DBconfig;
		$items = array();
        $sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'pro WHERE '.$where.' order by rank,date(st) desc,volume desc limit 8,8';	
		$result=$this->pdo->query($sql);
		$result->setFetchMode(PDO::FETCH_ASSOC);

        foreach ($result->fetchAll() as $row)
		{
            $items[] = new Pro($row);
        }
        return $items;
	}
	*/

	public function getNumByWhere($where)
	{
		global $DBconfig;
        	$sql = 'SELECT COUNT(id) FROM '.$DBconfig['DB_PREFIX'].'collect WHERE '.$where;
        	$num = $this->pdo->query($sql);
	        $num->setFetchMode(PDO::FETCH_ASSOC);
		$nums=$num->fetch();
        	return $nums['COUNT(id)'];
	}
	
    /**
     * 删除商品
     * @param $id number id
     * @return void
     */

    public function deleteProById($id)
    {
		global $DBconfig;
        	return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'collect where id='.$id);
    }

    public function clearPro()
    {
		global $DBconfig;
        return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'collect');
    }
}

