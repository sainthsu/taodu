{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_15">
	<table class="report">
		<tbody>
		<tr>
			<th>��Ŀ����<br/><i>Pro Cat Name</i></th>
			<th>����<br/><i>Rank</i></th>
			<th>״̬<br/><i>State</i></th>
			<th>����<br/><i>Operate</i></th>
		</tr>
		
		{foreach from=$cats item=v}
		<tr>
			<td>{$v.name}</td>
			<td>{$v.rank}</td>
			<td>{if !$v.is_show}����{else}��ʾ{/if}</td>
			<td>
			<a href="/d/admin/pro?cmd=cat&act=mod&id={$v.id}">�޸�</a>
			<a href="/d/admin/pro?cmd=cat&act=ask&id={$v.id}" name="{$v.id}">ɾ��</a>
			</td>
		</tr>
		{/foreach}
		</tbody>
	</table>
	</div>
	<div class="grid_8">
		<h3>��Ŀ {if $act=='mod'}�޸�{else}���{/if}</h3>
		<form method="post" name="catform">
		<ul class="edit">
			<li>��Ŀ����<input type="text" name="name" {if $catinfo.name}value="{$catinfo.name}"{/if}/> </li>
			<li>����<input type="text" name="rank" {if $catinfo.rank}value="{$catinfo.rank}"{/if} /></li>
            		<li>�Ƿ���ʾ<input type="checkbox" name="is_show" value="1" {if $catinfo.isshow}checked{/if} /></li>
			<li>{if $catinfo.id}<input type="hidden" name="id" value="{$catinfo.id}">{/if}<input type="submit" name="submit" value=" �� �� " class="subbtn" /></li>
		</ul>
		</form>
	</div>
</div>
</div>
<script src="/assets/javascripts/pro.js" ></script>
