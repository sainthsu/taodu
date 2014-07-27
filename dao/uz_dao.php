<?php
require_once("dbconfig.php");

/**
 * U站数据访问对象
 * @author Saint Hsu(saint.hsu@outlook.com)
 */
class UzDAO
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
     * 根据id查询U站
     * @param $id
     * @return VoteItem
     */
    public function getUzById($id)
    {
		global $DBconfig;
        $sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'uz WHERE id=' . $id;
        //var_dump($sql);
	
		$rows= $this->pdo->query($sql);
		$result=$rows->fetch(PDO::FETCH_ASSOC);
        return $result;
    }

    public function getUzByUrl($url,$field)
    {
	    global $DBconfig;

        $sql = 'SELECT '.$field.' FROM '.$DBconfig['DB_PREFIX'].'uz WHERE url=\'' . $url.'\'';
        //var_dump($sql);
	
		$rows= $this->pdo->query($sql);
		$result=$rows->fetch(PDO::FETCH_ASSOC);
        return $result;
    }

	public function createUz($uz)
	{
		global $DBconfig;
		
		if(is_array($uz))
		{
			$keys = array_keys($uz);
			$values = array_values($uz);
			$size = count($keys);
			for($i=0;$i<$size;$i++)
			{
				if($i != 0)
				$str .= ',?';
				else
				$str .= '?';
			}
		}
		$sth = $this->pdo->prepare('INSERT INTO '.$DBconfig['DB_PREFIX'].'uz 
		('.implode($keys,',').')
		VALUES('.$str.')');
		
		$sth->execute($values);
			
		//var_dump($sth->errorInfo());
        return $this->pdo->lastInsertId();
	}

	public function updateUz($pro,$id)
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
		
		$sql = 'UPDATE '.$DBconfig['DB_PREFIX'].'uz SET '.implode(",",$set).' WHERE id='.$id;
		//echo $sql;
		return $this->pdo->exec($sql);;
	}

    /**
     * 查询所有U站
     * @param $userId number user id
     * @return VoteItem[]
     */
    public function getUzs($where,$order,$limit)
    {
		global $DBconfig;

        $sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'uz WHERE '.$where.' ORDER BY '.$order.' limit '.$limit;
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

	public function getNumByWhere($where=1)
	{
		global $DBconfig;
        $sql = 'SELECT COUNT(id) FROM '.$DBconfig['DB_PREFIX'].'uz WHERE '.$where;
        $num = $this->pdo->query($sql);
	    $num->setFetchMode(PDO::FETCH_ASSOC);
		$nums=$num->fetch();
        return $nums['COUNT(id)'];
	}
	
    /**
     * 删除U站
     * @param $id number id
     * @return void
     */

    public function deleteUzById($id)
    {
		global $DBconfig;
        return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'uz where id='.$id);
    }

    public function clearUz()
    {
		global $DBconfig;
        return $this->pdo->exec('delete from '.$DBconfig['DB_PREFIX'].'uz');
    }
}

