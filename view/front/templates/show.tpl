<div class="body">
 {include file="header.tpl"}

 <!--main开始-->


      <div class="meipu">
	  <div class="meipua">
         <div class="showmei_a"><img data-ks-lazyload="{$group.pic}"/></div>
		 <div class="showmei_b">
		   <ul>
			{foreach from=$proList item=p}
		      <li><a href="http://item.taobao.com/item.htm?id={$p.iid}"><img style="width:138px;height:138px;" data-ks-lazyload="{$p.pic}" /></a><span>&yen;{$p.nprice}</span></li>
			{/foreach}
		   </ul>
		 </div>
		 <div class="showmei_c">
		    <div class="showmei_ca">{$group.title}</div>
			<div class="showmei_cb">
			  <div class="showmei_cbl">
			     <span class="showmei_cbll">￥{$group.price}</span>
				 <span class="showmei_cbrr">{$group.num}件搭配总价</span>
			  </div>
			  <div class="showmei_cbr">
				<a data-sharebtn='{
	skinType:3,
	type:"webpage",
	key:"http://taodu.uz.taobao.com/d/index?action=show&gid={$group.id}",
	comment:"淘都U站,推荐一个好搭配哦！——{$group.intro}",
	pic:"{$group.pic}",
	client_id:68,
	isShowFriend:false
}'
class="sns-widget"><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T2VhQFXlBXXXXXXXXX_!!1661536580.jpg" /></a></div>
			</div>
			<div class="showmei_cc"><span><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T2CMsFXmBXXXXXXXXX_!!1661536580.jpg" /></span>{$group.intro}<span><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2ivcFXnxXXXXXXXXX_!!1661536580.jpg" /></span></div>
			<div class="showmei_cd"><span>搭配</span>
			{foreach from=$catArray item=i}
			<a href="/d/index?action=special&cat={$i}">{$catList[$i-1].name}</a>
			{/foreach}</div>
			<div class="showmei_ce">
			  {if $pre}<p>上一套搭配：<a href="/d/index?action=show&gid={$pre.id}">{$pre.title}</a></p>{/if}
			  {if $next}<p>下一套搭配：<a href="/d/index?action=show&gid={$next.id}">{$next.title}</a></p>{/if}
			</div>
		 </div>
     </div>
	 </div>

 <!--时尚单品开始-->
 <div class="fashion">
   <div class="fashion_to">
     <span class="fashion_tol"><i>时尚单品</i> | 精选特卖 - 今日上新{$updateNum}件</span>
	 <span class="fashion_tor"><a href="/d/index?action=special">更多...</a></span>
   </div>
   <div class="fashion_bo">
   <!--左侧开始-->
   <div class="lef_one">
	{foreach from=$proList item=p}
   <div class="hei_pica" style="height:290px;margin-left:0px;margin-right:9px;margin-top:10px;">
	  <div class="bigmg_a"><a href="http://item.taobao.com/item.htm?id={$p.iid}"><img data-ks-lazyload="{$p.pic}"></a></div>
	  <div class="bigmg_b">
	    <span class="bigmg_bl">{$p.title}</span>
		<span class="bigmg_br" style='padding-top:3px;'><a href="#"><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T21GF6XhxdXXXXXXXX_!!1661536580.png"></a></span>
	  </div>
	  <div class="bigmg_c">
	    <span class="bigmg_bl"><i>￥{$p.nprice}</i>&nbsp;<a href="#">{if $p.shop_type==1}<img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2DLIEXbFaXXXXXXXX_!!1661536580.png" />{else}<img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2MmIoXopaXXXXXXXX_!!1661536580.png">{/if}</a></span>
		<span class="bigmg_br"><a href="http://item.taobao.com/item.htm?id={$p.iid}"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2jYFoXixNXXXXXXXX_!!1661536580.jpg" /></a></span>
	  </div>
	</div>
	{/foreach}

			<div class="hei_pica" style="height:290px;margin-left:0px;margin-right:9px;margin-top:10px;">
	  <div class="bigmg_a"><a href=""><img src="http://img03.taobaocdn.com/imgextra/i3/189209818/T2WSITXkJaXXXXXXXX_!!189209818.jpg" /></a></div>
	 
	  <div class="bigmg_c" style="text-align:center">
	      <a href=""><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2UDMFXdJaXXXXXXXX_!!1661536580.jpg" /></a>
	  </div>
	</div>

		  <div class="ad2  ad2a" style="text-align:right;width:710px;overflow:hidden;float:left;display:inline;height:94px;background-color:red;margin-top:10px;">
		   <div class="ad2l"><a href="/d/jing" target="_blank">没发现感兴趣的商品？去逛逛【精选特卖】查看更多优惠>></a></div>
		 </div>

	</div>
 <!--左侧结束-->

 <!--右侧开始-->
 <div class="rig_one">


<div class="dui">
  <div class="dui_to">
    <span class="dui_tol">单品TOP榜</span>
	<span class="dui_tor"><a href="/d/index?action=special" target="_blank">更多...</a></span>
  </div>

{foreach from=$top item=t key=i}
  <div class="tui" {if $i==4}style="border:none;"{/if}>
    <div class="tui_l"><a href="http://item.taobao.com/item.htm?id={$t.iid}" target="_blank"><img style="width:100px;height:100px;" src="{$t.pic}" /></a>
    </div>
	<div class="tui_r">
	  <p class="colo1">￥{$t.nprice}</p>
	  <p style="color:#9A9A9A">原价：<span>{$t.oprice}</span></p>
	  <p>已有{$t.volume}人买过</p>
	  <p style="padding-top:5px;"><a href="http://item.taobao.com/item.htm?id={$t.iid}"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2jaAyXa4bXXXXXXXX_!!1661536580.jpg"></a></p>
	</div>
  </div>
  {/foreach}

</div>

</div>
 <!--右侧结束-->

   
   </div>
 </div>
 <!--时尚单品结束-->



 </div>
 <!--main结束-->

 {include file="footer.tpl"}
<script src="/assets/javascripts/sign.js"></script>
