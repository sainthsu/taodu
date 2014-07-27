{include file="header.tpl"}
<div class="admin_layout">
	{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_2">
	<table class="report">
			<tr>
				<form  method="post">
				<td colspan=3>开始时间：<br><input name="startTime" type="text" style="width:100px;" value="{$smarty.now|date_format:'%Y-%m-%d 00:00'}"/></td>
				<td colspan=3>参加数量：<br><input name="num" type="text" style="width:100px;" /></td>
				<td><input type="submit" name="import" value="一键录入" class="submit-btn"></td>
				</form>
			</tr>
			<tr>
				<th><input type="checkbox" class="selall" /></th>
				<th>商品名称<br><i>Pro Name</i></th>
				<th>缩略图<br><i>thumb</i></th>
				<th>价格<br><i>Cost</i></th>
				<th>促销<br><i>Catagory</i></th>
				<th>佣金<br><i>State</i></th>
				<th>操作<br><i>Operate</i></th>
			</tr>
		{foreach from=$pros item=v}
		<tr>
			<td><input type="checkbox" name="sel" class="pro_selected" value="{$v.id}" /></td>
			<td><a href="http://item.taobao.com/item.htm?id={$v.num_iid}" target="_blank">{$v.title}</a></td>
			<td><img src="{$v.pic_url}" /></td>
			<td>原:{$v.price}<br>现:{$v.nprice}</td>
			<td>开始：{$v.start_time}<br>
			    结束：{$v.end_time}
			</td>
			<td>30天售出：{$v.volume}
			</td>
			<td>
			<a href="/d/admin/pro?cmd=collect&del=1&id={$v.id}" name="{$v.id}" class="prodel" >删除</a>
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


