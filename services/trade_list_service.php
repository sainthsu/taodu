<?

include_once '../top/topclient.php';
include_once '../top/TaobaokeReportGetRequest.php';

/***********************************************
 *  get trade list                             *
 *  获取交易列表                                 *
 *											   *
 ***********************************************/
class TradeList
{
	public $tradeList;

	function __construct()
	{
			$client = new TopClient;
			$client->appkey = trim('12032290');
			$client->secretKey = trim('9920d54591bb8b7b3f6e3a0d14487a7a');
			$req = new TaobaokeReportGetRequest;
			$req->setFields("pay_time,num_iid,item_title");
			$req->setDate(date('Ymd'));
			$resp = $client->execute($req);
			$resp=self::object_to_array($resp->taobaoke_report->taobaoke_report_members);

			foreach($resp['taobaoke_report_member'] as $v){
				$v['pay_time']=explode(' ',$v['pay_time']);
				$v['pay_time']=$v['pay_time'][1];
				$v['item_title']=preg_replace('/【.*?】/s','',$v['item_title']);
				$list[]=$v;
			}
			$this->tradeList = $list;
	}

	public function getTradeList()
	{
		return $this->tradeList;
	}

	private function object_to_array($obj)
	{
		$_arr = is_object($obj) ? get_object_vars($obj) : $obj;
		foreach ($_arr as $key => $val)
		{
			$val = (is_array($val) || is_object($val)) ? self::object_to_array($val) : $val;
			$arr[$key] = $val;
		}
		return $arr;
	}

}
?>
