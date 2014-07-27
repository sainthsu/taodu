<?php
	$DBconfig = array(
	'DB_HOST'=>'localhost',
	'DB_NAME'=>'wabao',
	'DB_USER'=>'root',
	'DB_PWD'=>'WebDevelop',
	'DB_PORT'=>'3306',
	'DB_PREFIX'=>'taodu_',
	);
/**
 *DOMAIN的基类
 */

class BaseDO{
     /**
     * convert domain to array
     * @return array
     */
    public function toArray()
    {
        $array = array();
        foreach ($this as $key => $value) {
            $array[$key] = $value;
        }
        return $array;
    }

    /**
     * 构造函数
     * @param  $array
     * @return void
     */
     public function __construct($array){
         $this->constructFromArray($array);
     }

    /**
     * construct domain from array
     * @param $array array
     * @return domain
     */
    private  function constructFromArray($array)
    {
        foreach ($this as $key => $value) {
            $value =$array[$key];
            if(empty($array[$key])){
               $value=  $array[strtoupper($key)];
            }
            $this->$key = $value;
        }
        return $this;
    }

}

/**
 * pdo variable
 * @global
 */

$mysqlHost="127.0.0.1";
$mysqlPort='3306';
$dbName='taodu';
$username='root';
$password='hztaqi';
//$password='root3306';
$dbConnection='jdbc:mysql://' . $mysqlHost . ':' . $mysqlPort . '/' . $dbName . '?characterEncoding=GBK&zeroDateTimeBehavior=convertToNull'; 
$tjfqPDO = new PDO($dbConnection, $username, $password);
