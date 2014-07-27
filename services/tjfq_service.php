<?php
include("../dao/pro_cat_dao.php");
include("../dao/pro_dao.php");
include("../dao/banner_dao.php");
include("trade_list_service.php");
include("func.php");


class Tejiafengqiang
{
	public static $type_sqls=array();
	public static $nav_types=array();
	public static $today_date='';
	public static $et='';
	public static $where='';
	public static $ads;

	public static $bannerDAO;
	public static $proDAO;
	public static $proCatDAO;
	public static $tradeList;
	public static $catList;

	public function __construct()
	{
		self::$type_sqls=array(
		' and 0<nprice and nprice<15',
		' and 15<=nprice and nprice<40',
		' and nprice>=40'
		);
		self::$today_date=date('Y-m-d');

		self::$et = date('Hi')<=910?self::$today_date:self::$today_date.' 9:00';

		self::$where="date(st)<='".self::$today_date."' and et>'".self::$et."' and ischeck!=2 and type!=10 and length(iid)<18";

		self::$nav_types=array('0'=>'9.9����','1'=>'39�ⶥ','2'=>'����1-5��');

		self::$proDAO = new ProDAO();
		self::$proCatDAO = new ProCatDAO();
		self::$bannerDAO = new BannerDAO();
//		self::$tradeList = new TradeList();
		self::$catList = self::$proCatDAO->getProCatList();
	}

	public function index()
	{   
		self::$proDAO->resetRank();
		$this->category();
		return;
	}

	public function category()
	{
		$nav_types=self::$nav_types;
//		$tradeList=self::$tradeList->getTradeList();
		$catList = self::$proCatDAO->getProCatList();
		//$links=self::$proDAO->getList('fstk_link','','order by rank');
		//$ads=self::$adDAO->getAd(3,'cat=0 and st<=\''.self::$today_date.'\' and et>=\''.self::$today_date.'\'');
		$page_size=55;

		$type = isset($_REQUEST['type'])?(int)$_REQUEST['type']:NULL;
		$order=$_REQUEST['order']?$_REQUEST['order']:'rank,date(st) desc,cat,volume desc';
		$id = $_REQUEST['id'];
		//$q = $_GET['q'];
		parse_str($_SERVER['QUERY_STRING'],$arr);
		foreach($arr as $key=>$val)
		{
			if($key == 'q')
			{
				$q = $val;
				break;
			}
		}

		$page=$_REQUEST['page']?(int)$_REQUEST['page']:1;
		$hd = $_REQUEST['hd'];
		$xl = $_REQUEST['xl'];
		$zk = $_REQUEST['zk'];
		$date=$_REQUEST['date']=='today'?date('Y-m-d'):$_REQUEST['date'];
		
		$getArray = array(
			'type'=>$type,
			'order'=>$order,
			'id'=>$id,
			'q'=>$q,
			'page'=>$page,
			'hd'=>$hd,
			'xl'=>$xl,
			'zk'=>$zk,
		);

		if($type==6)
		{
			$sql = str_replace('type!=10','type=10',self::$where);
		}
		elseif(is_null($type))
		{
			$sql = self::$where;
		}else{
			$sql = self::$where.self::$type_sqls[$type];
		}

		if($hd==1)
		{
			$sql2.=' and carriage=1';
		}

		if($xl)
		{
			$sql2.=' and volume>='.str_replace('-',' and volume<=',$xl);
		}

		if($zk)
		{
			$sql2.=' and zk>='.str_replace('-',' and zk<=',$zk);
		}

		if($q)
		{
			$sql2.=' and title like \'%'.$q.'%\'';
		}

		if($id)
		{
			$sql2.=' and cat='.$id;
		}

		if($date)
		{
			$sql=str_replace("<='".self::$today_date,"='".$date,$sql).' and type=4';
		}

		$sql.=$sql2;
//		$px=array('id'=>'����ʱ��','nprice'=>'�۸�','volume desc'=>'����','zk'=>'�ۿ�');
//		$xlarr=array('10-100'=>'10-100','100-500'=>'100-500','500-1000'=>'500-1000','1000-99000'=>'����1000');
//		$zkarr=array('0.01-1.5'=>'1��','1.5-2.5'=>'2��','2.5-3.5'=>'3��','3.5-4.5'=>'4��','4.5-5.5'=>'5��','5.5-6.5'=>'6��','6.5-7.5'=>'7��','7.5-8.5'=>'8��');
		

//		$orderurl=getPageStr('order,page');
//		$hdurl=getPageStr('hd,page,uid');
		$idurl=getPageStr('id,page,uid,action');
//		foreach($px as $k=>$v)
//		{
//					if($order!='rank,date(st) desc,cat,volume desc'&&(strstr($order,'desc')&&!strstr($k,'volume'))) 
//						$v.='<em class=up></em>';
//					else
//						$v.='<em></em>';
//						
//					if(strstr($k,'nprice')&&!strstr($order,'desc'))
//						$k='nprice desc';
//						
//					if(strstr($k,str_replace(' desc','',$order)))
//						$k.='" class="on';
//					
//					if($order=='rank,date(st) desc,cat,volume desc'&&$k=='id')
//						$k.='" class="on';
//						
//					$pxarr[]='<a href="/d/index&'.$idurl.'order='.$k.'">'.$v.'</a> ';
//		}
//		$zkurl=getPageStr('zk,page,uid');
//		$xlurl=getPageStr('xl,page,uid');
		$url = array(
			'order'=>$orderurl,
			'hd'=>$hdurl,
			'id'=>$idurl,
			'zk'=>$zkurl,
			'xl'=>$xlurl,
		);
					
		$nums=self::$proDAO->getTejiaNumByWhere($sql);
		$pageStr=multi($nums,$page_size,$page,'/d/index?'.getPageStr('page'));

		$pros1=array();
		$str='';$str1='';
		if($page==1&&date('H')<10&&!$date&&$type!=6){
			//���ҷ�������
			$pros1=self::$proDAO->findTejiaPro(str_replace("date(st)<='".self::$today_date."'","st>='".self::$today_date." 10:00' and userid>1",$sql),$order,'0,8');
			
			//�����Ѿ���ʼ��
			$pros=self::$proDAO->findTejiaPro(str_replace("date(st)<='".self::$today_date."'","st<'".self::$today_date." 10:00'",$sql),$order,$page_size*($page-1).",".$page_size);
		}elseif(date('H')<10&&!$date&&$type!=6){
			//�����Ѿ���ʼ��
			$pros=self::$proDAO->findTejiaPro(str_replace("date(st)<='".self::$today_date."'","st<'".self::$today_date." 10:00'",$sql),$order,$page_size*($page-1).",".$page_size);
		}else
			$pros=self::$proDAO->findTejiaPro($sql,$order,$page_size*($page-1).",".$page_size);


		if(count($pros1)==8){
			$pros1=$this->formatPro($pros1);
			$total=self::$proDAO->getTejiaNumByWhere(str_replace("date(st)<='".self::$today_date."'","st>='".self::$today_date." 10:00' and date(st)='".self::$today_date."' and userid>1 and type=4",$sql));
			$str .= '<div class="module_title"><span title="ר�˿��ۣ������Ƽ�" class="md_title_item active ">��ѡ����</span></div><div style="padding-bottom:10px;border-top:1px solid #FFCC7F;border-bottom:1px solid #FFCC7F;background-color:#FFFFE5;margin-bottom: 10px;"><div class="recpro_list"><ul>';
			$str1.='</ul></div><div class="block25"></div><div style="text-align:center;font-size:15px;color:#000">���չ� '.$total.' �� '.$nav_types[$type].' '.$catList[$id-1]['name'].' ��ѡ���������Ż���Ʒ��10�㿪����ʱ�仹û��������ʣ�� '.($total-8).' �����ǰ��׷ŵ���<a href="/d/jing?action=cate&date=today" target="_blank">�������鿴</a>��  <br>������ �������ȿ�������С��Ϊ�����������ȫ���ĳ�ֵ����ม�</div></div>';
		}else{
			$pros=array_slice($pros,0,$page_size-count($pros1));
			$pros=array_merge($pros1,$pros);
			unset($pros1);
//			if(date('H')>=10){
//				$str2='<div class="module_title"><span title="������" class="md_title_item active ">���糡10:00</span><span title="'.(date('H')>=14?'������':'������ʼ').'" class="md_title_item">���糡14:00</span></div>';
//				$pros2=self::$proDAO->findPro(str_replace("st<'".self::$today_date." 14:00'",'st=\''.date('Y-m-d 14:00').'\'',self::$where),'rank,date(st) desc,cat,volume desc');
//				$pros2 = $this->formatPro($pros2);
//			}
		}

		$pros=$this->formatPro($pros);
		
		//�ؼ۷��������Ż�
		$tejianum = self::$proDAO->getTejiaNumByWhere("st>='".self::$today_date." 10:00' and date(st)='".self::$today_date."' and userid>1 and type=4 and st<'".self::$today_date." 14:00' and et>'".self::$et."' and ischeck!=2 and length(iid)<18");
		//�����ۿ۶����Ż�
		$bujienum = self::$proDAO->getTejiaNumByWhere("st>='".self::$today_date." 10:00' and date(st)='".self::$today_date."' and userid>1 and type=8 and st<'".self::$today_date." 14:00' and et>'".self::$et."' and ischeck!=2 and length(iid)<18");

		$smarty = new Smarty();
		$now = date('Y-m-d H:i');
		$smarty->assign("request",$_REQUEST);
		$smarty->assign("q",$q);
		$smarty->assign("getArray",$getArray);
		$smarty->assign("url",$url);
		$smarty->assign("pxarr",$pxarr);
		$smarty->assign("zkarr",$zkarr);
		$smarty->assign("xlarr",$xlarr);
		$smarty->assign("now",$now);
		$smarty->assign("nav_types",$nav_types);
		$smarty->assign("catList",$catList);
		$smarty->assign("str1",$str1);
		$smarty->assign("str2",$str2);
		$smarty->assign("str",$str);
		$smarty->assign("ads",$ads);
		$smarty->assign("pros1",$pros1);
		$smarty->assign("pros2",$pros2);
		$smarty->assign("links",$links);
		$smarty->assign("pros",$pros);
		$smarty->assign("pageStr",$pageStr);
		$smarty->assign("tejianum",$tejianum);
		$smarty->assign("bujienum",$bujienum);
		
		$smarty->display("templates/index.tpl");
	}
	
	public function formatPro($pros){
		foreach($pros as &$v)
		{
				$v['link']='http://item.taobao.com/item.htm?id='.$v['iid'];
		  		$v['carriage']=$v['carriage']?'����':'';

		  		if($v['userid']>1&&$v['type']==4)
	      		{
			  		$v['ptitle']='�����ҡ�';
//			  		$v['pname']='�������Ҽ۸�';
//			  		$v['buyed']='�ؼ۷������ҿ�����';
				}
				elseif($v['userid']>1&&$v['type']==7)
				{
					$v['ptitle']='��ʮԪ�꡿';
				}
				elseif($v['userid']>1&&$v['type']==8)
				{
					$v['ptitle']='����������';
//					$v['pname']='����������';
//					$v['buyed']='bujie.com����';
		  		}
		  		elseif($v['userid']>1&&$v['type']==1)
	      		{
			  		$v['ptitle']='��ר��';
//			  		$v['pname']='Vipר���';
//			  		$v['buyed']='Vipzxq.com����';
		  		}
		  		else
		  		{
					if($v['type']==5)
						$v['ptitle']='����Ա��';
					else
						$v['ptitle']=$v['rank']==499||$v['type']==99?'�����':'';
						
//			  		$v['pname']='�����۸�';
//			  		$v['buyed']='30�����۳�<b>'.$v['volume'].'</b>��';
		  		}

		  		$v['title']=preg_replace('/��.*?��/s','',$v['title']);
				$v['oprice']=number_format($v['oprice']);
				$v['nprice']=number_format($v['nprice'],1);
				$v['num']=$v['num']?$v['num']:100;
				$v['zhuangtai'] = $this->zhuangtai($v['ischeck'],$v['st'],$v['et']);
					
		}
		return $pros;
	}

	public function yugao()
	{
		$nav_types=self::$nav_types;
//		$tradeList=self::$tradeList->getTradeList();
		$catList = self::$proCatDAO->getProCatList();
		$links=self::$proDAO->getList('fstk_link','','order by rank');

		$px=array('id'=>'����ʱ��','nprice'=>'�۸�','volume desc'=>'����','zk'=>'�ۿ�');
		$xlarr=array('10-100'=>'10-100','100-500'=>'100-500','500-1000'=>'500-1000','1000-99000'=>'����1000');
		$zkarr=array('0.01-1.5'=>'1��','1.5-2.5'=>'2��','2.5-3.5'=>'3��','3.5-4.5'=>'4��','4.5-5.5'=>'5��','5.5-6.5'=>'6��','6.5-7.5'=>'7��','7.5-8.5'=>'8��');
		

		$orderurl=getPageStr('order,page');
		$hdurl=getPageStr('hd,page,uid');
		$idurl=getPageStr('id,page,uid,action');
		foreach($px as $k=>$v)
		{
					if($order!='rank,date(st) desc,cat,volume desc'&&(strstr($order,'desc')&&!strstr($k,'volume'))) 
						$v.='<em class=up></em>';
					else
						$v.='<em></em>';
						
					if(strstr($k,'nprice')&&!strstr($order,'desc'))
						$k='nprice desc';
						
					if(strstr($k,str_replace(' desc','',$order)))
						$k.='" class="on';
					
					if($order=='rank,date(st) desc,cat,volume desc'&&$k=='id')
						$k.='" class="on';
						
					$pxarr[]='<a href="/d/index&'.$idurl.'order='.$k.'">'.$v.'</a> ';
		}
		$zkurl=getPageStr('zk,page,uid');
		$xlurl=getPageStr('xl,page,uid');
		$url = array(
			'order'=>$orderurl,
			'hd'=>$hdurl,
			'id'=>$idurl,
			'zk'=>$zkurl,
			'xl'=>$xlurl,
		);

		$smarty = new Smarty();
		$smarty->assign("request",$_REQUEST);
		$smarty->assign("getArray",$getArray);
		$smarty->assign("pxarr",$pxarr);
		$smarty->assign("zkarr",$zkarr);
		$smarty->assign("xlarr",$xlarr);
		$smarty->assign("nav_types",$nav_types);
		$smarty->assign("catList",$catList);
		$smarty->assign("tradeList",$tradeList);
		$smarty->assign("links",$links);
		
		$smarty->display("templates/yugao.tpl");
		
	}

	private function zhuangtai($zt,$st,$et)
	{
		if($zt==3||date('Y-m-d Hi')>$et) return '<span class="beauty_link_b end">�ѽ���</span>';
		if(date('Y-m-d H:i')<$st){
			return '<span class="beauty_link_b unstart">δ��ʼ</span>';
		}else{
			return '<span class="beauty_link_b start">ȥ����</span>';
		}
		/*if($_REQUEST['cmd'])
		{
			return '<span class="tips">������</span>';
		} //�����쿪ʼ����Ʒʱ����ʾ����
		if($zt==3||date('Y-m-d Hi')>$et) return '<span class="tips end">�ѽ���</span>';
		if(date('Y-m-d H:i')<$st)
		{
			return '<span class="tips unstart">'.date('H:i',strtotime($st)).'����</span>';
		}
		else
		{
			return '<span class="tips">������</span>';
		}*/
	}

	public function tejianum(){
		
	}
}
?>
