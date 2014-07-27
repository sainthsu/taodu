<?php
require_once("dbconfig.php");




/**
 * ��Ʒ�ķ���
 * @author Saint Hsu(saint.hsu@outlook.com)
 */
class ProCat extends BaseDO
{
    
    /**
     * ����id
     * @var id
     */
    public $id;

   /**
     *�����
     * @var click
     */
    public $click;

    /**
     * ����
     * @var name
     */
    public $name;
	public $rank;//����
	public $pic;
	public $intro;
	public $isshow;

}

/**
 * ��Ʒ�������ݷ��ʲ�
 * @author Saint Hsu(saint.hsu@outlook.com)
 */
class ProCatDAO
{
    /**
     *
     * @var $pdo
    */
    protected $pdo;

    public function __construct()
    {
        global $tjfqPDO;
        $this->pdo =  $tjfqPDO;
    }

  /**
   * ����id��ѯͶƱ����
   * @param  $id
   * @return VoteCat
   */
    public function findProCatById($id)
    {
		global $DBconfig;
        $sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'procat WHERE id='.$id;
        $row = $this->pdo->query($sql)->fetch();
        return $row;
    }

	public function getProCatList()
	{
		global $DBconfig;
		$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'procat ORDER BY rank';
		$result = $this->pdo->query($sql);
		$result->setFetchMode(PDO::FETCH_ASSOC);
		$catList=$result->fetchAll();
		return $catList;		
	}
    /**
     * createProCat
     * @param $proCat
     * @return catid
     */
    public function createProCat($proCat)
    {
	global $DBconfig;
        $sth = $this->pdo->prepare('insert into '.$DBconfig['DB_PREFIX'].'procat ( name, rank, is_show)
                           values(?,?,?)');
        $sth->execute(array($proCat['name'], $proCat['rank'],$proCat['is_show']));
		//var_dump($sth->errorInfo());
        return $this->pdo->lastInsertId();
    }

    /**
     * update updateProCat
     * @param $proCat
     * @return void
     */
    public function updateProCat($proCat,$id)
    {
		global $DBconfig;
        $sth = $this->pdo->prepare('update '.$DBconfig['DB_PREFIX'].'procat set name = ?, rank = ?,is_show = ? WHERE id='.$id);
        $sth->execute(array($proCat['name'], $proCat['rank'], $proCat['is_show'],));
		return $sth->rowCount();
    }

	public function updateClickById($id)
	{
		global $DBconfig;
		$sql = 'SELECT click FROM '.$DBconfig['DB_PREFIX'].'procat WHERE id=' . $id;
		$click = $this->pdo->query($sql)->fetch();
		$num=++$click['click'];
		$sth = $this->pdo->prepare('update '.$DBconfig['DB_PREFIX'].'procat set click = ?');
		$sth->execute($num);
		return $sth->rowCount();
	}
    /**
     * deleteProCat
     * @param $id number
     * @return void
     */
    public function deleteProCat($id)
    {
		global $DBconfig;
        return $this->pdo->exec('DELETE FROM '.$DBconfig['DB_PREFIX'].'procat WHERE id = ' . $id);
    }
}

