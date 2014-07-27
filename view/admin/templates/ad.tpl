{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
<div class="grid_2">
<table class="report">
		<thead>
		<tr>
			<th colspan="4"><a href="/d/admin/banner?cat=100">首页轮播</a>&nbsp;&nbsp;<a href="/d/admin/banner?cat=98">兑换首页</a>&nbsp;&nbsp;<a href="/d/admin/banner?cat=96">中部</a>&nbsp;&nbsp;<a href="/d/admin/banner?cat=99">底部</a>
            		</th>
		</tr>
		<tr>
			<th>缩略图<br><i>Thumbnail</i></th>
			<th>备注<br><i>Remark</i></th>
			<th>到期日期<br><i>End Date</i></th>
			<th>操作<br><i>Operate</i></th>
		</tr>
		</thead>
		<tbody>
		{if $arts}
		{foreach from=$arts item=v)}
		<tr>
			<td><a href="{$v.link}" target="_blank"><img width="400" src="{$v.pic}" /></a></td>
			<td>{$v.remark}</td>
			<td>{$v.end_time}</td>
			<td>
			<a href="/d/admin/banner?cmd=mod&id={$v.id}" target="_blank">修改</a>
			<a href="/d/admin/banner?cmd=askDel&id={$v.id}" name="{$v.id}" class="ad_del" >删除</a>
			</td>
		</tr>
		{/foreach}
		{/if}
		<tr><td colspan="4" class="page">{$pageStr}</td></tr>
		</tbody>
	</table>
	</div>
	<div class="clear"></div>
</div>
</div>
<script src="/assets/javascripts/ad.js"></script>
