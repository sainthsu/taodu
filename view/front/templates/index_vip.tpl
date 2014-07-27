<link href="/assets/stylesheets/vip.css" rel="stylesheet" type="text/css"/>
<div class="body">
<meta name="description" content="淘都-汇聚一条街，省去一座城!每日特价，优惠购物，9块9包邮，VIP专享，特价疯抢" />
<meta name="keywords" content="特价精选,每日特价,优惠购物,9块9包邮,VIP专享,特价疯抢"/>
<div class="m_header">
  <!--<div class="view">
    <h1 class="logo"><a href="/"><img src="http://img04.taobaocdn.com/imgextra/i4/189209818/T2Dls1Xm4XXXXXXXXX_!!189209818.gif" width="79" height="79"></a></h1>
    <p class="promise fwr"><span><i class="i_redVan"></i>全场免运费</span><span><i class="i_redSafe"></i>100%正品</span><span><i class="i_redClock"></i>9点上新</span></p>
  </div>-->
  <div class="pro_nav">
    <div class="view">
      <ul class="pro_channel_list">
        <li class="curr_channel"><a href="http://taodu.uz.taobao.com/d/index?nocache=1" target="_self" class="channel_index hide_font">首页</a></li>
        <!--<li><a href="http://taodu.uz.taobao.com/tomorrow.php" target="_self" rel="nofollow" class="channel_tomorrow hide_font">明天上线</a></li>-->
      </ul>

	  	<div class="shopping_bag">
  		<h2 class="bag_titile"><i class="i_bag"></i><a href="/d/bag/" target="_blank">淘都收藏袋</a><strong id="J_bag_num" class="bag_num">0</strong></h2>
  		<div id="J_header_carSection" class="bag_content">
    	<div class="bag_has_nothing">
      	您的收藏袋还没有商品，再去逛逛吧~
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
		<h2>精选推荐</h2>
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
			<span class="bought-wrap">{$r.volume}人购买</span>
			<strong>￥<em>{$r.nprice}</em></strong> <i>￥{$r.oprice}</i>
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
			<span class="bought-wrap">{$r.volume}人购买</span>
			<strong>￥<em>{$r.nprice}</em></strong> <i>￥{$r.oprice}</i>
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
				<h2 class="f_goods hide_font">商品分类：</h2>
				<ul class="goods_class">
											<li class="all_goods"><a class="curr_goods" href="/d/index?nocache=1">全部</a></li>
		            						<li><a href="/d/index?cate=1{if $order != 0}&amp;order={$order}{/if}">女装</a></li>
		            						<li><a href="/d/index?cate=2{if $order != 0}&amp;order={$order}{/if}">男装</a></li>
		            						<li><a href="/d/index?cate=3{if $order != 0}&amp;order={$order}{/if}">内衣</a></li>
		            						<li><a href="/d/index?cate=4{if $order != 0}&amp;order={$order}{/if}">鞋包</a></li>
		            						<li><a href="/d/index?cate=5{if $order != 0}&amp;order={$order}{/if}">配饰</a></li>
		            						<li><a href="/d/index?cate=6{if $order != 0}&amp;order={$order}{/if}">美妆</a></li>
		            						<li><a href="/d/index?cate=8{if $order != 0}&amp;order={$order}{/if}">家居</a></li>
		            						<li><a href="/d/index?cate=9{if $order != 0}&amp;order={$order}{/if}">母婴</a></li>
		            						<li><a href="/d/index?cate=10{if $order != 0}&amp;order={$order}{/if}">食品</a></li>
		            						<li><a href="/d/index?cate=11{if $order != 0}&amp;order={$order}{/if}">数码</a></li>
		             
				</ul>
			</div>
		</div>
		<div class="today_group">
			<h2 class="today_group_title fwr"><span id="J_class_name">今日特价</span>：</h2>
			<div class="sort_nav">
				<a href="/d/index?order=0" class="curr_goods"><span>默认</span></a>
				<a href="/d/index?order=1{if $cate != 0}&amp;cate={$cate}{/if}" title="折扣由低到高"><span>折扣</span><i class="i_arrow_down"></i></a>
				<a href="/d/index?order=2{if $cate != 0}&amp;cate={$cate}{/if}" title="销量由高到低" ><span>销量</span><i class="i_arrow_down"></i></a>
				<a href="/d/index?order=3{if $cate != 0}&amp;cate={$cate}{/if}" ><span>最新</span><i class="i_arrow_up"></i></a>
			</div>
			<div class="fr fwr">
				<div class="mini_pagging">
					<span class="mini_page_num"><span class="mini_curr_page">1</span>/7</span><a class="mini_pagging_noNext" ><span class="mini_pagging_arrow">&lt;&lt;</span></a><a href="/d/index?&amp;page={$page}{if $cate != 0}&amp;cate={$cate}{/if}{if $order != 0}&amp;order={$order}{/if}" >下一页 <span class="mini_pagging_arrow">&gt;&gt;</span></a>
				</div>
				<div class="m_just_saw">
					<h2 class="just_saw_trigger" mars_sead="day_home_main_history_btn"><i class="i_just_saw"></i><span>刚刚看过</span></h2>
					<div class="just_saw_content">
						<div class="just_saw_has_list hidden">
							<div class="just_saw_list clearfix">
								<div id="J_just_saw_list"></div>
							</div>
							<a href="javascript:;" class="just_saw_left hidden" role="button" mars_sead="day_home_main_hisdrop_btn">&lt;</a>
							<a href="javascript:;" class="just_saw_right hidden" role="button" mars_sead="day_home_main_hisdrop_btn">&gt;</a>
						</div>
						<div class="just_saw_has_nothing fst">
							<h3>您最近没有浏览过的精选特价商品</h3>
							<p>您知道吗？淘都精选精选每天9点上新，每天几十万人同时抢购</p>
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
			<span class="bgGoodsSoldOut hide_font">已抢光</span>
			<img src="/assets/images/loadimg.gif" data-ks-lazyload="{$p.pic}" width="300" height="300" alt="">
			<div>
				<h3 class="groupGoodsTitle">{$p.title}</h3>
				<div class="groupGoodsInfo">
					<span class="groupGoodsPrice">￥<span>{$p.nprice}</span></span>
					<p class="discountWrap"><span class="groupDiscount">{$p.discount}折</span>市场价：<span class="originalPrice">￥{$p.oprice}</span></p>
					<p  class="groupPurchaseNum hidden" style="display: block;"><i class="iGroupPeople"></i><b>{$p.volume}人</b>已购买</p></div>
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
		<div class="link-head"><h2>淘都小伙伴</h2><a href="/d/link" target="_blank">友链申请</a></div>
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
		<li><a href='/shop/index.php' title="店铺导航">店铺导航</a></li>
		<li><a href='/uz/10010/index.php' title="九元购">九元购</a></li>
<li><a href='/uz/10kuaiqian/index.php' title="十块钱">十块钱</a></li>
<li><a href='/uz/10mst/index.php' title="秒杀通">秒杀通</a></li>
<li><a href='/uz/126789/index.php' title="vip专享应用">vip专享应用</a></li>
<li><a href='/uz/1314/index.php' title="折扣九块九">折扣九块九</a></li>
<li><a href='/uz/1fenbao/index.php' title="步街折扣">步街折扣</a></li>
<li><a href='/uz/1zw/index.php' title="1折网">1折网</a></li>
<li><a href='/uz/51buy/index.php' title="爱家居">爱家居</a></li>
<li><a href='/uz/51dazhe/index.php' title="1元秒杀限时免单">1元秒杀限时免单</a></li>
<li><a href='/uz/521fx/index.php' title="爆品汇">爆品汇</a></li>
<li><a href='/uz/52tao/index.php' title="一折购">一折购</a></li>
<li><a href='/uz/55888/index.php' title="亏本邮">亏本邮</a></li>
<li><a href='/uz/800zhe/index.php' title="800折">800折</a></li>
<li><a href='/uz/8090/index.php' title="特价专享">特价专享</a></li>
<li><a href='/uz/90shis/index.php' title="一元疯抢">一元疯抢</a></li>
<li><a href='/uz/aibaobao/index.php' title="爱折淘">爱折淘</a></li>
<li><a href='/uz/aidongdong/index.php' title="爱东东">爱东东</a></li>
<li><a href='/uz/aijia/index.php' title="亏本清仓">亏本清仓</a></li>
<li><a href='/uz/aiwantu/index.php' title="爱玩图">爱玩图</a></li>
<li><a href='/uz/aiyouhui/index.php' title="爱优惠">爱优惠</a></li>
<li><a href='/uz/aizheer/index.php' title="爱这儿">爱这儿</a></li>
<li><a href='/uz/ascloud/index.php' title="品汇天下">品汇天下</a></li>
<li><a href='/uz/baidatuan/index.php' title="百搭团">百搭团</a></li>
<li><a href='/uz/baobaokong/index.php' title="包包控">包包控</a></li>
<li><a href='/uz/batao/index.php' title="十元店">十元店</a></li>
<li><a href='/uz/chaoliu/index.php' title="民族风">民族风</a></li>
<li><a href='/uz/coubei/index.php' title="乐淘折扣">乐淘折扣</a></li>
<li><a href='/uz/duchang/index.php' title="独唱团">独唱团</a></li>
<li><a href='/uz/dujia/index.php' title="独家折扣">独家折扣</a></li>
<li><a href='/uz/ezheway/index.php' title="e折汇">e折汇</a></li>
<li><a href='/uz/fengtao/index.php' title="今日疯淘">今日疯淘</a></li>
<li><a href='/uz/fqtuan/index.php' title="疯抢团">疯抢团</a></li>
<li><a href='/uz/girl/index.php' title="菇凉">菇凉</a></li>
<li><a href='/uz/gossipstar/index.php' title="王牌明星汇">王牌明星汇</a></li>
<li><a href='/uz/goubz/index.php' title="狗鼻子搭配大师">狗鼻子搭配大师</a></li>
<li><a href='/uz/haoyouhui/index.php' title="实汇路">实汇路</a></li>
<li><a href='/uz/hiznzn/index.php' title="风尚志">风尚志</a></li>
<li><a href='/uz/huiyuangou/index.php' title="会员购">会员购</a></li>
<li><a href='/uz/ichic/index.php' title="小众真潮">小众真潮</a></li>
<li><a href='/uz/id/index.php' title="聚团购">聚团购</a></li>
<li><a href='/uz/ifenxiang/index.php' title="乐淘专享">乐淘专享</a></li>
<li><a href='/uz/jdmiaosha/index.php' title="极度秒杀">极度秒杀</a></li>
<li><a href='/uz/jegege/index.php' title="格格团">格格团</a></li>
<li><a href='/uz/jianbb/index.php' title="捡宝贝">捡宝贝</a></li>
<li><a href='/uz/jianshi/index.php' title="特价疯抢">特价疯抢</a></li>
<li><a href='/uz/jiapin/index.php' title="抢牛品">抢牛品</a></li>
<li><a href='/uz/jiaxiangwei/index.php' title="家乡滋味">家乡滋味</a></li>
<li><a href='/uz/jiejie/index.php' title="开心大买卖">开心大买卖</a></li>
<li><a href='/uz/jiukuaiyou/index.php' title="九块邮">九块邮</a></li>
<li><a href='/uz/ju/index.php' title="聚划算">聚划算</a></li>
<li><a href='/uz/juanpi/index.php' title="卷皮折扣">卷皮折扣</a></li>
<li><a href='/uz/jumei/index.php' title="聚美优品">聚美优品</a></li>
<li><a href='/uz/jutaohui/index.php' title="团促折扣">团促折扣</a></li>
<li><a href='/uz/jutuangou/index.php' title="疯狂聚团购">疯狂聚团购</a></li>
<li><a href='/uz/juxihuan/index.php' title="聚喜欢">聚喜欢</a></li>
<li><a href='/uz/kxmd/index.php' title="开心免单">开心免单</a></li>
<li><a href='/uz/lanmama/index.php' title="米折10元购">米折10元购</a></li>
<li><a href='/uz/lecu/index.php' title="大乐促">大乐促</a></li>
<li><a href='/uz/legou/index.php' title="特价乐购">特价乐购</a></li>
<li><a href='/uz/lively/index.php' title="热闹一街">热闹一街</a></li>
<li><a href='/uz/love8/index.php' title="爱淘九块九">爱淘九块九</a></li>
<li><a href='/uz/mao/index.php' title="特价猫">特价猫</a></li>
<li><a href='/uz/meilibang/index.php' title="特实惠">特实惠</a></li>
<li><a href='/uz/mianfei/index.php' title="免费邮">免费邮</a></li>
<li><a href='/uz/mianyouba/index.php' title="免邮吧">免邮吧</a></li>
<li><a href='/uz/miaosa/index.php' title="秒杀限时抢购">秒杀限时抢购</a></li>
<li><a href='/uz/mmrizhi/index.php' title="美美购">美美购</a></li>
<li><a href='/uz/modson/index.php' title="莫等闲">莫等闲</a></li>
<li><a href='/uz/movie/index.php' title="超划算">超划算</a></li>
<li><a href='/uz/mytehui/index.php' title="VIP买特惠">VIP买特惠</a></li>
<li><a href='/uz/okman/index.php' title="满意淘">满意淘</a></li>
<li><a href='/uz/paimai/index.php' title="拍卖惠">拍卖惠</a></li>
<li><a href='/uz/qiang/index.php' title="秒杀专区">秒杀专区</a></li>
<li><a href='/uz/qiangmiaosha/index.php' title="抢秒杀">抢秒杀</a></li>
<li><a href='/uz/qiannian/index.php' title="千年团">千年团</a></li>
<li><a href='/uz/qiushidaquan/index.php' title="VIP大卖场">VIP大卖场</a></li>
<li><a href='/uz/quansoso/index.php' title="券搜搜">券搜搜</a></li>
<li><a href='/uz/sale/index.php' title="VIP专享">VIP专享</a></li>
<li><a href='/uz/shimaoquan/index.php' title="时髦圈">时髦圈</a></li>
<li><a href='/uz/shiyonglianmeng/index.php' title="试用联盟">试用联盟</a></li>
<li><a href='/uz/so/index.php' title="丁丁特价">丁丁特价</a></li>
<li><a href='/uz/soquan/index.php' title="搜券宝">搜券宝</a></li>
<li><a href='/uz/ssqy/index.php' title="爆划算">爆划算</a></li>
<li><a href='/uz/tao800/index.php' title="淘800">淘800</a></li>
<li><a href='/uz/tao900/index.php' title="淘800">淘900</a></li>
<li><a href='/uz/taovip/index.php' title="淘乐汇">淘乐汇</a></li>
<li><a href='/uz/taoyibao/index.php' title="藏衣阁">藏衣阁</a></li>
<li><a href='/uz/tbvip/index.php' title="vip会员购">vip会员购</a></li>
<li><a href='/uz/tealife/index.php' title="淘牛品">淘牛品</a></li>
<li><a href='/uz/tejia/index.php' title="特价专场">特价专场</a></li>
<li><a href='/uz/tejia8/index.php' title="特价风暴">特价风暴</a></li>
<li><a href='/uz/tejiaxianggou/index.php' title="特价享购">特价享购</a></li>
<li><a href='/uz/tejiayitian/index.php' title="特价一天">特价一天</a></li>
<li><a href='/uz/temaifengqiang/index.php' title="特卖疯抢">特卖疯抢</a></li>
<li><a href='/uz/tiangou/index.php' title="天购">天购</a></li>
<li><a href='/uz/tiantian99/index.php' title="天天九块九">天天九块九</a></li>
<li><a href='/uz/trend/index.php' title="明星穿搭志">明星穿搭志</a></li>
<li><a href='/uz/tuancu/index.php' title="团促网">团促网</a></li>
<li><a href='/uz/ushow/index.php' title="促销会">促销会</a></li>
<li><a href='/uz/vip/index.php' title="VIP专场">VIP专场</a></li>
<li><a href='/uz/vip800/index.php' title="燕子团">燕子团</a></li>
<li><a href='/uz/vipgouyouhui/index.php' title="VIP购优汇">VIP购优汇</a></li>
<li><a href='/uz/vipjupianyi/index.php' title="疯狂聚便宜vip">疯狂聚便宜vip</a></li>
<li><a href='/uz/viptehui/index.php' title="VIP超值秒杀">VIP超值秒杀</a></li>
<li><a href='/uz/vipzxhd/index.php' title="vip专享活动">vip专享活动</a></li>
<li><a href='/uz/vipzxth/index.php' title="vip专享特惠">vip专享特惠</a></li>
<li><a href='/uz/wogou/index.php' title="特价1折">特价1折</a></li>
<li><a href='/uz/wowo/index.php' title="窝窝折扣">窝窝折扣</a></li>
<li><a href='/uz/wsdmx/index.php' title="清仓包邮">清仓包邮</a></li>
<li><a href='/uz/x0123/index.php' title="消灵123">消灵123</a></li>
<li><a href='/uz/xiai/index.php' title="喜爱团">喜爱团</a></li>
<li><a href='/uz/xianshitehui/index.php' title="1折秒杀限时特惠">1折秒杀限时特惠</a></li>
<li><a href='/uz/xiaodehao/index.php' title="销得好">销得好</a></li>
<li><a href='/uz/xiaoer/index.php' title="蛮便宜">蛮便宜</a></li>
<li><a href='/uz/xiaoheitejia/index.php' title="小黑特价">小黑特价</a></li>
<li><a href='/uz/xiaoma/index.php' title="亏本吧">亏本吧</a></li>
<li><a href='/uz/xiaoxiqi/index.php' title="小稀奇">小稀奇</a></li>
<li><a href='/uz/xin/index.php' title="心品折扣">心品折扣</a></li>
<li><a href='/uz/xingyun/index.php' title="VIP独享">VIP独享</a></li>
<li><a href='/uz/xiuxiu/index.php' title="疯狂聚清仓">疯狂聚清仓</a></li>
<li><a href='/uz/xunbao/index.php' title="优惠社">优惠社</a></li>
<li><a href='/uz/xy520/index.php' title="写意点滴">写意点滴</a></li>
<li><a href='/uz/yelife/index.php' title="跳楼专享">跳楼专享</a></li>
<li><a href='/uz/yinxiang/index.php' title="一秒疯抢免费试用">一秒疯抢免费试用</a></li>
<li><a href='/uz/yinyiquan/index.php' title="饮艺圈">饮艺圈</a></li>
<li><a href='/uz/yohui/index.php' title="优买集">优买集</a></li>
<li><a href='/uz/youda/index.php' title="特卖一街">特卖一街</a></li>
<li><a href='/uz/yougouvip/index.php' title="聚精品">聚精品</a></li>
<li><a href='/uz/youhuihui/index.php' title="优惠汇">优惠汇</a></li>
<li><a href='/uz/youpin/index.php' title="聚优品VIP">聚优品VIP</a></li>
<li><a href='/uz/yuansu/index.php' title="畅快购">畅快购</a></li>
<li><a href='/uz/yuexiaowanjian/index.php' title="凡品集">凡品集</a></li>
<li><a href='/uz/zhe/index.php' title="折扣钱庄">折扣钱庄</a></li>
<li><a href='/uz/zhe234/index.php' title="淘折特价">淘折特价</a></li>
<li><a href='/uz/zhe800/index.php' title="折800">折800</a></li>
<li><a href='/uz/zhuanbao/index.php' title="开心赚宝">开心赚宝</a></li>
<li><a href='/uz/zhuanxiang/index.php' title="专享特价">专享特价</a></li>
<li><a href='/uz/ztbest/index.php' title="中通优选">中通优选</a></li>>
	</ul>
 </div>
</div>
</div>
{include file="footer_vip.tpl"}
<script src="/assets/javascripts/vip.js"></script>
