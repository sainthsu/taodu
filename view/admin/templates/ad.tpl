{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
<div class="grid_2">
<table class="report">
		<thead>
		<tr>
			<th colspan="4"><a href="/d/admin/banner?cat=100">��ҳ�ֲ�</a>&nbsp;&nbsp;<a href="/d/admin/banner?cat=98">�һ���ҳ</a>&nbsp;&nbsp;<a href="/d/admin/banner?cat=96">�в�</a>&nbsp;&nbsp;<a href="/d/admin/banner?cat=99">�ײ�</a>
            		</th>
		</tr>
		<tr>
			<th>����ͼ<br><i>Thumbnail</i></th>
			<th>��ע<br><i>Remark</i></th>
			<th>��������<br><i>End Date</i></th>
			<th>����<br><i>Operate</i></th>
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
			<a href="/d/admin/banner?cmd=mod&id={$v.id}" target="_blank">�޸�</a>
			<a href="/d/admin/banner?cmd=askDel&id={$v.id}" name="{$v.id}" class="ad_del" >ɾ��</a>
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
