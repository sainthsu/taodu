<link href="/assets/stylesheets/vip.css" rel="stylesheet" type="text/css"/>
<div class="body">
<meta name="description" content="�Զ�-���һ���֣�ʡȥһ����!ÿ���ؼۣ��Żݹ��9��9���ʣ�VIPר���ؼ۷���" />
<meta name="keywords" content="�ؼ۾�ѡ,ÿ���ؼ�,�Żݹ���,9��9����,VIPר��,�ؼ۷���"/>
<div class="m_header">
  <!--<div class="view">
    <h1 class="logo"><a href="/"><img src="http://img04.taobaocdn.com/imgextra/i4/189209818/T2Dls1Xm4XXXXXXXXX_!!189209818.gif" width="79" height="79"></a></h1>
    <p class="promise fwr"><span><i class="i_redVan"></i>ȫ�����˷�</span><span><i class="i_redSafe"></i>100%��Ʒ</span><span><i class="i_redClock"></i>9������</span></p>
  </div>-->
  <div class="pro_nav">
    <div class="view">
      <ul class="pro_channel_list">
        <li class="curr_channel"><a href="http://taodu.uz.taobao.com/d/index?nocache=1" target="_self" class="channel_index hide_font">��ҳ</a></li>
        <!--<li><a href="http://taodu.uz.taobao.com/tomorrow.php" target="_self" rel="nofollow" class="channel_tomorrow hide_font">��������</a></li>-->
      </ul>

	  	<div class="shopping_bag">
  		<h2 class="bag_titile"><i class="i_bag"></i><a href="/d/bag/" target="_blank">�Զ��ղش�</a><strong id="J_bag_num" class="bag_num">0</strong></h2>
  		<div id="J_header_carSection" class="bag_content">
    	<div class="bag_has_nothing">
      	�����ղش���û����Ʒ����ȥ����~
    	</div>
  		</div>
		</div>
    </div>
  </div>
</div>

<div class="taodu-content">
	<div class="scroll-area">
		<div class="port">
			<a href="" title="" target="_blank" ></a>
		</div>
		<h2>��ѡ�Ƽ�</h2>
		<div id="one-carousel" class="tang-ui tang-carousel">
		<a class="tang-carousel-btn tang-carousel-btn-prev" href="javascript:void(0)"></a>
		<div class="tang-carousel-container">
		<ul class="tang-carousel-element" style="width: 3860px;">
			{foreach from=$recommend item=r}
			<li class="tang-carousel-item goods-item">
			<div class="icon-area">
				<div class="icon-wrap icon-reservation"></div>
			</div>
			<a class="img-wrap" target="_blank" href="http://item.taobao.com/item.htm?id={$r.iid}">
				<img class="img-recommend-pic" src="{$r.pic}" width="220" height="220" alt="{$r.title}">
				<div class="img-border"></div>
			</a>
			<div class="info">
				<div class="mask"></div>
				<a target="_blank" href="http://item.taobao.com/item.htm?id={$r.iid}" title="{$r.title}" >{$r.title}</a>
			</div>
			<a class="control-bar" href="http://item.taobao.com/item.htm?id={$r.iid}" target="_blank">
			<span class="bought-wrap">{$r.volume}�˹���</span>
			<strong>��<em>{$r.nprice}</em></strong> <i>��{$r.oprice}</i>
			</a>
			</li>
			{/foreach}
			{foreach from=$recommend item=r key=k}
			{if $k <= 3}
			<li class="tang-carousel-item goods-item">
			<div class="icon-area">
				<div class="icon-wrap icon-reservation"></div>
			</div>
			<a class="img-wrap" target="_blank" href="http://item.taobao.com/item.htm?id={$r.iid}">
				<img class="img-recommend-pic" src="{$r.pic}" width="220" height="220" alt="{$r.title}">
				<div class="img-border"></div>
			</a>
			<div class="info">
				<div class="mask"></div>
				<a target="_blank" href="http://item.taobao.com/item.htm?id={$r.iid}" title="{$r.title}" >{$r.title}</a>
			</div>
			<a class="control-bar" href="http://item.taobao.com/item.htm?id={$r.iid}" target="_blank">
			<span class="bought-wrap">{$r.volume}�˹���</span>
			<strong>��<em>{$r.nprice}</em></strong> <i>��{$r.oprice}</i>
			</a>
			</li>
			{/if}
			{/foreach}
		</ul>
		</div>
		<a class="tang-carousel-btn tang-carousel-btn-next" href="javascript:void(0)" id="TANGRAM_25__next"></a>
		</div>
	</div>


<div class="screening_wrap">
	<div class="m_screening">
		<div class="responsive_nav">
			<div class="responsive_nav_inner">
				<h2 class="f_goods hide_font">��Ʒ���ࣺ</h2>
				<ul class="goods_class">
											<li class="all_goods"><a class="curr_goods" href="/d/index?nocache=1">ȫ��</a></li>
		            						<li><a href="/d/index?cate=1{if $order != 0}&amp;order={$order}{/if}">Ůװ</a></li>
		            						<li><a href="/d/index?cate=2{if $order != 0}&amp;order={$order}{/if}">��װ</a></li>
		            						<li><a href="/d/index?cate=3{if $order != 0}&amp;order={$order}{/if}">����</a></li>
		            						<li><a href="/d/index?cate=4{if $order != 0}&amp;order={$order}{/if}">Ь��</a></li>
		            						<li><a href="/d/index?cate=5{if $order != 0}&amp;order={$order}{/if}">����</a></li>
		            						<li><a href="/d/index?cate=6{if $order != 0}&amp;order={$order}{/if}">��ױ</a></li>
		            						<li><a href="/d/index?cate=8{if $order != 0}&amp;order={$order}{/if}">�Ҿ�</a></li>
		            						<li><a href="/d/index?cate=9{if $order != 0}&amp;order={$order}{/if}">ĸӤ</a></li>
		            						<li><a href="/d/index?cate=10{if $order != 0}&amp;order={$order}{/if}">ʳƷ</a></li>
		            						<li><a href="/d/index?cate=11{if $order != 0}&amp;order={$order}{/if}">����</a></li>
		             
				</ul>
			</div>
		</div>
		<div class="today_group">
			<h2 class="today_group_title fwr"><span id="J_class_name">�����ؼ�</span>��</h2>
			<div class="sort_nav">
				<a href="/d/index?order=0" class="curr_goods"><span>Ĭ��</span></a>
				<a href="/d/index?order=1{if $cate != 0}&amp;cate={$cate}{/if}" title="�ۿ��ɵ͵���"><span>�ۿ�</span><i class="i_arrow_down"></i></a>
				<a href="/d/index?order=2{if $cate != 0}&amp;cate={$cate}{/if}" title="�����ɸߵ���" ><span>����</span><i class="i_arrow_down"></i></a>
				<a href="/d/index?order=3{if $cate != 0}&amp;cate={$cate}{/if}" ><span>����</span><i class="i_arrow_up"></i></a>
			</div>
			<div class="fr fwr">
				<div class="mini_pagging">
					<span class="mini_page_num"><span class="mini_curr_page">1</span>/7</span><a class="mini_pagging_noNext" ><span class="mini_pagging_arrow">&lt;&lt;</span></a><a href="/d/index?&amp;page={$page}{if $cate != 0}&amp;cate={$cate}{/if}{if $order != 0}&amp;order={$order}{/if}" >��һҳ <span class="mini_pagging_arrow">&gt;&gt;</span></a>
				</div>
				<div class="m_just_saw">
					<h2 class="just_saw_trigger" mars_sead="day_home_main_history_btn"><i class="i_just_saw"></i><span>�ոտ���</span></h2>
					<div class="just_saw_content">
						<div class="just_saw_has_list hidden">
							<div class="just_saw_list clearfix">
								<div id="J_just_saw_list"></div>
							</div>
							<a href="javascript:;" class="just_saw_left hidden" role="button" mars_sead="day_home_main_hisdrop_btn">&lt;</a>
							<a href="javascript:;" class="just_saw_right hidden" role="button" mars_sead="day_home_main_hisdrop_btn">&gt;</a>
						</div>
						<div class="just_saw_has_nothing fst">
							<h3>�����û��������ľ�ѡ�ؼ���Ʒ</h3>
							<p>��֪�����Զ���ѡ��ѡÿ��9�����£�ÿ�켸ʮ����ͬʱ����</p>
						</div>
					</div>
				</div>
			</div> 
		</div>
	</div>
</div>


	<div class="goods-area">
		<div class="goodsContainer clearfix" style="margin-right:-13px;">
		{foreach from=$product item=p key=i}
			<div class="groupGoodItem" data-hover="group_goods_item_hover">
			<a href="http://item.taobao.com/item.htm?id={$p.iid}" target="_blank">
			<span class="bgGoodsSoldOut hide_font">������</span>
			<img src="/assets/images/loadimg.gif" data-ks-lazyload="{$p.pic}" width="300" height="300" alt="">
			<div>
				<h3 class="groupGoodsTitle">{$p.title}</h3>
				<div class="groupGoodsInfo">
					<span class="groupGoodsPrice">��<span>{$p.nprice}</span></span>
					<p class="discountWrap"><span class="groupDiscount">{$p.discount}��</span>�г��ۣ�<span class="originalPrice">��{$p.oprice}</span></p>
					<p  class="groupPurchaseNum hidden" style="display: block;"><i class="iGroupPeople"></i><b>{$p.volume}��</b>�ѹ���</p></div>
			</div>
		</a>
		</div>
		{/foreach}
		</div>

		<div class="pagging fwr">
			{$pageStr}
		</div>

	</div>

	<div id="ad-banner-bottom" class="ad-banner-bottom">
		<div class="banner-item">
			<a href="" target="_blank" title=""><img src="http://img04.taobaocdn.com/imgextra/i4/189209818/T2dRupXuFaXXXXXXXX-189209818.jpg" width="980" height="90" alt=""><div class="img-border"></div></a>
		</div>
	</div>
	
	<div class="flink-area">
		<div class="link-head"><h2>�Զ�С���</h2><a href="/d/link" target="_blank">��������</a></div>
		<ul class="big">
			{foreach from=$bigLinks item=blink key=i}
			<li {if $i%7==0}class="first"{/if}>
				<a href="{$blink.link}" target="_blank">
					<img src="{$blink.big_logo}" style="border:0px;">
				</a>
			</li>
			{/foreach}
		</ul>
	</div>
	<div class="uzHidden">
	<ul>
		<li><a href='/shop/index.php' title="���̵���">���̵���</a></li>
		<li><a href='/uz/10010/index.php' title="��Ԫ��">��Ԫ��</a></li>
<li><a href='/uz/10kuaiqian/index.php' title="ʮ��Ǯ">ʮ��Ǯ</a></li>
<li><a href='/uz/10mst/index.php' title="��ɱͨ">��ɱͨ</a></li>
<li><a href='/uz/126789/index.php' title="vipר��Ӧ��">vipר��Ӧ��</a></li>
<li><a href='/uz/1314/index.php' title="�ۿ۾ſ��">�ۿ۾ſ��</a></li>
<li><a href='/uz/1fenbao/index.php' title="�����ۿ�">�����ۿ�</a></li>
<li><a href='/uz/1zw/index.php' title="1����">1����</a></li>
<li><a href='/uz/51buy/index.php' title="���Ҿ�">���Ҿ�</a></li>
<li><a href='/uz/51dazhe/index.php' title="1Ԫ��ɱ��ʱ�ⵥ">1Ԫ��ɱ��ʱ�ⵥ</a></li>
<li><a href='/uz/521fx/index.php' title="��Ʒ��">��Ʒ��</a></li>
<li><a href='/uz/52tao/index.php' title="һ�۹�">һ�۹�</a></li>
<li><a href='/uz/55888/index.php' title="������">������</a></li>
<li><a href='/uz/800zhe/index.php' title="800��">800��</a></li>
<li><a href='/uz/8090/index.php' title="�ؼ�ר��">�ؼ�ר��</a></li>
<li><a href='/uz/90shis/index.php' title="һԪ����">һԪ����</a></li>
<li><a href='/uz/aibaobao/index.php' title="������">������</a></li>
<li><a href='/uz/aidongdong/index.php' title="������">������</a></li>
<li><a href='/uz/aijia/index.php' title="�������">�������</a></li>
<li><a href='/uz/aiwantu/index.php' title="����ͼ">����ͼ</a></li>
<li><a href='/uz/aiyouhui/index.php' title="���Ż�">���Ż�</a></li>
<li><a href='/uz/aizheer/index.php' title="�����">�����</a></li>
<li><a href='/uz/ascloud/index.php' title="Ʒ������">Ʒ������</a></li>
<li><a href='/uz/baidatuan/index.php' title="�ٴ���">�ٴ���</a></li>
<li><a href='/uz/baobaokong/index.php' title="������">������</a></li>
<li><a href='/uz/batao/index.php' title="ʮԪ��">ʮԪ��</a></li>
<li><a href='/uz/chaoliu/index.php' title="�����">�����</a></li>
<li><a href='/uz/coubei/index.php' title="�����ۿ�">�����ۿ�</a></li>
<li><a href='/uz/duchang/index.php' title="������">������</a></li>
<li><a href='/uz/dujia/index.php' title="�����ۿ�">�����ۿ�</a></li>
<li><a href='/uz/ezheway/index.php' title="e�ۻ�">e�ۻ�</a></li>
<li><a href='/uz/fengtao/index.php' title="���շ���">���շ���</a></li>
<li><a href='/uz/fqtuan/index.php' title="������">������</a></li>
<li><a href='/uz/girl/index.php' title="����">����</a></li>
<li><a href='/uz/gossipstar/index.php' title="�������ǻ�">�������ǻ�</a></li>
<li><a href='/uz/goubz/index.php' title="�����Ӵ����ʦ">�����Ӵ����ʦ</a></li>
<li><a href='/uz/haoyouhui/index.php' title="ʵ��·">ʵ��·</a></li>
<li><a href='/uz/hiznzn/index.php' title="����־">����־</a></li>
<li><a href='/uz/huiyuangou/index.php' title="��Ա��">��Ա��</a></li>
<li><a href='/uz/ichic/index.php' title="С���泱">С���泱</a></li>
<li><a href='/uz/id/index.php' title="���Ź�">���Ź�</a></li>
<li><a href='/uz/ifenxiang/index.php' title="����ר��">����ר��</a></li>
<li><a href='/uz/jdmiaosha/index.php' title="������ɱ">������ɱ</a></li>
<li><a href='/uz/jegege/index.php' title="�����">�����</a></li>
<li><a href='/uz/jianbb/index.php' title="�񱦱�">�񱦱�</a></li>
<li><a href='/uz/jianshi/index.php' title="�ؼ۷���">�ؼ۷���</a></li>
<li><a href='/uz/jiapin/index.php' title="��ţƷ">��ţƷ</a></li>
<li><a href='/uz/jiaxiangwei/index.php' title="������ζ">������ζ</a></li>
<li><a href='/uz/jiejie/index.php' title="���Ĵ�����">���Ĵ�����</a></li>
<li><a href='/uz/jiukuaiyou/index.php' title="�ſ���">�ſ���</a></li>
<li><a href='/uz/ju/index.php' title="�ۻ���">�ۻ���</a></li>
<li><a href='/uz/juanpi/index.php' title="��Ƥ�ۿ�">��Ƥ�ۿ�</a></li>
<li><a href='/uz/jumei/index.php' title="������Ʒ">������Ʒ</a></li>
<li><a href='/uz/jutaohui/index.php' title="�Ŵ��ۿ�">�Ŵ��ۿ�</a></li>
<li><a href='/uz/jutuangou/index.php' title="�����Ź�">�����Ź�</a></li>
<li><a href='/uz/juxihuan/index.php' title="��ϲ��">��ϲ��</a></li>
<li><a href='/uz/kxmd/index.php' title="�����ⵥ">�����ⵥ</a></li>
<li><a href='/uz/lanmama/index.php' title="����10Ԫ��">����10Ԫ��</a></li>
<li><a href='/uz/lecu/index.php' title="���ִ�">���ִ�</a></li>
<li><a href='/uz/legou/index.php' title="�ؼ��ֹ�">�ؼ��ֹ�</a></li>
<li><a href='/uz/lively/index.php' title="����һ��">����һ��</a></li>
<li><a href='/uz/love8/index.php' title="���Ծſ��">���Ծſ��</a></li>
<li><a href='/uz/mao/index.php' title="�ؼ�è">�ؼ�è</a></li>
<li><a href='/uz/meilibang/index.php' title="��ʵ��">��ʵ��</a></li>
<li><a href='/uz/mianfei/index.php' title="�����">�����</a></li>
<li><a href='/uz/mianyouba/index.php' title="���ʰ�">���ʰ�</a></li>
<li><a href='/uz/miaosa/index.php' title="��ɱ��ʱ����">��ɱ��ʱ����</a></li>
<li><a href='/uz/mmrizhi/index.php' title="������">������</a></li>
<li><a href='/uz/modson/index.php' title="Ī����">Ī����</a></li>
<li><a href='/uz/movie/index.php' title="������">������</a></li>
<li><a href='/uz/mytehui/index.php' title="VIP���ػ�">VIP���ػ�</a></li>
<li><a href='/uz/okman/index.php' title="������">������</a></li>
<li><a href='/uz/paimai/index.php' title="������">������</a></li>
<li><a href='/uz/qiang/index.php' title="��ɱר��">��ɱר��</a></li>
<li><a href='/uz/qiangmiaosha/index.php' title="����ɱ">����ɱ</a></li>
<li><a href='/uz/qiannian/index.php' title="ǧ����">ǧ����</a></li>
<li><a href='/uz/qiushidaquan/index.php' title="VIP������">VIP������</a></li>
<li><a href='/uz/quansoso/index.php' title="ȯ����">ȯ����</a></li>
<li><a href='/uz/sale/index.php' title="VIPר��">VIPר��</a></li>
<li><a href='/uz/shimaoquan/index.php' title="ʱ��Ȧ">ʱ��Ȧ</a></li>
<li><a href='/uz/shiyonglianmeng/index.php' title="��������">��������</a></li>
<li><a href='/uz/so/index.php' title="�����ؼ�">�����ؼ�</a></li>
<li><a href='/uz/soquan/index.php' title="��ȯ��">��ȯ��</a></li>
<li><a href='/uz/ssqy/index.php' title="������">������</a></li>
<li><a href='/uz/tao800/index.php' title="��800">��800</a></li>
<li><a href='/uz/tao900/index.php' title="��800">��900</a></li>
<li><a href='/uz/taovip/index.php' title="���ֻ�">���ֻ�</a></li>
<li><a href='/uz/taoyibao/index.php' title="���¸�">���¸�</a></li>
<li><a href='/uz/tbvip/index.php' title="vip��Ա��">vip��Ա��</a></li>
<li><a href='/uz/tealife/index.php' title="��ţƷ">��ţƷ</a></li>
<li><a href='/uz/tejia/index.php' title="�ؼ�ר��">�ؼ�ר��</a></li>
<li><a href='/uz/tejia8/index.php' title="�ؼ۷籩">�ؼ۷籩</a></li>
<li><a href='/uz/tejiaxianggou/index.php' title="�ؼ���">�ؼ���</a></li>
<li><a href='/uz/tejiayitian/index.php' title="�ؼ�һ��">�ؼ�һ��</a></li>
<li><a href='/uz/temaifengqiang/index.php' title="��������">��������</a></li>
<li><a href='/uz/tiangou/index.php' title="�칺">�칺</a></li>
<li><a href='/uz/tiantian99/index.php' title="����ſ��">����ſ��</a></li>
<li><a href='/uz/trend/index.php' title="���Ǵ���־">���Ǵ���־</a></li>
<li><a href='/uz/tuancu/index.php' title="�Ŵ���">�Ŵ���</a></li>
<li><a href='/uz/ushow/index.php' title="������">������</a></li>
<li><a href='/uz/vip/index.php' title="VIPר��">VIPר��</a></li>
<li><a href='/uz/vip800/index.php' title="������">������</a></li>
<li><a href='/uz/vipgouyouhui/index.php' title="VIP���Ż�">VIP���Ż�</a></li>
<li><a href='/uz/vipjupianyi/index.php' title="���۱���vip">���۱���vip</a></li>
<li><a href='/uz/viptehui/index.php' title="VIP��ֵ��ɱ">VIP��ֵ��ɱ</a></li>
<li><a href='/uz/vipzxhd/index.php' title="vipר��">vipר��</a></li>
<li><a href='/uz/vipzxth/index.php' title="vipר���ػ�">vipר���ػ�</a></li>
<li><a href='/uz/wogou/index.php' title="�ؼ�1��">�ؼ�1��</a></li>
<li><a href='/uz/wowo/index.php' title="�����ۿ�">�����ۿ�</a></li>
<li><a href='/uz/wsdmx/index.php' title="��ְ���">��ְ���</a></li>
<li><a href='/uz/x0123/index.php' title="����123">����123</a></li>
<li><a href='/uz/xiai/index.php' title="ϲ����">ϲ����</a></li>
<li><a href='/uz/xianshitehui/index.php' title="1����ɱ��ʱ�ػ�">1����ɱ��ʱ�ػ�</a></li>
<li><a href='/uz/xiaodehao/index.php' title="���ú�">���ú�</a></li>
<li><a href='/uz/xiaoer/index.php' title="������">������</a></li>
<li><a href='/uz/xiaoheitejia/index.php' title="С���ؼ�">С���ؼ�</a></li>
<li><a href='/uz/xiaoma/index.php' title="������">������</a></li>
<li><a href='/uz/xiaoxiqi/index.php' title="Сϡ��">Сϡ��</a></li>
<li><a href='/uz/xin/index.php' title="��Ʒ�ۿ�">��Ʒ�ۿ�</a></li>
<li><a href='/uz/xingyun/index.php' title="VIP����">VIP����</a></li>
<li><a href='/uz/xiuxiu/index.php' title="�������">�������</a></li>
<li><a href='/uz/xunbao/index.php' title="�Ż���">�Ż���</a></li>
<li><a href='/uz/xy520/index.php' title="д����">д����</a></li>
<li><a href='/uz/yelife/index.php' title="��¥ר��">��¥ר��</a></li>
<li><a href='/uz/yinxiang/index.php' title="һ������������">һ������������</a></li>
<li><a href='/uz/yinyiquan/index.php' title="����Ȧ">����Ȧ</a></li>
<li><a href='/uz/yohui/index.php' title="����">����</a></li>
<li><a href='/uz/youda/index.php' title="����һ��">����һ��</a></li>
<li><a href='/uz/yougouvip/index.php' title="�۾�Ʒ">�۾�Ʒ</a></li>
<li><a href='/uz/youhuihui/index.php' title="�Żݻ�">�Żݻ�</a></li>
<li><a href='/uz/youpin/index.php' title="����ƷVIP">����ƷVIP</a></li>
<li><a href='/uz/yuansu/index.php' title="���칺">���칺</a></li>
<li><a href='/uz/yuexiaowanjian/index.php' title="��Ʒ��">��Ʒ��</a></li>
<li><a href='/uz/zhe/index.php' title="�ۿ�Ǯׯ">�ۿ�Ǯׯ</a></li>
<li><a href='/uz/zhe234/index.php' title="�����ؼ�">�����ؼ�</a></li>
<li><a href='/uz/zhe800/index.php' title="��800">��800</a></li>
<li><a href='/uz/zhuanbao/index.php' title="����׬��">����׬��</a></li>
<li><a href='/uz/zhuanxiang/index.php' title="ר���ؼ�">ר���ؼ�</a></li>
<li><a href='/uz/ztbest/index.php' title="��ͨ��ѡ">��ͨ��ѡ</a></li>>
	</ul>
 </div>
</div>
</div>
{include file="footer_vip.tpl"}
<script src="/assets/javascripts/vip.js"></script>
