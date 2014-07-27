<?php
require_once("dbconfig.php");

/**
 * 商品数据访问对象
 * @author Saint Hsu(saint.hsu@outlook.com)
 */
class ProDAO
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
	
	public function resetRank()
	{
		if(date('His')<60){ //00:01:00内
			$this->pdo->query('update `fstk_pro` set rank=500 where rank <= 499 and date(st)!=curdate()');
			$this->pdo->query('update `fstk_pro` set rank=501 where ischeck=3 and date(st)=curdate()');
			$this->pdo->query('delete from `fstk_pro` where et<curdate() and userid<2');
		}
	}

    /**
     * 根据id查询商品
     * @param $id
     * @return VoteItem
     */
    public function findProById($id)
    {
		global $DBconfig;
        $sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'pro WHERE id=' . $id;
        //var_dump($sql);
	
		$rows= $this->pdo->query($sql);
		$result=$rows->fetch(PDO::FETCH_ASSOC);
        return $result;
    }

    public function getProByIid($iid,$field)
    {
	    global $DBconfig;

        $sql = 'SELECT '.$field.' FROM '.$DBconfig['DB_PREFIX'].'pro WHERE iid=' . $iid;
        //var_dump($sql);
	
		$rows= $this->pdo->query($sql);
		$result=$rows->fetch(PDO::FETCH_ASSOC);
        return $result;
    }

	public function createPro($pro)
	{
		global $DBconfig;
		
		$sth = $this->pdo->prepare('INSERT INTO '.$DBconfig['DB_PREFIX'].'pro (title,pic,rec_pic,cat,type,rec_type,shop_type,iid,oprice,nprice,start_time,end_time,rank,num,volume,seller_nick,points,remark,discount,post_date,carriage,user_id,ischeck) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)');
		$sth->execute(array($pro['title'],$pro['pic'],$pro['rec_pic'],$pro['cat'],$pro['type'],$pro['rec_type'],$pro['shop_type'],$pro['iid'],$pro['oprice'],$pro['nprice'],$pro['start_time'],$pro['end_time'],$pro['rank'],$pro['num'],$pro['volume'],$pro['seller_nick'],$pro['points'],$pro['remark'],$pro['discount'],$pro['post_date'],$pro['carriage'],$pro['user_id'],$pro['ischeck']));
		//var_dump($sth->errorInfo());
        return $this->pdo->lastInsertId();
	}

	public function createPros($proList)
	{
		global $DBconfig;
		
		$sth = $this->pdo->prepare('INSERT INTO '.$DBconfig['DB_PREFIX'].'pro (title,pic,cat,type,rec_type,shop_type,iid,oprice,nprice,start_time,end_time,rank,num,volume,seller_nick,points,
is_collect,discount,post_date,carriage,user_id,ischeck,app_link) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)');
		$startTime = $_REQUEST['startTime']?$_REQUEST['startTime']:date("Y-m-d H:i:s");
		$num = $_REQUEST['num']?$_REQUEST['num']:200;
		$type = $_REQUEST['type']?$_REQUEST['type']:2;
		$postdate = date("Y-m-d");
		foreach($proList as $pro)
		{
			$shopType = 1;
			$sth->execute(array(preg_replace(array("/【.*】/","/<.*>/"),'',$pro['title']),$pro['pic_url'],$pro['cat'],$type,0,$shopType,$pro['num_iid'],$pro['price'],$pro['nprice'],$pro['start_time'],$pro['end_time'],500,$num,$pro['volume'],$pro['nick'],0,1,round(10*$pro['nprice']/$pro['price'],2),$postdate,1,0,1,$pro['item_url']));
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
		
		$sql = 'UPDATE '.$DBconfig['DB_PREFIX'].'pro SET '.implode(",",$set).' WHERE id='.$id;
		//echo $sql;
		return $this->pdo->exec($sql);;
	}

	public function updateCheck($id,$state)
	{
		global $DBconfig;
		
		if($id&&$state)
		{
			$sql = 'UPDATE '.$DBconfig['DB_PREFIX'].'pro SET ischeck='.$state.' WHERE id='.$id;
			return $this->pdo->exec($sql);;
		}
	}
    /**
     * 查询所有商品
     * @param $userId number user id
     * @return VoteItem[]
     */
    public function findPro($where,$order,$limit,$field='*')
    {
		global $DBconfig;
        

        $sql = 'SELECT '.$field.' FROM '.$DBconfig['DB_PREFIX'].'pro WHERE '.$where.' ORDER BY '.$order.' LIMIT '.$limit;
		//var_dump($sql);	
		$result=$this->pdo->query($sql);
		
		$list=$result->fetchAll(PDO::FETCH_ASSOC);
		//var_dump($result->errorInfo());
	
        return $list;
    }
	

    public function getTreasure($rec_type,$limit)
    {
		return $this->findPro("type=1 AND rec_type=$rec_type","ischeck,rank,id desc",$limit);
    }

    public function getSpecial($rec_type,$limit)
    {
		$date = date("Y-m-d",time()-5*3600*24);
		return $this->findPro("type=2 AND rec_type=$rec_type AND post_date>='$date'","ischeck,rank,id desc",$limit);
    }

    public function getExchange($rec_type,$limit)
    {
		return $this->findPro("type=3 AND rec_type=$rec_type","ischeck,rank,id desc",$limit);       
    }

    public function getBigCat($big_type,$limit)
    {
         switch($big_type)
		{
			case 1:
			$types = '(1,2)';
			break;
			case 2:
			$types = '(3,4)';
			break;
			case 3:
			$types = '(5,6)';
			break;
			case 4:
			$types = '(7,8)';
			break;
		}
	
		return $this->findPro("cat in $types AND rec_type=5 AND type=2","post_date desc",$limit);
    }
	
	public function getRecommend($rec_type,$limit)
	{
		return $this->findPro("rec_type=".$rec_type." AND type=2","id desc",$limit);
	}

	public function getBigRecommend($big_type,$limit)
    {
        switch($big_type)
		{
			case 1:
			$types = '(1,2)';
			break;
			case 2:
			$types = '(3,4)';
			break;
			case 3:
			$types = '(5,6)';
			break;
			case 4:
			$types = '(7,8)';
			break;
		}
	
		return $this->findPro("cat in $types AND rec_type=4 AND type=2","rank",$limit);
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
        $sql = 'SELECT COUNT(id) FROM '.$DBconfig['DB_PREFIX'].'pro WHERE '.$where;
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

    public function deletePro($username)
    {
		global $DBconfig;
        return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'pro where uid in (select uid from'.$DBconfig['DB_PREFIX'].'user where username=\''.$username.'\')');
    }

    public function deleteProById($id)
    {
		global $DBconfig;
        return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'pro where id='.$id);
    }

}

