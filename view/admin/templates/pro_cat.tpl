{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_15">
	<table class="report">
		<tbody>
		<tr>
			<th>类目名称<br/><i>Pro Cat Name</i></th>
			<th>排序<br/><i>Rank</i></th>
			<th>状态<br/><i>State</i></th>
			<th>操作<br/><i>Operate</i></th>
		</tr>
		
		{foreach from=$cats item=v}
		<tr>
			<td>{$v.name}</td>
			<td>{$v.rank}</td>
			<td>{if !$v.is_show}隐藏{else}显示{/if}</td>
			<td>
			<a href="/d/admin/pro?cmd=cat&act=mod&id={$v.id}">修改</a>
			<a href="/d/admin/pro?cmd=cat&act=ask&id={$v.id}" name="{$v.id}">删除</a>
			</td>
		</tr>
		{/foreach}
		</tbody>
	</table>
	</div>
	<div class="grid_8">
		<h3>类目 {if $act=='mod'}修改{else}添加{/if}</h3>
		<form method="post" name="catform">
		<ul class="edit">
			<li>类目名称<input type="text" name="name" {if $catinfo.name}value="{$catinfo.name}"{/if}/> </li>
			<li>排序<input type="text" name="rank" {if $catinfo.rank}value="{$catinfo.rank}"{/if} /></li>
            		<li>是否显示<input type="checkbox" name="is_show" value="1" {if $catinfo.isshow}checked{/if} /></li>
			<li>{if $catinfo.id}<input type="hidden" name="id" value="{$catinfo.id}">{/if}<input type="submit" name="submit" value=" 提 交 " class="subbtn" /></li>
		</ul>
		</form>
	</div>
</div>
</div>
<script src="/assets/javascripts/pro.js" ></script>
