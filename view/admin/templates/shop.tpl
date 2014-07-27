{include file="header.tpl"}
<div class="admin_layout">
{include file="cooperation_left.tpl"}
	<div class="main_container">
<div class="grid_15">
	<table class="report">
		<tbody>
		<tr>
			<th>店铺图片<br><i>Pro Cat Name</i></th>
			<th>店铺标题<br><i>Rank</i></th>
			<th>卖家ID（昵称）<br><i>Rank</i></th>
			<th>类型<br>Cat</th>
			<th>操作<br><i>Operate</i></th>
		</tr>
		{if $shops}
		{foreach from=$shops item=v}
		<tr>
			<td><a href="{$v.link}" target="_blank"><img src="{$v.thumb}" height="50" /></a></td>
			<td>{$v.title}</td>
			<td>{$v.nick}</td>
			<td>{$v.name}<br>{if $v.rec_type==0}无推荐{elseif $v.rec_type==1}首页一{elseif $v.rec_type==2}首页右{/if}</td>
			<td>
			<a href="/d/admin/shop?cmd=mod&id={$v.id}">修改</a>
			<a href="/d/admin/shop?cmd=askDel&id={$v.id}">删除</a>
			</td>
		</tr>
		{/foreach}
		{/if}
		<tr><td colspan="5" class="page">{$pageStr}</td></tr>
		</tbody>
	</table>
	</div>
</div>
</div>
