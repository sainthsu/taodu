{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
<div class="grid_2">
<table class="report">
		<tbody>
		<tr>
			<th>����ͼ<br><i>Thumbnail</i></th>
			<th>����<br><i>Title</i></th>
			<th>����<br><i>intro</i></th>
			<th>����<br><i>Operate</i></th>
		</tr>
		{if $acts}
		{foreach from=$acts item=v)}
		<tr>
			<td><a href="{$v.link}" target="_blank"><img width="400" src="{$v.thumb}" /></a></td>
			<td>{$v.title}</td>
			<td>{$v.intro}</td>
			<td>
			<a href="/d/admin/act?cmd=mod&id={$v.id}" target="_blank">�޸�</a>
			<a href="/d/admin/act?cmd=askDel&id={$v.id}" name="{$v.id}" class="ad_del" >ɾ��</a>
			</td>
		</tr>
		{/foreach}
		{/if}
		<tr><td colspan="4" class="page">{$pageStr}</td></tr>
		</tbody>
	</table>
	</div>
	<div class="clear"></div>
</div></div>
<script src="/assets/javascripts/ad.js"></script>
