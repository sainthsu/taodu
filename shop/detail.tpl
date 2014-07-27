<title>{$title}</title>
<meta name="description" content="{$description}" />
<meta name="keywords" content="{$keywords}"/>
<div style="width:100%;background:#F4F2EE;margin:0px auto;min-height:500px;">
<div style="height:10px;"></div>
<div style="width:970px;margin:0px auto;background:#FFF;min-height:500px;">
<div style="margin-top:6px;margin-bottom:6px;height:40px;line-height:50px;padding-left:10px;">
您当前的位置：<a href="http://taodu.uz.taobao.com/?nocache=1" class="a05">精选特卖</a>&gt;<a href="http://taodu.uz.taobao.com/shop/index.php" class="a05">店铺导航</a>&gt;{$shop.name}</div>
 <div style="height:168px;width:950px;margin:0px auto;border-right:2px solid rgb(244,218,180);border-style:solid;border-color:rgb(244,218,180);border-width:5px 2px 2px;">
 <div style="width:500px;height:122px;margin-top:20px;margin-left:15px;">
 <div style="float:left;width:130px;"><img style="width:120px;height:120px;" src="{$shop.logo}"></div>
 <div style="float:right;width:370px;"> 
  <div style="float:left;width:130px;">
 <dl style="height:25px;">店铺：{$shop.name}</dl>
 <dl style="height:25px;">掌柜：{$shop.nick}</dl>
 <dl style="height:25px;">好评率：{$shop.goodRate}%</dl>
 <dl style="height:25px;">收藏数：{$shop.collect}</dl> 
 <dl style="height:25px;">分类：{$shop.catName}</dl> 
  </div>  
 </div>
 </div>
 </div>
 <div style="background:none repeat scroll 0% 0% rgb(251,251,251);height:5px;margin:10px 0px 10px 10px;width:950px;"></div>
 <div style="width:950px;margin:0 auto;">
  <div style="width:950px;border-bottom:2px solid #FF5500;margin-bottom:20px;">
  <div style="width:130px;height:30px;background:none repeat scroll 0% 0% rgb(255,110,0);"> <span style="color:rgb(255,255,255);line-height:30px;text-align:center;margin-left:20px;">推荐特价商品</span></div>
   </div>
<div style="margin-left:6px;">  
 
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
	comment:"我在精选特卖U站发现个好东东哦——{$s.title}",
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
</div> 

 
<div style="clear:both;"></div>
</div>
</div>
