{include file="header.tpl"}
<div class="admin_layout">
	{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_2">
	<table class="report">
			<tr>
				<th><input type="checkbox" class="selall"/></th>
				<th width="50"><a href="/d/admin/pro?cmd=pro&order={if $request.order=='rank'}rank desc{else}rank{/if}&cat={$request.cat}">���� {if $request.order=='rank desc'}��{elseif $request.order=='rank'}��{/if}</a><br><i>Rank</i></th>
				<th>����<br><i>Title</i></th>
				<th>����ͼ<br><i>thumb</i></th>
				<th>��Ʒ<br><i>Products</i></th>
				<th>����<br><i>Intro</i></th>
				<th>����<br><i>Operate</i></th>
			</tr>
		{foreach from=$groups item=v}
		<tr>
			<td><input type="checkbox" name="sel" class="pro_selected" value="{$v.id}" /></td>
			<td>{$v.rank}</td>
			<td><a href="/d/index?action=group&gid={$v.id}" target="_blank">{$v.title}</a></td>
			<td><img src="{$v.pic}" /></td>
			<td>{foreach from=$v.pros item=p}<a href="http://item.taobao.com/item.htm?id={$v.iid}" target="_blank">{$p.title}</a><a href="/d/admin/pro?cmd=mod&id={$p.id}">�޸�</a><br>{/foreach}</td>
			<td>{$v.intro}</td>
			<td>
			<a href="/d/admin/group?cmd=mod&id={$v.id}" target="_blank">�޸�</a> 
			<a href="/d/admin/group?cmd=askDel&id={$v.id}" name="{$v.id}" class="prodel" >ɾ��</a>
			</td>
		</tr>
		{/foreach}
		
		<tr><td colspan="8" style="text-align:left">
			<select class="pro_caozuo">
				<option value="1">ɾ��</option>
			</select>
			<input type="text" style="display:none; height:13px;" name="ts" id="ts" value="��������������..." />
			<input type="button" class="pro_act" value="�ύ" />
		</td></tr>
		<tr><td colspan="8" class="page">{$pageStr}</td></tr>
		</tbody>
	</table>
	</div>
	<div class="clear"></div> 
</div>
<script src="/assets/javascripts/pro.js" ></script>


