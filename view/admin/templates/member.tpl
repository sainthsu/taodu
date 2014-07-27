{include file="header.tpl"}
<div class="admin_layout">
	{include file="user_left.tpl"}
	<div class="main_container">
	<div class="grid_2">
	<table class="report">
			<tr>
				<th colspan="8">
				<a href="/d/admin/pro?type=1">抽奖商品</a>|<a href="/d/admin/pro?type=2">精选特卖</a>|<a href="/d/admin/pro?type=3">兑换商品</a>|<a href="/d/admin/pro?type=4">店铺商品</a>|<a href="/d/admin/pro?type=5">搭配商品</a>|<a href="/d/admin/pro?check=0">待审商品</a>|<a href="/d/admin/pro?check=1">已审商品</a>
				<select name="cat">
				{foreach from=$cats item=v}
				<option value="{$v.id}">{$v.name}</option>
				{/foreach}
				</select>
				</th>
			</tr>
			<tr>
				<th><input type="checkbox" class="selall" /></th>
				<th width="50">头像<br><i>avatar</i></th>
				<th>真名<br><i>thumb</i></th>
				<th>QQ<br><i>Cost</i></th>
				<th>手机<br><i>Catagory</i></th>
				<th>地址<br><i>Pro Name</i></th>
				<th>积分<br><i>State</i></th>
				<th>操作<br><i>Operate</i></th>
			</tr>
		{foreach from=$users item=v}
		<tr>
			<td><input type="checkbox" name="sel" class="pro_selected" value="{$v.id}" /></td>
			<td><img class="user_avatar" src="/sd/getAvatar.do?encryptednick={$v.username}"</td>
			<td>{$v.truename|default:"未设置"}</td>
			<td>{$v.qq|default:"未设置"}</td>
			<td>{$v.phone|default:"未设置"}</td>
			<td>{$v.address|default:"未设置"}</td>
			<td>{$v.points}</td>
			<td>
			<a href="/d/admin/member?cmd=check&id={$v.id}">拉黑</a>
			<a href="/d/admin/member?cmd=mod&id={$v.id}" target="_blank">修改</a> 
			<a href="/d/admin/member?cmd=askDel&id={$v.id}" class="prodel" >删除</a>
			</td>
		</tr>
		{/foreach}
		
		<tr><td colspan="8" style="text-align:left">
			<select class="pro_caozuo">
				<option value="1">删除</option>
			</select>
			<input type="text" style="display:none; height:13px;" name="ts" id="ts" value="请输入续期天数..." />
			<input type="button" class="pro_act" value="提交" />
		</td></tr>
		<tr><td colspan="8" class="page">{$pageStr}</td></tr>
		</tbody>
	</table>
	</div>
	<div class="clear"></div> 
</div>
<script src="/assets/javascripts/pro.js" ></script>


