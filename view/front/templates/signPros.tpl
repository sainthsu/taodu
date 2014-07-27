<div class="body">
  {include file="header.tpl"}

 <!--main开始-->
 <div class="centera">
    <div class="centera_to">
	  	 <ul>
			<li style="cursor:pointer;" data-id="4" class="tab yanse_a">商家报名</li>
		</ul>
	</div>
        <div class="loading_frame">
	<img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2JpVrXbpPXXXXXXXX_!!1661536580.gif"/>
	</div>
	<div class="centera_bo" style="display:block;">
    <!--第五块开始-->
	<div class="addus_03" style="display:none;">
	<div class="add_form">
			<h2 class="add_tip">
			温馨提示：以下每项必填
			</h2>
			<p>
			<label>淘宝商品ID</label>
				 <input type="text" value="" name="iid" class="text-input pro_id">
				 <input type="button" value="" name="get" class="button getProInfo">
				 <input type="button" value="" name="get" class="button proSearch"> 
				<div class="id_notice"><span class="blue">填写商品数字ID（不可重复添加同一淘宝商品ID）</span></div>
				<div class="id_example"></div>
			</p>
			<p>
			<label>报名栏目</label>
			<select name="type" class="pro_type">
			<option value="1">深海探宝</option>
			<option value="2">精选特卖</option>
			<option value="3">兑换商品</option>
            		</select>
			</p>
			<p>
			<label>商品分类</label>
			<select name="cat" class="pro_cat">
			{foreach from=$cats item=v}
			<option value="{$v.rank}">{$v.name}</option>
			{/foreach}
            		</select>
			</p>
			<p>
			<label>商品标题</label>
				<input type="text" value="" name="title" class="text-input pro_title"> 
				<span class="blue">标题不超过12字（不得出现促销类字词）</span>
			</p>
			<p class="clear"></p>
			<p>
			<label>图片地址</label>
			<input type="text" value="" name="pic" class="text-input pro_pic">
			<span class="blue clear">地址必须是淘宝地址</span>
			</p>
			<p class="align-left mr20">
			<label>数量</label>
				<input type="text" value="" name="num" class="text-input pro_num">
				<br>
			</p>
			<p class="align-left mr20">
			<label>原价</label>
				<input type="text" value="" name="oprice" class="text-input pro_oprice">
				<br>
			</p>
			<p class="align-left mr60">
			<label>促销价</label>
				<input type="text" value="" name="nprice" class="text-input pro_nprice">
				<br>
			</p>	
			<p class="clear"></p>
			<p>
			<label>商家旺旺</label>
				<input type="text" value="" name="shop" class="text-input pro_shop">
				<a href="http://bangpai.taobao.com/group/thread/15486845-281793298.htm" target="_blank">怎么添加logo</a>
			</p>
			<p>
			<label>&nbsp;</label>
				<input type="checkbox" value="" class="getlogo">
				<span class="blue" style="margin-left:0px;">店铺添加了本站logo</span>
			</p>
			<p>
			<label>申请说明</label>
			<textarea rows="6" cols="79" name="reason" class="text-input pro_reason"></textarea>
			</p>
		
			<p>
			<label>&nbsp;</label>
			<input type="submit" value="" name="submit" class="button pro_post">
			</p>
			</div>
</div>

	<div class="addus_04">
    <div class="sj_two">
       <span class="sj_twol"><a href="http://bangpai.taobao.com/group/thread/15486845-281791476.htm">报名宝贝要求</a><a href="http://bangpai.taobao.com/group/thread/15486845-281791476.htm">LOGO悬挂教程</a><a href="http://bangpai.taobao.com/group/thread/15486845-281791476.htm">报名指导图解</a></span>
	   <span class="sj_twor"><a class="clear-signs"><img src="http://img01.taobaocdn.com/imgextra/i1/1661536580/T2DFEHXa0XXXXXXXXX_!!1661536580.jpg"></a>&#12288;<a class="sign-back" href="/d/index?action=addus"><img src="http://img04.taobaocdn.com/imgextra/i4/1661536580/T2RPKfXmhcXXXXXXXX_!!1661536580.jpg" /></a></span>
	 </div>
	 <div class="cen_fou cen_fouaa">
		   <table width="100%" cellpadding="0" cellspacing="0">
			  <tr style="color:#666666;font-size:14px;font-weight:bold;">
				<td width="40%" align="left" valign="middle" bgcolor="#F7F7F7" style="border-top:1px dotted #E4E4E4;border-bottom:1px dotted #E4E4E4;" class="adsd"><p>商品</p></td>
				<td width="19%" align="left" valign="middle" bgcolor="#F7F7F7" style="border-top:1px dotted #E4E4E4;border-bottom:1px dotted #E4E4E4;">申请结果</td>
				<td width="19%" align="center" valign="middle" bgcolor="#F7F7F7" style="border-top:1px dotted #E4E4E4;border-bottom:1px dotted #E4E4E4;">展位信息</td>
				<td width="19%" align="center" valign="middle" bgcolor="#F7F7F7" style="border-top:1px dotted #E4E4E4;border-bottom:1px dotted #E4E4E4;">申请详情</td>
				<td width="3%" align="center" valign="middle" bgcolor="#F7F7F7" style="border-top:1px dotted #E4E4E4;border-bottom:1px dotted #E4E4E4;">&nbsp;</td>
			  </tr>
		
			  </table>
			<table width="100%" cellpadding="0" cellspacing="0" class="sign-table">
				{foreach from=$signPros item=p}
			  <tr>
				<td width="40%" align="left" valign="middle" bgcolor="#F7F7F7" class="putgd">
				  <span class="sh_le"><img  data-ks-lazyload="{$p.pic}" style="width:98px;height=98px;"></span>
				  <span class="sh_ri">
			      <p>{$p.title}</p>
					<p><i>￥{$p.nprice}</i></p>
					<p style="color:#CDCDCD;font-size:14px;text-decoration:line-through; ">￥{$p.oprice}</p>
				  </span>
				</td>
				<td width="19%" align="left" valign="middle" bgcolor="#F7F7F7" class="putgd duia">{$p.fail_reason|default:'管理员很懒，估计还没审核！'}
				</td>
				<td width="19%" align="center" valign="middle" bgcolor="#F7F7F7" class="putgd">{if $p.type==1}深海寻宝{elseif $p.type==2}精选特卖{else}兑换商品{/if}</td>
				<td width="19%" align="center" valign="middle" bgcolor="#F7F7F7" class="putgd" style="color:#666666">
				   <p>申请状态:{if $p.ischeck==1}成功{elseif $p.ischeck==0}<font style="color:#70C5EE">审核中</font>{elseif $p.ischeck==2}<font style="color:#FF4341">驳回</font>{/if}</p>
				   <p style="padding-top:6px;">{if $p.ischeck==1}<a class="sign-down" title="{$p.id}"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2Bb.HXd0XXXXXXXXX_!!1661536580.jpg"></a>{else}<a class="sign-mod" title="{$p.id}"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2c1v8XXFbXXXXXXXX_!!1661536580.jpg"></a>{/if}</p>
				</td>
				<td width="3%" align="left" valign="middle" bgcolor="#F7F7F7" class="putgd"><a class="sign-del" title="{$p.id}"><img src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2WpZHXepXXXXXXXXX_!!1661536580.jpg"></a></td>
			  </tr>
			{/foreach}
</table>
			<div class="faq_page">{$pageStr}</div>
		</div>

</div>


    <!--第五块结束-->
	</div>
	<a href="/d/index?action=signpros" class="refresh-click"></a>
	<div style="width:950px;overflow:hidden;background-color:#EBEBEB">
  	<div class="ad2"><a href="/d/index?action=special" target="_blank">没发现感兴趣的商品？去逛逛【精选特卖】查看更多优惠>></a></div>

 </div>
 </div>


 </div>
 <!--main结束-->

  {include file="footer.tpl"}

<!--950外弹出框结束-->
<script src="/assets/javascripts/signpros.js"></script>
