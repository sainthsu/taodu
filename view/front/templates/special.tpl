<div class="body">
 {include file="header.tpl"}

 <!--main��ʼ-->

 <div class="special">
    <div class="special_lef"><a href="/d/index?action=special&cat=0"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2NuUEXfRaXXXXXXXX_!!1661536580.jpg" /></a></div>
	<div class="special_rig">
	  <ul>
	    <li><a href="/d/index?action=special&cat=1"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2jMZEXhdaXXXXXXXX_!!1661536580.jpg" /><br>����</a></li>
		<li><a href="/d/index?action=special&cat=2"><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2DBEFXdhXXXXXXXXX_!!1661536580.jpg" /><br>����</a></li>
		<li><a href="/d/index?action=special&cat=3"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2Nd7GXX4XXXXXXXXX_!!1661536580.jpg" /><br>ŮЬ</a></li>
		<li><a href="/d/index?action=special&cat=4"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2ZbUGXcdXXXXXXXXX_!!1661536580.jpg" /><br>����</a></li>
		<li><a href="/d/index?action=special&cat=5"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2sc7GXXNXXXXXXXXX_!!1661536580.jpg" /><br>��ױ</a></li>
		<li><a href="/d/index?action=special&cat=6"><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T2c1W.XjNbXXXXXXXX_!!1661536580.jpg" /><br>����</a></li>
		<li><a href="/d/index?action=special&cat=7"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2YjUFXkxXXXXXXXXX_!!1661536580.jpg" /><br>����</a></li>
		<li><a href="/d/index?action=special&cat=8"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2YrEgXatbXXXXXXXX_!!1661536580.jpg" /><br>ȹװ</a></li>
	  </ul>
	</div>
 </div>

 <!--��ͼ��ʼ-->

 <script type="text/javascript">
$(document).ready(function(){

  $(".hei_pica").mouseover(function(){
   $(this).addClass("removeclass");
});

  $(".hei_pica").mouseout(function(){
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
 <!--ʱ�е�Ʒ��ʼ-->
 <div class="fashion">

   <div class="fashion_bo">
   <!--��࿪ʼ-->
   <div class="lef_one" style="width:950px;overflow:hidden;">
   {foreach from=$pros item=p key=i}
   <div class="hei_pica" style="height:290px;margin-left:0px;{if ($i+1)%4!=0}margin-right:9px;{/if}margin-top:10px;">
	  <div class="bigmg_a"><a href="http://item.taobao.com/item.htm?id={$p.iid}" target="_blank"><img style="width:220px;height:220px;" data-ks-lazyload="{$p.pic}"></a></div>
	  <div class="bigmg_b">
	    <span class="bigmg_bl">{$p.title}</span>
		<span class="bigmg_br" style='padding-top:3px;'>
		<div data-sharebtn='{
	skinType:3,
	type:"1",
	key:"{$p.iid}",
	comment:"�����Զ�Uվ���ָ��ö���Ŷ����{$p.title}#����֮�ǣ�����֮��#",
	pic:"{$p.pic}",
	client_id:68,
	isShowFriend:false
}'
class="sns-widget"><a><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T21GF6XhxdXXXXXXXX_!!1661536580.png"></a></div></span>
	  </div>
	  <div class="bigmg_c">
	    <span class="bigmg_bl"><i>��{$p.nprice}</i>&nbsp;<a href="http://item.taobao.com/item.htm?id={$p.iid}" target="_blank">{if $p.shop_type==1}<img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2DLIEXbFaXXXXXXXX_!!1661536580.png" />{else}<img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2MmIoXopaXXXXXXXX_!!1661536580.png">{/if}</a></span>
		<span class="bigmg_br"><a href="http://item.taobao.com/item.htm?id={$p.iid}" target="_blank"><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2_2qNXchbXXXXXXXX_!!1661536580.jpg" /></a></span>
	  </div>
	</div>
	{/foreach}
	</div>
 <!--������-->

   
   </div>
 </div>
 <!--ʱ�е�Ʒ����-->

 <div class="ad2" style="text-align:right;">
   <div class="ad2l"><a href="/d/jing" target="_blank">û���ָ���Ȥ����Ʒ��ȥ��䡾��ѡ�������鿴�����Ż�>></a></div>
   <div class="ad2r">
          <div class="faq_page">
		   {$pageStr}
	</div>  
   </div>
 </div>


 
 
 </div>
 <!--main����-->

 {include file="footer.tpl"}
<script src="/assets/javascripts/sign.js"></script>
