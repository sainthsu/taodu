{include file="header.tpl"}
<div class="admin_layout">
{include file="cooperation_left.tpl"}
	<div class="main_container">
	<table class="report">
		<tbody>
		<tr>
			<th>��Ŀ����<br/><i>Shop Cat Name</i></th>
			<th>����<br/><i>Rank</i></th>
			<th>״̬<br/><i>State</i></th>
			<th>����<br/><i>Operate</i></th>
		</tr>
		
		{foreach from=$cats item=v}
		<tr>
			<td>{$v.name}</td>
			<td>{$v.rank}</td>
			<td>{if $v.is_show==0}����{else}��ʾ{/if}</td>
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
			<li><input type="text" name="name" {if $catinfo.name}value="{$catinfo.name}"{/if}/> ��Ŀ����</li>
			<li><input type="text" name="rank" {if $catinfo.rank}value="{$catinfo.rank}"{/if} /> ����</li>
            		<li><input type="checkbox" name="is_show" value="1" {if $catinfo.is_show==1}checked{/if} /> ��ʾ
			<li><input type="submit" name="submit" value=" �� �� " class="subbtn" /></li>
		</ul>
		</form>
	</div>
	</div>
</div>
