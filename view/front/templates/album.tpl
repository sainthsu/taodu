<div class="body">
  {include file="header.tpl"}
 <div class="guang-nav">
	<div class="items clearfix">
		<a href="/d/index?action=shop" class="free-guang"></a>
                <a href="/d/index?action=album" class="theme-street current"></a>
                <a href="/d/index?action=group" class="i-match"></a>
	</div>
 </div>
 <!--main��ʼ-->

 <!--ʱ�е�Ʒ��ʼ-->
 <div class="fashion">

   <div class="fashion_bo">

      <!--��࿪ʼ-->
   <div class="lef_one">
	{foreach from=$albums item=a}
	<div class="beau">
	   <div class="beaua"><a href="/d/act?id={$a.id}" target="_blank"><img src="{$a.pic}" /></a></div>
	   <div class="beaub">
	     <span class="beaubl">{$a.title}&nbsp;
		<a data-sharebtn='{
	skinType:3,
	type:"webpage",
	key:"http://taodu.uz.taobao.com/d/act?id={$a.id}",
	comment:"�Զ�Uվ#����֮�ǣ�����֮��#,����ֹ�䣡����{$a.title}",
	pic:"{$a.thumb}",
	client_id:68,
	isShowFriend:false
}'
class="sns-widget"><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T21GF6XhxdXXXXXXXX_!!1661536580.png"></a></span> 
		 <span class="beaubr"><a href="/d/act?id={$a.id}" target="_blank"><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2CgQEXcXaXXXXXXXX_!!1661536580.jpg" /></a></span> 
	   </div>
	   <div class="beauc">{$a.intro}</div>
	</div>
	{/foreach}
	  <div class="ad2" style="text-align:right;width:710px;overflow:hidden;float:left;display:inline">
	   <div class="ad2l" style="width:390px;overflow:hidden;"><a href="/d/jing" target="_blank">û���ָ���Ȥ����Ʒ��ȥ��䡾��ѡ�������鿴�����Ż�>></a></div>
	   <div class="ad2r" style="width:310px;overflow:hidden;">
			  <div class="faq_page">
			   {$pageStr}
			   </div>  
	   </div>
	 </div>



	</div>

 <!--�Ҳ࿪ʼ-->

<div class="rig_one">
<div class="flya">
  {foreach from=$act item=a}
  <div class="fly_to"><a href="/d/act?id={$a.id}" target="_blank"><img src="{$a.thumb}"></a></div>
  <div class="fly_bo">&nbsp;</div>
  <div class="fly_boa">{$a.title}</div>
  {/foreach}
</div>

<div class="dui">
  <div class="dui_to">
    <span class="dui_tol">�һ���Ʒ</span>
	<span class="dui_tor"><a class="ex_dot dot_seleted" data-id="0"></a>&nbsp;<a class="ex_dot" data-id="1"></a>&nbsp;<a class="ex_dot" data-id="2"></a></span>
  </div>
  <div class="ex_pro_frame">
  <ul class="ex_pro">
  {foreach from=$exchange item=e}
  <li>
  <div class="dui_ce">
  <img data-ks-lazyload="{$e.pic}" style="width:220px;height:220px;"></div>
  <div class="dui_bo">{$e.title}</div>
  <div class="dui_la">
    <span class="dui_lal"><i>{$e.xujf}</i>����</span>
	<span class="dui_lar">�۸�{$e.nprice} </span>
  </div>
  </li>
  {/foreach}
  </ul>
   </div>
</div>

<div class="dui">
  <div class="dui_to">
    <span class="dui_tol">��ƷTOP��</span>
	<span class="dui_tor"><a href="/d/index?action=special" target="_blank">����...</a></span>
  </div>
  {foreach from=$top item=t key=i}
  <div class="tui" {if $i==4}style="border:none;"{/if}>
    <div class="tui_l"><a href="http://item.taobao.com/item.htm?id={$t.iid}" target="_blank"><img style="width:100px;height:100px;" src="{$t.pic}" /></a>
    </div>
	<div class="tui_r">
	  <p class="colo1">��{$t.nprice}</p>
	  <p style="color:#9A9A9A">ԭ�ۣ�<span>{$t.oprice}</span></p>
	  <p>����{$t.volume}�����</p>
	  <p style="padding-top:5px;"><a href="http://item.taobao.com/item.htm?id={$t.iid}" target="_blank"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2jaAyXa4bXXXXXXXX_!!1661536580.jpg"></a></p>
	</div>
  </div>
  {/foreach}
</div>


<div class="dui">
  <div class="dui_to">
    <span class="dui_tol">�����Ƽ�</span>
	<span class="dui_tor"><a href="/d/index?action=shop" target="_blank">����...</a></span>
  </div>
  {foreach from=$rightShop item=r}
  <div class="tabls">
    <table width="91%" cellpadding="0" cellspacing="1" bgcolor="#E4E4E4">
      <tr>
        <td align="center" valign="middle" width="50%" bgcolor="#FFFFFF"><img src="{$r.thumb}" /></td>
		<td align="center" valign="middle" width="50%" bgcolor="#FFFFFF">{$r.discount}��</td>
	  </tr>
	</table>
  </div>
  {/foreach}
  </div>
</div>

</div>
 <!--�Ҳ����-->

   
   </div>
 </div>
 <!--ʱ�е�Ʒ����-->
 
 </div>
 <!--main����-->

  {include file="footer.tpl"}
<script src="/assets/javascripts/album.js"></script>
