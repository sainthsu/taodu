{include file="header.tpl"}
<div class="admin_layout">
{include file="cooperation_left.tpl"}
	<div class="main_container">
<div class="grid_15">
	<table class="report">
		<tbody>
		<tr>
			<th>����ͼƬ<br><i>Pro Cat Name</i></th>
			<th>���̱���<br><i>Rank</i></th>
			<th>����ID���ǳƣ�<br><i>Rank</i></th>
			<th>����<br>Cat</th>
			<th>����<br><i>Operate</i></th>
		</tr>
		{if $shops}
		{foreach from=$shops item=v}
		<tr>
			<td><a href="{$v.link}" target="_blank"><img src="{$v.thumb}" height="50" /></a></td>
			<td>{$v.title}</td>
			<td>{$v.nick}</td>
			<td>{$v.name}<br>{if $v.rec_type==0}���Ƽ�{elseif $v.rec_type==1}��ҳһ{elseif $v.rec_type==2}��ҳ��{/if}</td>
			<td>
			<a href="/d/admin/shop?cmd=mod&id={$v.id}">�޸�</a>
			<a href="/d/admin/shop?cmd=askDel&id={$v.id}">ɾ��</a>
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
