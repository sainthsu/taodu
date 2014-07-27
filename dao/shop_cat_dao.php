<?php
require_once("dbconfig.php");




/**
 * 商品的分类
 * @author Saint Hsu(saint.hsu@outlook.com)
 */
class ShopCat extends BaseDO
{
    
    /**
     * 分类id
     * @var id
     */
    public $id;

   /**
     *点击数
     * @var click
     */
    public $click;

    /**
     * 名称
     * @var name
     */
    public $name;
	public $rank;//排列
	public $pic;
	public $intro;
	public $isshow;

}

/**
 * 商品分类数据访问层
 * @author Saint Hsu(saint.hsu@outlook.com)
 */
class ShopCatDAO
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
   * 根据id查询投票分类
   * @param  $id
   * @return VoteCat
   */
    public function findShopCatById($id)
    {
		global $DBconfig;
        $sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'shopcat WHERE id='.$id;
        $row = $this->pdo->query($sql)->fetch();
        return $row;
    }

	public function getShopCatList()
	{
		global $DBconfig;
		$sql = 'SELECT * FROM '.$DBconfig['DB_PREFIX'].'shopcat ORDER BY rank';
		$result = $this->pdo->query($sql);
		$result->setFetchMode(PDO::FETCH_ASSOC);
		$catList=$result->fetchAll();
		return $catList;		
	}
    /**
     * createShopCat
     * @param $shopCat
     * @return catid
     */
    public function createShopCat($shopCat)
    {
	global $DBconfig;
        $sth = $this->pdo->prepare('insert into '.$DBconfig['DB_PREFIX'].'shopcat ( name, rank, is_show)
                           values(?,?,?)');
        $sth->execute(array($shopCat['name'], $shopCat['rank'],$shopCat['is_show']));
		var_dump($sth->errorInfo());
        return $this->pdo->lastInsertId();
    }

    /**
     * update updateShopCat
     * @param $shopCat
     * @return void
     */
    public function updateShopCat($shopCat,$id)
    {
		global $DBconfig;
        $sth = $this->pdo->prepare('update '.$DBconfig['DB_PREFIX'].'shopcat set name = ?, rank = ?,is_show = ? WHERE id='.$id);
        $sth->execute(array($shopCat['name'], $shopCat['rank'], $shopCat['is_show'],));
		return $sth->rowCount();
    }

	public function updateClickById($id)
	{
		global $DBconfig;
		$sql = 'SELECT click FROM '.$DBconfig['DB_PREFIX'].'shopcat WHERE id=' . $id;
		$click = $this->pdo->query($sql)->fetch();
		$num=++$click['click'];
		$sth = $this->pdo->prepare('update '.$DBconfig['DB_PREFIX'].'shopcat set click = ?');
		$sth->execute($num);
		return $sth->rowCount();
	}
    /**
     * deleteShopCat
     * @param $id number
     * @return void
     */
    public function deleteShopCat($id)
    {
		global $DBconfig;
        return $this->pdo->exec('DELETE FROM '.$DBconfig['DB_PREFIX'].'shopcat WHERE id = ' . $id);
    }
}

