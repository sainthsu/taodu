<div class="body">
  {include file="header.tpl"}

 <!--main��ʼ-->

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
	    <li style="border-right:1px dotted #E4E4E4;border-bottom:1px dotted #E4E4E4;"><a href="/d/user?tab=1"><span>Hi</span><br>{$username|default:'�ο�'}**</a></li>
		<li style="border-bottom:1px dotted #E4E4E4;"><a href="/d/user?tab=1"><span>�ҵ�����</span><br>{if $username}<i class="pearl-num">{$pearl}</i>����{else}<input type="button" value="������ȡ��" 
class="J_TB_Login" data-location="http://taodu.uz.taobao.com/d/user?nocache=1">{/if}</a></li>
		<li style="border-right:1px dotted #E4E4E4;"><a href="/d/user?tab=1"><span>���ྫ��</span><br>��������</a></li>
		<li><a href="/d/user?tab=2"><span>�ɶһ���Ʒ</span><br><i>{$exNum}</i>��</a></li>
	  </ul>
	</div>
	<div class="ban_rib">
	  <ul>
	    <li><a href="/d/user?tab=1">���鹥��</a></li>
		<li><a href="/d/user?tab=1">{if $signNum}��ǩ{$signNum}��{else}ÿ��ǩ��{/if}</a></li>
		<li style="width:60px;"><a href="/d/user?tab=4">��֧��¼</a></li>
	  </ul>
	</div>

       <div class="a_faa">
     	<div class="a_faa_toa">
	<p>����һ������<span>meilijingxuanuz</span></p>
	<p>����������<span>΢��</span>ɨ���ά��</p>
	 </div>
	 <div class="a_faa_tob"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2bYKyXi8cXXXXXXXX_!!1661536580.jpg" /></div>
       </div>
	</div>
	</div>

	<div class="ban_ric">
	  <span>����֮�ǣ�����֮��</span>
	  <span class="ban_ricr"><a data-sharebtn='{
	skinType:3,
	type:"webpage",
	key:"http://taodu.uz.taobao.com",
	comment:"�ҷ���һ����Uվ�����Զ�Uվ#����֮�ǣ�����֮��#,�Ƽ�һ��Ŷ��",
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
			<li style="cursor:pointer;" data-id="0" class="tab{if $tab==1} yanse_a{/if}">���鹥��</li>
			<li style="cursor:pointer;" data-id="1" class="tab{if $tab==2} yanse_a{/if}">�һ���Ʒ</li>
			<li style="cursor:pointer;" data-id="2" class="tab{if $tab==3} yanse_a{/if}">������Ϣ</li>
			<li style="cursor:pointer;" data-id="3" class="tab{if $tab==4} yanse_a{/if}">��֧��¼</li>
		</ul>
	</div>
        <div class="loading_frame">
	<img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2JpVrXbpPXXXXXXXX_!!1661536580.gif"/>
	</div>
	<div class="centera_bo con_tab_0" {if $tab==1}style="display:block;"{/if}>
	  <!--��һ�鿪ʼ-->
         <div class="cen_onea">�߹�·����Ҫ�����׬�����нݾ������������</div>

		 <div class="cen_oneb">
		   <div class="cen_onebl">
		     <div class="cen_tu">
			   <span class="cen_tul"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T274.GXdhXXXXXXXXX_!!1661536580.jpg"></span>
			   <span class="cen_tur">
		       <p><a href="">���Ƹ�����Ϣ</a></p>
				 <p>���飺<i>+4/��</i></p>
			   </span>
			 </div>
			 <div class="cen_tub">�˺�������д������Ϣ,�������ۼ�</div>
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
		       <p style="color:#999999;font-weight:bold;padding-top:5px;"><a href="">������ȡ���</a></p>
				 <p>�ֽ�<i>1Ԫ</i></p>
			   </span>
			 </div>
			 <div class="cen_tub" style="text-align:left;width:250px;padding-top:14px;">���Զ�Сվ����(�κ���Ʒ)����󣬰�Ҫ�����ۺ�׷������</div>
			 <div class="cen_tub" style="padding-top:10px;">
			<a href="#"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2brwFXehaXXXXXXXX_!!1661536580.jpg"></a>
			</div>
		   </div>
		   <div class="cen_onebl">
		     <div class="cen_tu">
			   <span class="cen_tul" style="width:90px"><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2LsEGXiFXXXXXXXXX_!!1661536580.jpg"></span>
			   <span class="cen_tur">
		       <p style="color:#999999;font-weight:bold;padding-top:5px;"><a href="">�������</a></p>
				 <p>���飺<i>+3/��</i></p>
			   </span>
			 </div>
			 <div class="cen_tub" style="text-align:left;width:250px;padding-top:14px;">�������ı�������ݺ����ӷ�������</div>
			 <div class="cen_tuc" style="margin-top:10px;line-height:15px;color:#333333;">�ҷ�����һ���������վ,��������!<br><font style="font-family:'Arial'">http://taodu.uz.taobao.com<br>/d/index?from={$user.id}</font></div>
		   </div>
		 </div>

		 <div class="cen_onea" style="padding-bottom:0px;">ÿ��׬һ�㣬����˲���Ϊ�׸�����Ҳ�ڳ�Ϊ�׸����ĵ�·��</div>

		 <div class="cen_last">
		   <div class="cen_lasta">
             <span class="cen_lastal"><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2BskvXaXbXXXXXXXX_!!1661536580.jpg"></span>
			 <span class="cen_lastar">
		     <p><a href="">ÿ��ǩ��</a></p>
			   <p style="font-size:14px;color:#999999;padding:5px 0;">���飺<i>+N/��</i></p>
			   <p>��һ��+1,�ڶ���+2...�����켰֮��ÿ��+5,���ж�,�����¼���</p>
			 </span>
           </div>
		   <div class="cen_lasta">
             <span class="cen_lastal"><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2pCTgXjlaXXXXXXXX_!!1661536580.jpg"></span>
			 <span class="cen_lastar">
		     <p><a href="">�����Ʒ</a></p>
			   <p style="font-size:14px;color:#999999;padding:5px 0;">���飺<i>+N/��</i></p>
			   <p>���������Ʒ����ΰ�һ�μ��㣬�漴������1-6�ţ�ÿ�����+6</p>
			 </span>
           </div>
		   <div class="cen_lasta">
             <span class="cen_lastal"><img src="http://img02.taobaocdn.com/imgextra/i2/1661536580/T2V_cFXldXXXXXXXXX_!!1661536580.jpg"></span>
			 <span class="cen_lastar">
		     <p><a href="">������Ʒ</a></p>
			   <p style="font-size:14px;color:#999999;padding:5px 0;">���飺<i>+2/��</i></p>
			   <p>ͬһ�˻���ͬһ��Ʒ�¶�η���һ�����㣬ÿ�����+2</p>
			 </span>
           </div>
		   <div class="cen_lasta">
             <span class="cen_lastal"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2NXEGXkVXXXXXXXXX_!!1661536580.jpg"></span>
			 <span class="cen_lastar">
		     <p><a href="">��Ʒ�齱</a></p>
			   <p style="font-size:14px;color:#999999;padding:5px 0;">���飺<i>+N/��</i></p>
			   <p>���������Ҫ��齱��Ʒ</p>
			 </span>
           </div>
		   <div class="cen_lasta">
             <span class="cen_lastal"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2xqwFXg0aXXXXXXXX_!!1661536580.jpg"></span>
			 <span class="cen_lastar">
		     <p style="color:#999999;font-size:14px;padding-top:40px;">������������ �����ڴ�</p>
			 </span>
           </div>
		 </div>

	  <!--��һ�����-->
	</div>
    <div class="centera_bo con_tab_1" {if $tab==2}style="display:block;"{/if}>
    <!--�ڶ��鿪ʼ-->
       <div class="duihuan">
	      <div class="duihuanl">
		     <p>1.�����Զ���Ա���ɵ��"����ͼ�������������"�����б����һ���</p>
			 <p>2.Ϊ�˸��õػ��������û������еı����һ�����ȡ�κη��ã�ֻҪ��һ��ɹ������ǰ���������з��á�</p>
			 <p>3.ֻ��ʹ�����Զ�Uվ��õ�����һ����������㽫���ܶһ�����Ҳ����ֱ��ȥ�Ա�����ñ�����</p>
			 <p>4.���ڱ����������ޣ�ÿ������ÿ�˽��ܶһ�һ�ݣ�ÿ��ÿ�������Զһ�3��������</p>
			 <p>5.�Զ�Uվ����һ����������ɴ����������嵽��ʱ��ȡ���ڱ����ķ���ʱ�䡣</p>
		  </div>
		  <div class="duihuanr"><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T243.FXcXaXXXXXXXX_!!1661536580.jpg"></div>
	   </div>


	    <!--ʱ�е�Ʒ��ʼ-->
 <div class="fashion" style="background-color:#EBEBEB">

   <div class="fashion_bo" style="background-color:#EBEBEB">
   <!--��࿪ʼ-->
   <div class="lef_one exchange_pros" style="width:950px;overflow:hidden;background-color:#EBEBEB">

	{foreach from=$exPros item=p key=k}
	<div class="hei_pica" style="height:290px;{if $k%4==0}margin-left:0px;{/if}margin-top:10px;">
	  <div class="bigmg_a"><a href=""><img data-ks-lazyload="{$p.pic}" style="width:220px;height:220px;"></a></div>
	  <div class="bigmg_b">
	    <span class="bigmg_bl">{$p.title}</span>
		<span class="bigmg_br" style='padding-top:3px;'>{$p.num}��</span>
	  </div>
	  <div class="bigmg_c">
	    <span class="bigmg_bl">��<i>{$p.nprice}</i>&nbsp;<b>��{$p.oprice}</b></span>
		<span class="bigmg_br zhzu"><a class="do_exchange" title="{$p.id}"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2BPkFXcdaXXXXXXXX_!!1661536580.png" />{$p.xujf}</a></span>
	  </div>
	</div>
	{/foreach}

	</div>
 <!--������-->

   
   </div>
 </div>
 <!--ʱ�е�Ʒ����-->

	 <!--�ڶ������-->
   </div>
	<div class="centera_bo con_tab_2" {if $tab==3}style="display:block;"{/if}>
	 <!--�����鿪ʼ-->
<div class="cen_onea">���Ƹ�����Ϣ�Ա�һ�����</div>

<div class="wans">
 <div class="wansl">
    <table width="100%" cellpadding="0" cellspacing="0">
       <tr>
	      <td align="right" valign="middle">�û�����</td>
		  <td align="left" valign="middle" class="wan_put"><input type="text" name="user" class="user_name" value="{$user.username}"  readonly="true"></td>
	   </tr>
	   <tr>
	      <td align="right" valign="middle">��ʵ������</td>
		  <td align="left" valign="middle" class="wan_put"><input type="text" class="user_real" name="user"></td>
	   </tr>
	   <tr>
	      <td align="right" valign="middle">QQ��</td>
		  <td align="left" valign="middle" class="wan_put"><input type="text" class="user_qq" name="user"></td>
	   </tr>
	   <tr>
	      <td align="right" valign="middle">��ϵ�绰��</td>
		  <td align="left" valign="middle" class="wan_put"><input type="text" class="user_phone" name="user"></td>
	   </tr>
	   <tr>
	      <td align="right" valign="middle">���䣺</td>
		  <td align="left" valign="middle" class="wan_put"><input type="text" class="user_email" name="user"></td>
	   </tr>
	   <tr>
	      <td align="right" valign="middle">�ջ���ַ��</td>
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
<p>����һ������<span>meilijingxuanuz</span></p>
<p>����������<span>΢��</span>ɨ���ά��</p>
	 </div>
	 <div class="a_faa_tob"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2bYKyXi8cXXXXXXXX_!!1661536580.jpg"></div>-->
  </div>
</div>
 </div>
</div>
	 <!--���������-->
	</div>
	<div class="centera_bo con_tab_3" {if $tab==4}style="display:block;"{/if}>
	 <!--���Ŀ鿪ʼ-->
        <div class="cen_fou">
		   <table width="100%" cellpadding="0" cellspacing="0">
			  <tr style="color:#666666;font-size:14px;font-weight:bold;">
				<td height="30" width="15%" align="center" valign="middle" bgcolor="#F7F7F7">ʱ��</td>
				<td height="30" width="75%" align="center" valign="middle" bgcolor="#F7F7F7">����</td>
				<td height="30" width="10%" align="center" valign="middle" bgcolor="#F7F7F7">����</td>
			  </tr>
			</table>
		  <table class="event_list_table" width="100%" cellpadding="0" cellspacing="0">
			
			{foreach from=$eventList item=i}
			<tr>
				<td height="34" width="15%" align="center" valign="middle" bgcolor="#F7F7F7" class="putgd" style="font-family:'΢���ź�'">{$i.time}</td>
				<td height="34" width="75%" align="center" valign="middle" bgcolor="#F7F7F7" class="putgd">{$i.description}</td>
				<td height="34" width="10%" align="left" valign="middle" bgcolor="#F7F7F7" class="putgd"><a class="event_del" title="{$i.id}"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2WpZHXepXXXXXXXXX_!!1661536580.jpg" /></a></td>
			  </tr>
			{/foreach}			

		  </table>
	</div>
	
	<a class="event_clear" style="float:right;margin-right:30px;"><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T253sGXnlaXXXXXXXX_!!1661536580.jpg"></a>
	<div class="faq_page" style="margin-top:5px;">{$pageStr}</div>
	<!--���Ŀ����-->
	</div>

	<div style="width:950px;overflow:hidden;background-color:#EBEBEB">
  	<div class="ad2"><a href="/d/jing" target="_blank">û���ָ���Ȥ����Ʒ��ȥ��䡾��ѡ�������鿴�����Ż�>></a></div>

 </div>
 </div>


 </div>
 <!--main����-->

  {include file="footer.tpl"}

<!--950�ⵯ����ʼ-->

<div class="cen_tan ex_fail_box">
   <div class="cen_tan_to">
     <span class="qiandao_tol">��Ʒ�һ�</span>
	  <span class="qiandao_tor"><a class="fail-box-close"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2m5oFXjFXXXXXXXXX_!!1661536580.jpg"></a></span>
   </div>
   <div class="cen_tan_bo">
      <div class="cen_tan_boa">
	    <span class="cen_tan_boal"><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T2Hs3GXixXXXXXXXXX_!!1661536580.jpg"></span>
		<span class="cen_tan_boar">���鲻������Ŭ��Ŷ!</span>
	  </div>
	  <div class="cen_tan_bob"><a class="fail-box-close"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2l6jcXi8bXXXXXXXX_!!1661536580.jpg"></a></div>
   </div>
</div>

<div class="cen_tan ex_success_box">
   <div class="cen_tan_to">
     <span class="qiandao_tol">��Ʒ�һ�</span>
	  <span class="qiandao_tor"><a class="success-box-close"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2m5oFXjFXXXXXXXXX_!!1661536580.jpg"></a></span>
   </div>
   <div class="cen_tan_bo">
      <div class="cen_tan_boa">
	    <span class="cen_tan_boal"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2dYsFXdtaXXXXXXXX_!!1661536580.jpg"></span>
		<span class="cen_tan_boar" style="padding-top:25px;">��ϲ�ף��һ��ɹ���</br>��Ʒ���������ڷ����������ڴ�!</span>
	  </div>
	  <div class="cen_tan_bob"><a class="success-box-close"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2l6jcXi8bXXXXXXXX_!!1661536580.jpg"></a></div>
   </div>
</div>

<div class="cen_tan ex_noinfo_box">
   <div class="cen_tan_to">
     <span class="qiandao_tol">��Ʒ�һ�</span>
	  <span class="qiandao_tor"><a class="noinfo-box-close"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2m5oFXjFXXXXXXXXX_!!1661536580.jpg"></a></span>
   </div>
   <div class="cen_tan_bo">
      <div class="cen_tan_boa">
	    <span class="cen_tan_boal"><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T2.cGMXndbXXXXXXXX_!!1661536580.jpg"></span>
		<span class="cen_tan_boar" style="padding-top:25px;">�����Ƹ�����Ϣ�����һ�!</br>���ȷ��ǰ��������Ϣ</span>
	  </div>
	  <div class="cen_tan_bob"><a class="noinfo-box-close"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2l6jcXi8bXXXXXXXX_!!1661536580.jpg"></a></div>
   </div>
</div>

<!--950�ⵯ�������-->
<script src="/assets/javascripts/user.js"></script>
