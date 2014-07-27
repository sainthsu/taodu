{include file="header.tpl"}
<div class="admin_layout">
	{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_2">
	<table class="report">
			<tr>
				<th><input type="checkbox" class="selall"/></th>
				<th width="50"><a href="/d/admin/pro?cmd=pro&order={if $request.order=='rank'}rank desc{else}rank{/if}&cat={$request.cat}">排序 {if $request.order=='rank desc'}↑{elseif $request.order=='rank'}↓{/if}</a><br><i>Rank</i></th>
				<th>标题<br><i>Title</i></th>
				<th>缩略图<br><i>thumb</i></th>
				<th>商品<br><i>Products</i></th>
				<th>介绍<br><i>Intro</i></th>
				<th>操作<br><i>Operate</i></th>
			</tr>
		{foreach from=$groups item=v}
		<tr>
			<td><input type="checkbox" name="sel" class="pro_selected" value="{$v.id}" /></td>
			<td>{$v.rank}</td>
			<td><a href="/d/index?action=group&gid={$v.id}" target="_blank">{$v.title}</a></td>
			<td><img src="{$v.pic}" /></td>
			<td>{foreach from=$v.pros item=p}<a href="http://item.taobao.com/item.htm?id={$v.iid}" target="_blank">{$p.title}</a><a href="/d/admin/pro?cmd=mod&id={$p.id}">修改</a><br>{/foreach}</td>
			<td>{$v.intro}</td>
			<td>
			<a href="/d/admin/group?cmd=mod&id={$v.id}" target="_blank">修改</a> 
			<a href="/d/admin/group?cmd=askDel&id={$v.id}" name="{$v.id}" class="prodel" >删除</a>
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


