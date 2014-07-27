<title>{$title}</title>
<meta name="description" content="{$description}" />
<meta name="keywords" content="{$keywords}"/>
<div style="width:990px;margin:0px auto;min-height:500px;">
<div style="margin-top:6px;margin-bottom:6px;">
您当前的位置：<a href="http://taodu.uz.taobao.com/?nocache" class="a05">精选特卖</a>&gt;<a href="http://taodu.uz.taobao.com/shop/index.php" class="a05">热门店铺</a>          
</div>
<div style="border-bottom:2px solid #C6D5DB;margin-bottom:3px;">淘宝网店铺导航</div>
<div style="border:1px solid #C6D5DB;min-height:300px;">
	<ul style="padding:10px;">
		{foreach from=$shops item=s key=i}
      <li style="float:left;width:20%;height:20px;display:block;overflow:hidden;"><a style="color:#0066DD;" target="_blank" href="http://taodu.uz.taobao.com/shop/detail.php?id={$s.id}">{$s.name}</a></li>
		{/foreach}
   </ul>
<div style="clear:both;"></div>
</div>
    <div class="faq_page"> 
   	{$pageStr}
  </div>
</div>
