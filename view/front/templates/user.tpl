<div class="body">
  {include file="header.tpl"}

 <!--main开始-->

  <div class="ban_all">
  <div class="ban_le">
	<ul class="list"></ul>
   	<div class="banner_list">
	{foreach from=$banner item=b key=k}
	   <a href="{$b.link}" {if $k!=0}class="in"{/if}target="_blank"><img data-ks-lazyload="{$b.pic}" alt="{$b.title}"/></a>
	{/foreach}
	</div>
  </div>
  <div class="ban_ri">
    <div class="ban_ri_frame">
	<div class="ban_ri_switch">
       <div class="ban_ria">
	  <ul>
	    <li style="border-right:1px dotted #E4E4E4;border-bottom:1px dotted #E4E4E4;"><a href="/d/user?tab=1"><span>Hi</span><br>{$username|default:'游客'}**</a></li>
		<li style="border-bottom:1px dotted #E4E4E4;"><a href="/d/user?tab=1"><span>我的珍珠</span><br>{if $username}<i class="pearl-num">{$pearl}</i>珍珠{else}<input type="button" value="请登入获取！" 
class="J_TB_Login" data-location="http://taodu.uz.taobao.com/d/user?nocache=1">{/if}</a></li>
		<li style="border-right:1px dotted #E4E4E4;"><a href="/d/user?tab=1"><span>更多精彩</span><br>个人中心</a></li>
		<li><a href="/d/user?tab=2"><span>可兑换商品</span><br><i>{$exNum}</i>件</a></li>
	  </ul>
	</div>
	<div class="ban_rib">
	  <ul>
	    <li><a href="/d/user?tab=1">珍珠攻略</a></li>
		<li><a href="/d/user?tab=1">{if $signNum}连签{$signNum}日{else}每日签到{/if}</a></li>
		<li style="width:60px;"><a href="/d/user?tab=4">收支记录</a></li>
	  </ul>
	</div>

       <div class="a_faa">
     	<div class="a_faa_toa">
	<p>方法一：查找<span>meilijingxuanuz</span></p>
	<p>方法二：用<span>微信</span>扫描二维码</p>
	 </div>
	 <div class="a_faa_tob"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2bYKyXi8cXXXXXXXX_!!1661536580.jpg" /></div>
       </div>
	</div>
	</div>

	<div class="ban_ric">
	  <span>淘尚之城，购物之都</span>
	  <span class="ban_ricr"><a data-sharebtn='{
	skinType:3,
	type:"webpage",
	key:"http://taodu.uz.taobao.com",
	comment:"我发现一个好U站——淘都U站#淘尚之城，购物之都#,推荐一下哦！",
	pic:"http://img04.taobaocdn.com/imgextra/i4/189209818/T2Dls1Xm4XXXXXXXXX_!!189209818.gif",
	client_id:68,
	isShowFriend:false
}'
class="sns-widget"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2KlLnXdtbXXXXXXXX_!!1661536580.jpg"></a></span>
	</div>
  </div>
 </div>

 <div class="centera">
    <div class="centera_to">
	  	 <ul>
			<li style="cursor:pointer;" data-id="0" class="tab{if $tab==1} yanse_a{/if}">珍珠攻略</li>
			<li style="cursor:pointer;" data-id="1" class="tab{if $tab==2} yanse_a{/if}">兑换商品</li>
			<li style="cursor:pointer;" data-id="2" class="tab{if $tab==3} yanse_a{/if}">个人信息</li>
			<li style="cursor:pointer;" data-id="3" class="tab{if $tab==4} yanse_a{/if}">收支记录</li>
		</ul>
	</div>
        <div class="loading_frame">
	<img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2JpVrXbpPXXXXXXXX_!!1661536580.gif"/>
	</div>
	<div class="centera_bo con_tab_0" {if $tab==1}style="display:block;"{/if}>
	  <!--第一块开始-->
         <div class="cen_onea">走过路过不要错过，赚珍珠有捷径，这个可以有</div>

		 <div class="cen_oneb">
		   <div class="cen_onebl">
		     <div class="cen_tu">
			   <span class="cen_tul"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T274.GXdhXXXXXXXXX_!!1661536580.jpg"></span>
			   <span class="cen_tur">
		       <p><a href="">完善个人信息</a></p>
				 <p>珍珠：<i>+4/个</i></p>
			   </span>
			 </div>
			 <div class="cen_tub">账号完整填写个人信息,操作不累加</div>
			 <div class="cen_tub" style="padding-top:30px;">
			{if $user.truename==null||$user.qq==null||$user.phone==null||$user.email==null||$user.address==null}
			<a class="userinfo_btn add_userinfo_btn">
			<img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2brwFXehaXXXXXXXX_!!1661536580.jpg"></a>
			{else}
			<a class="userinfo_btn">
			<img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T2b0wGXihXXXXXXXXX_!!1661536580.jpg"></a>
			{/if}</div>
		   </div>
		   <div class="cen_onebl">
		     <div class="cen_tu">
			   <span class="cen_tul" style="width:90px"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2N6.GXelXXXXXXXXX_!!1661536580.jpg"></span>
			   <span class="cen_tur">
		       <p style="color:#999999;font-weight:bold;padding-top:5px;"><a href="">购物领取红包</a></p>
				 <p>现金：<i>1元</i></p>
			   </span>
			 </div>
			 <div class="cen_tub" style="text-align:left;width:250px;padding-top:14px;">在淘都小站购物(任何商品)购物后，按要求评价和追加评价</div>
			 <div class="cen_tub" style="padding-top:10px;">
			<a href="#"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2brwFXehaXXXXXXXX_!!1661536580.jpg"></a>
			</div>
		   </div>
		   <div class="cen_onebl">
		     <div class="cen_tu">
			   <span class="cen_tul" style="width:90px"><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2LsEGXiFXXXXXXXXX_!!1661536580.jpg"></span>
			   <span class="cen_tur">
		       <p style="color:#999999;font-weight:bold;padding-top:5px;"><a href="">邀请好友</a></p>
				 <p>珍珠：<i>+3/个</i></p>
			   </span>
			 </div>
			 <div class="cen_tub" style="text-align:left;width:250px;padding-top:14px;">将下面文本框的内容和链接发给好友</div>
			 <div class="cen_tuc" style="margin-top:10px;line-height:15px;color:#333333;">我发现了一个不错的网站,快来看看!<br><font style="font-family:'Arial'">http://taodu.uz.taobao.com<br>/d/index?from={$user.id}</font></div>
		   </div>
		 </div>

		 <div class="cen_onea" style="padding-bottom:0px;">每天赚一点，不能瞬间成为白富美，也在成为白富美的道路上</div>

		 <div class="cen_last">
		   <div class="cen_lasta">
             <span class="cen_lastal"><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2BskvXaXbXXXXXXXX_!!1661536580.jpg"></span>
			 <span class="cen_lastar">
		     <p><a href="">每日签到</a></p>
			   <p style="font-size:14px;color:#999999;padding:5px 0;">珍珠：<i>+N/个</i></p>
			   <p>第一天+1,第二天+2...第五天及之后每天+5,若中断,则重新计算</p>
			 </span>
           </div>
		   <div class="cen_lasta">
             <span class="cen_lastal"><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2pCTgXjlaXXXXXXXX_!!1661536580.jpg"></span>
			 <span class="cen_lastar">
		     <p><a href="">点击商品</a></p>
			   <p style="font-size:14px;color:#999999;padding:5px 0;">珍珠：<i>+N/个</i></p>
			   <p>点击任意商品，多次按一次计算，随即送珍珠1-6颗，每天最多+6</p>
			 </span>
           </div>
		   <div class="cen_lasta">
             <span class="cen_lastal"><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2V_cFXldXXXXXXXXX_!!1661536580.jpg"></span>
			 <span class="cen_lastar">
		     <p><a href="">分享商品</a></p>
			   <p style="font-size:14px;color:#999999;padding:5px 0;">珍珠：<i>+2/个</i></p>
			   <p>同一账户在同一商品下多次分享按一条计算，每天最多+2</p>
			 </span>
           </div>
		   <div class="cen_lasta">
             <span class="cen_lastal"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2NXEGXkVXXXXXXXXX_!!1661536580.jpg"></span>
			 <span class="cen_lastar">
		     <p><a href="">商品抽奖</a></p>
			   <p style="font-size:14px;color:#999999;padding:5px 0;">珍珠：<i>+N/个</i></p>
			   <p>按步骤完成要求抽奖商品</p>
			 </span>
           </div>
		   <div class="cen_lasta">
             <span class="cen_lastal"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2xqwFXg0aXXXXXXXX_!!1661536580.jpg"></span>
			 <span class="cen_lastar">
		     <p style="color:#999999;font-size:14px;padding-top:40px;">更多珍珠任务 敬请期待</p>
			 </span>
           </div>
		 </div>

	  <!--第一块结束-->
	</div>
    <div class="centera_bo con_tab_1" {if $tab==2}style="display:block;"{/if}>
    <!--第二块开始-->
       <div class="duihuan">
	      <div class="duihuanl">
		     <p>1.所有淘都会员均可点击"珍珠图标或者珍珠数量"，进行宝贝兑换。</p>
			 <p>2.为了更好地回馈新老用户，所有的宝贝兑换不收取任何费用，只要你兑换成功，我们帮你代付所有费用。</p>
			 <p>3.只能使用在淘都U站获得的珍珠兑换，珍珠余额不足将则不能兑换，你也可以直接去淘宝购买该宝贝。</p>
			 <p>4.由于宝贝数量有限，每个宝贝每人仅能兑换一份，每人每天最多可以兑换3个宝贝。</p>
			 <p>5.淘都U站会在一个工作日完成代付操作具体到货时间取决于宝贝的发货时间。</p>
		  </div>
		  <div class="duihuanr"><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T243.FXcXaXXXXXXXX_!!1661536580.jpg"></div>
	   </div>


	    <!--时尚单品开始-->
 <div class="fashion" style="background-color:#EBEBEB">

   <div class="fashion_bo" style="background-color:#EBEBEB">
   <!--左侧开始-->
   <div class="lef_one exchange_pros" style="width:950px;overflow:hidden;background-color:#EBEBEB">

	{foreach from=$exPros item=p key=k}
	<div class="hei_pica" style="height:290px;{if $k%4==0}margin-left:0px;{/if}margin-top:10px;">
	  <div class="bigmg_a"><a href=""><img data-ks-lazyload="{$p.pic}" style="width:220px;height:220px;"></a></div>
	  <div class="bigmg_b">
	    <span class="bigmg_bl">{$p.title}</span>
		<span class="bigmg_br" style='padding-top:3px;'>{$p.num}件</span>
	  </div>
	  <div class="bigmg_c">
	    <span class="bigmg_bl">￥<i>{$p.nprice}</i>&nbsp;<b>￥{$p.oprice}</b></span>
		<span class="bigmg_br zhzu"><a class="do_exchange" title="{$p.id}"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2BPkFXcdaXXXXXXXX_!!1661536580.png" />{$p.xujf}</a></span>
	  </div>
	</div>
	{/foreach}

	</div>
 <!--左侧结束-->

   
   </div>
 </div>
 <!--时尚单品结束-->

	 <!--第二块结束-->
   </div>
	<div class="centera_bo con_tab_2" {if $tab==3}style="display:block;"{/if}>
	 <!--第三块开始-->
<div class="cen_onea">完善个人信息以便兑换发货</div>

<div class="wans">
 <div class="wansl">
    <table width="100%" cellpadding="0" cellspacing="0">
       <tr>
	      <td align="right" valign="middle">用户名：</td>
		  <td align="left" valign="middle" class="wan_put"><input type="text" name="user" class="user_name" value="{$user.username}"  readonly="true"></td>
	   </tr>
	   <tr>
	      <td align="right" valign="middle">真实姓名：</td>
		  <td align="left" valign="middle" class="wan_put"><input type="text" class="user_real" name="user"></td>
	   </tr>
	   <tr>
	      <td align="right" valign="middle">QQ：</td>
		  <td align="left" valign="middle" class="wan_put"><input type="text" class="user_qq" name="user"></td>
	   </tr>
	   <tr>
	      <td align="right" valign="middle">联系电话：</td>
		  <td align="left" valign="middle" class="wan_put"><input type="text" class="user_phone" name="user"></td>
	   </tr>
	   <tr>
	      <td align="right" valign="middle">邮箱：</td>
		  <td align="left" valign="middle" class="wan_put"><input type="text" class="user_email" name="user"></td>
	   </tr>
	   <tr>
	      <td align="right" valign="middle">收货地址：</td>
		  <td align="left" valign="middle" class="wan_put"><textarea class="user_address"></textarea></td>
	   </tr>
	   <tr>
	      <td align="right" valign="middle">&nbsp;</td>
		  <td align="left" valign="middle"><input type="image" class="user_info_submit" src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2GWcGXlhXXXXXXXXX_!!1661536580.jpg"></td>
	   </tr>
	</table>
 </div>
 <div class="wansr">
 <div class="a_fa">
  <div class="a_faa">
     <!--<div class="a_faa_toa">
<p>方法一：查找<span>meilijingxuanuz</span></p>
<p>方法二：用<span>微信</span>扫描二维码</p>
	 </div>
	 <div class="a_faa_tob"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2bYKyXi8cXXXXXXXX_!!1661536580.jpg"></div>-->
  </div>
</div>
 </div>
</div>
	 <!--第三块结束-->
	</div>
	<div class="centera_bo con_tab_3" {if $tab==4}style="display:block;"{/if}>
	 <!--第四块开始-->
        <div class="cen_fou">
		   <table width="100%" cellpadding="0" cellspacing="0">
			  <tr style="color:#666666;font-size:14px;font-weight:bold;">
				<td height="30" width="15%" align="center" valign="middle" bgcolor="#F7F7F7">时间</td>
				<td height="30" width="75%" align="center" valign="middle" bgcolor="#F7F7F7">详情</td>
				<td height="30" width="10%" align="center" valign="middle" bgcolor="#F7F7F7">操作</td>
			  </tr>
			</table>
		  <table class="event_list_table" width="100%" cellpadding="0" cellspacing="0">
			
			{foreach from=$eventList item=i}
			<tr>
				<td height="34" width="15%" align="center" valign="middle" bgcolor="#F7F7F7" class="putgd" style="font-family:'微软雅黑'">{$i.time}</td>
				<td height="34" width="75%" align="center" valign="middle" bgcolor="#F7F7F7" class="putgd">{$i.description}</td>
				<td height="34" width="10%" align="left" valign="middle" bgcolor="#F7F7F7" class="putgd"><a class="event_del" title="{$i.id}"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2WpZHXepXXXXXXXXX_!!1661536580.jpg" /></a></td>
			  </tr>
			{/foreach}			

		  </table>
	</div>
	
	<a class="event_clear" style="float:right;margin-right:30px;"><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T253sGXnlaXXXXXXXX_!!1661536580.jpg"></a>
	<div class="faq_page" style="margin-top:5px;">{$pageStr}</div>
	<!--第四块结束-->
	</div>

	<div style="width:950px;overflow:hidden;background-color:#EBEBEB">
  	<div class="ad2"><a href="/d/jing" target="_blank">没发现感兴趣的商品？去逛逛【精选特卖】查看更多优惠>></a></div>

 </div>
 </div>


 </div>
 <!--main结束-->

  {include file="footer.tpl"}

<!--950外弹出框开始-->

<div class="cen_tan ex_fail_box">
   <div class="cen_tan_to">
     <span class="qiandao_tol">商品兑换</span>
	  <span class="qiandao_tor"><a class="fail-box-close"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2m5oFXjFXXXXXXXXX_!!1661536580.jpg"></a></span>
   </div>
   <div class="cen_tan_bo">
      <div class="cen_tan_boa">
	    <span class="cen_tan_boal"><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T2Hs3GXixXXXXXXXXX_!!1661536580.jpg"></span>
		<span class="cen_tan_boar">珍珠不够继续努力哦!</span>
	  </div>
	  <div class="cen_tan_bob"><a class="fail-box-close"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2l6jcXi8bXXXXXXXX_!!1661536580.jpg"></a></div>
   </div>
</div>

<div class="cen_tan ex_success_box">
   <div class="cen_tan_to">
     <span class="qiandao_tol">商品兑换</span>
	  <span class="qiandao_tor"><a class="success-box-close"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2m5oFXjFXXXXXXXXX_!!1661536580.jpg"></a></span>
   </div>
   <div class="cen_tan_bo">
      <div class="cen_tan_boa">
	    <span class="cen_tan_boal"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2dYsFXdtaXXXXXXXX_!!1661536580.jpg"></span>
		<span class="cen_tan_boar" style="padding-top:25px;">恭喜亲，兑换成功！</br>商品将在三日内发出，敬请期待!</span>
	  </div>
	  <div class="cen_tan_bob"><a class="success-box-close"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2l6jcXi8bXXXXXXXX_!!1661536580.jpg"></a></div>
   </div>
</div>

<div class="cen_tan ex_noinfo_box">
   <div class="cen_tan_to">
     <span class="qiandao_tol">商品兑换</span>
	  <span class="qiandao_tor"><a class="noinfo-box-close"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2m5oFXjFXXXXXXXXX_!!1661536580.jpg"></a></span>
   </div>
   <div class="cen_tan_bo">
      <div class="cen_tan_boa">
	    <span class="cen_tan_boal"><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T2.cGMXndbXXXXXXXX_!!1661536580.jpg"></span>
		<span class="cen_tan_boar" style="padding-top:25px;">请完善个人信息再来兑换!</br>点击确定前往个人信息</span>
	  </div>
	  <div class="cen_tan_bob"><a class="noinfo-box-close"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2l6jcXi8bXXXXXXXX_!!1661536580.jpg"></a></div>
   </div>
</div>

<!--950外弹出框结束-->
<script src="/assets/javascripts/user.js"></script>
