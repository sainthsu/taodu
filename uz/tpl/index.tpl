<title>{$title}</title>
<meta name="description" content="{$description}" />
<meta name="keywords" content="{$keywords}"/>
<div class="body"> 
<div class="box"> 
 {include file="header.tpl"}
 <!--main开始-->
 <div class="main">
 <div class="ban_all_ken" style="padding:5px;margin-top:10px;background:white;">
   	<div class="intro">
		{$title}:{$intro}
	</div>
</div>

 <!--时尚单品开始-->
 <div class="fashion">
   <div class="fashion_bo">
   <!--左侧开始-->
   <div class="lef_one" style="width:950px;overflow:hidden;">
       {foreach from=$products item=s key=i}
	<div class="hei_pica" style="height:300px;margin-left:{if $i%4!=0}9{else}0{/if}px;margin-right:0px;margin-top:20px;">
	  <div class="bigmg_a"><a href="http://item.taobao.com/item.htm?id={$s.iid}" target="_blank"><img src="/assets/images/logo.gif" style="width:220px;height:220px;" data-ks-lazyload="{$s.pic}"></a></div>
	  <div class="bigmg_b">
	    <span class="bigmg_bl">{$s.title}</span>
		<span class="bigmg_br" style='padding-top:3px;'>
		<div data-sharebtn='{
	skinType:3,
	type:"1",
	key:"{$s.iid}",
	comment:"我在特价精选U站发现个好东东哦——{$s.title}",
	pic:"{$s.pic}",
	client_id:68,
	isShowFriend:false
}'
class="sns-widget"><a><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T21GF6XhxdXXXXXXXX_!!1661536580.png"></a></div>
	</span>
	  </div>
	  <div class="bigmg_c">
	    <span class="bigmg_bl">￥<i>{$s.nprice}</i><b>￥{$s.oprice}</b></span>
		<span class="bigmg_br"><a href="http://item.taobao.com/item.htm?id={$s.iid}" target="_blank"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2OkhKXxxXXXXXXXXX-1661536580.jpg" /></a></span>
	  </div>
	</div>
        {/foreach}
   </div>
 </div>
  <div class="clear"></div>
  <div style="height:10px;"></div>
 <!--左侧结束-->
</div>
 <!--时尚单品结束-->
 
 </div>
 <div class="page"></div>
 <!--main结束-->

 {include file="footer.tpl"}
</div>      
</div>
<script src="/assets/javascripts/index.js"></script>
