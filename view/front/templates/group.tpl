<div class="body">
 {include file="header.tpl"}
 <div class="guang-nav">
	<div class="items clearfix">
		<a href="/d/index?action=shop" class="free-guang"></a>
                <a href="/d/index?action=album" class="theme-street"></a>
                <a href="/d/index?action=group" class="i-match current"></a>
	</div>
 </div>
 <!--main开始-->

 <!--图片滚动块开始-->
 <div class="oneimg">
   <div class="oneimga">
     <ul>
	   {foreach from=$treasure item=t}
	   <li><a href="{$t.link}"><img data-ks-lazyload="{$t.pic}"></a></li>
	   {/foreach}
		{foreach from=$treasure item=t}
	   <li><a href="{$t.link}"><img data-ks-lazyload="{$t.pic}"></a></li>
	   {/foreach}
	 </ul>
   </div>
	<div class="lef_img"><a><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2HvMnXfFbXXXXXXXX_!!1661536580.png"></a></div>
   	<div class="rig_img"><a><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T2TmZFXedXXXXXXXXX_!!1661536580.png"></a></div>
 </div>
 <!--图片滚动块结束-->

 <div class="gun_bao"> <div class="gun_bo">
   <ul class="event-roll">
	{foreach from=$events item=e}
         <li>{$e.time}&#12288;{$e.username}**&#12288;{$e.description}</li>
	{/foreach}
   </ul>
 </div></div>


  <!--高图开始-->
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
 <script type="text/javascript">
$(document).ready(function(){

  $(".hei_pica hei_picaaa").mouseover(function(){
   $(this).addClass("removeclass");
});

  $(".hei_pica hei_picaaa").mouseout(function(){
   $(this).removeClass("removeclass");
});

  $(".hei_picaa").mouseover(function(){
   $(this).addClass("removeclass");
});

  $(".hei_picaa").mouseout(function(){
   $(this).removeClass("removeclass");
});

});
</script>

  <div class="hei_pic" style="margin-top:0px;">
	{foreach from=$groups item=g key=i}
    <div class="hei_pica hei_picaaa" {if $i%4==0}style="margin-left:0px;"{/if}>
	  <div class="bigmg_a"><a href="/d/index?action=show&gid={$g.id}"><img data-ks-lazyload="{$g.pic}"></a></div>
	  <div class="bigmg_b">
	    <span class="bigmg_bl">{$g.title}</span>
		<span class="bigmg_br" style='padding-top:3px;'>
		<div data-sharebtn='{
	skinType:3,
	type:"webpage",
	key:"http://taodu.uz.taobao.com/d/index?action=show&gid={$g.id}",
	comment:"陶都U站,推荐一个好搭配哦！——{$g.intro}",
	pic:"{$g.pic}",
	client_id:68,
	isShowFriend:false
}'
class="sns-widget"><a><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T21GF6XhxdXXXXXXXX_!!1661536580.png"></a></div></span>
	  </div>
	  <div class="bigmg_c">
	    <span class="bigmg_bl">￥<i>{$g.price}</i>({$g.num}件搭配总价)</span>
		<span class="bigmg_br"><a href="/d/index?action=show&gid={$g.id}"><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2CgQEXcXaXXXXXXXX_!!1661536580.jpg"></a></span>
	  </div>
	</div>
	{/foreach}
   <div style="clear:both"></div>

	 <div class="ad2" style="text-align:right;">
   <div class="ad2l"><a href="/d/jing">没发现感兴趣的商品？去逛逛【精选特卖】查看更多优惠>></a></div>
   <div class="ad2r">
          <div class="faq_page">
		   <ul>
			 {$pageStr}
		   </ul>
		   </div>  
   </div>
 </div>


  </div>
 <!--高图结束-->

 
 
 </div>
 <!--main结束-->

 {include file="footer.tpl"}
<script src="/assets/javascripts/group.js"></script>
