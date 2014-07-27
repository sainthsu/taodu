<div class="body">
  {include file="header.tpl"}
 <div class="guang-nav">
	<div class="items clearfix">
		<a href="/d/index?action=shop" class="free-guang current"></a>
                <a href="/d/index?action=album" class="theme-street"></a>
                <a href="/d/index?action=group" class="i-match"></a>
	</div>
 </div>
 <!--main开始-->

 <div class="special">
    <div class="special_lef"><a href="/d/index?action=shop"><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T28jEFXk8XXXXXXXXX_!!1661536580.jpg" /></a></div>
	<div class="special_rig special_riga">
	  <ul>
	    <li><a href="/d/index?action=shop&cat=1"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2jMZEXhdaXXXXXXXX_!!1661536580.jpg" /><br>女装店</a></li>
		<li><a href="/d/index?action=shop&cat=2"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2Nd7GXX4XXXXXXXXX_!!1661536580.jpg" /><br>女鞋店</a></li>
		<li><a href="/d/index?action=shop&cat=3"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2sc7GXXNXXXXXXXXX_!!1661536580.jpg" /><br>美妆店</a></li>
		<li><a href="/d/index?action=shop&cat=4"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2ZbUGXcdXXXXXXXXX_!!1661536580.jpg" /><br>包包店</a></li>
		<li><a href="/d/index?action=shop&cat=5"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2YjUFXkxXXXXXXXXX_!!1661536580.jpg" /><br>内衣店</a></li>
		<li><a href="/d/index?action=shop&cat=6"><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T2c1W.XjNbXXXXXXXX_!!1661536580.jpg" /><br>配饰店</a></li>
		<li><a href="/d/index?action=shop&cat=7"><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T2xroGXdpXXXXXXXXX_!!1661536580.jpg" /><br>综合店</a></li>
	  </ul>
	</div>
 </div>



 <!--时尚单品开始-->
 <div class="fashion">

   <div class="fashion_bo">
   {foreach from=$shopList item=s}
   <div class="meipu">
     <div class="meipua">
     <div class="meipu_l">
	   <div class="meipula">{if $s.shop_type==1}<img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2DLIEXbFaXXXXXXXX_!!1661536580.png" />{else}<img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2MmIoXopaXXXXXXXX_!!1661536580.png">{/if}<a href="{$s.link}?nick_uz={$s.nick}">{$s.title}</a></div>
	   <div class="meipulb">{$s.intro}</div>
	   <div class="meipulc">{$s.tip}</div>
	   <div class="meipulc" style="padding-top:10px;padding-bottom:10px;"><a href="{$s.link}?nick_uz={$s.nick}" target="_blank"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2ElWqXfNcXXXXXXXX_!!1661536580.jpg" /></a><a href="{$s.link}?nick_uz={$s.nick}" target="_blank"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T25W7FXoFXXXXXXXXX_!!1661536580.jpg" /></a></div>
	 </div>
	 <div class="meipu_r">
	    <!--图片滚动块开始-->
 <div class="meiimg">
   <div class="meiimga">
     <ul>
	{foreach from=$s.pros item=p key=i}
	   <li {if $i==0}style="margin-left:10px;"{/if}><a href="http://item.taobao.com/item.htm?id={$p.iid}" target="_blank"><img src="{$p.pic}" /></a><span>￥{$p.nprice}</span></li>
	{/foreach}
	{foreach from=$s.pros item=p key=i}
	   <li {if $i==0}style="margin-left:10px;"{/if}><a href="http://item.taobao.com/item.htm?id={$p.iid}" target="_blank"><img src="{$p.pic}" /></a><span>￥{$p.nprice}</span></li>
	{/foreach}
    </ul>
   </div>
   <div class="meil_img"><a><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2HvMnXfFbXXXXXXXX_!!1661536580.png"></a></div>
   <div class="meir_img"><a><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T2TmZFXedXXXXXXXXX_!!1661536580.png"></a></div>
 </div>
 <!--图片滚动块结束--> 
	 </div>
   </div>
  </div>
   {/foreach}
   </div>
 </div>
 <!--时尚单品结束-->

 <div class="ad2" style="text-align:right;">
   <div class="ad2l"><a href="/d/jing" target="_blank">没发现感兴趣的商品？去逛逛【精选特卖】查看更多优惠>></a></div>
   <div class="ad2r">
          <div class="faq_page">
		   {$pageStr}
	  </div>  
   </div>
 </div>


 
 
 </div>
 <!--main结束-->

 {include file="footer.tpl"}
<script src="/assets/javascripts/shop.js"></script>
