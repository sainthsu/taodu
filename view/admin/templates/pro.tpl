{include file="header.tpl"}
<div class="admin_layout">
	{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_2">
	<table class="report">
			<tr>
				<th colspan="8">
				<a href="/d/admin/pro?type=1">�齱��Ʒ</a>|<a href="/d/admin/pro?type=2">��ѡ����</a>|<a href="/d/admin/pro?type=3">�һ���Ʒ</a>|<a href="/d/admin/pro?type=4">������Ʒ</a>|<a href="/d/admin/pro?type=5">������Ʒ</a>|<a href="/d/admin/pro?check=0">������Ʒ</a>|<a href="/d/admin/pro?check=1">������Ʒ</a>
				<select name="cat">
				{foreach from=$cats item=v}
				<option value="{$v.id}">{$v.name}</option>
				{/foreach}
				</select>
				</th>
			</tr>
			<tr>
				<th><input type="checkbox" class="selall" /></th>
				<th width="50"><a href="/d/admin/pro?cmd=pro&order={if $request.order=='rank'}rank desc{else}rank{/if}&cat={$request.cat}">���� {if $request.order=='rank desc'}��{elseif $request.order=='rank'}��{/if}</a><br><i>Rank</i></th>
				<th>��Ʒ����<br><i>Pro Name</i></th>
				<th>����ͼ<br><i>thumb</i></th>
				<th>�۸�<br><i>Cost</i></th>
				<th>��Ŀ<br><i>Catagory</i></th>
				<th>״̬<br><i>State</i></th>
				<th>����<br><i>Operate</i></th>
			</tr>
		{foreach from=$pros item=v}
		<tr>
			<td><input type="checkbox" name="sel" class="pro_selected" value="{$v.id}" /></td>
			<td>{$v.rank}</td>
			<td><a href="http://item.taobao.com/item.htm?id={$v.iid}" target="_blank">{$v.title}</a></td>
			<td><img src="{$v.pic}" /></td>
			<td>ԭ:{$v.oprice}<br>��:{$v.nprice}</td>
			<td><a href="/d/admin/pro?{if $request.q}q={$request.q}&{/if}cat={$v.catid}{if $request.order}&order={$request.order}{/if}">{$v.name}</a><br>{if $v.type==1}�齱��Ʒ{elseif $v.type==2}��ѡ����{elseif $v.type==3}�һ���Ʒ{elseif $v.type==4}������Ʒ{elseif $v.type==5}������Ʒ{/if}<br>{if $v.rec_type==0}���Ƽ�{elseif $v.rec_type==1}�����Ƽ�{elseif $v.rec_type==2}�ػ���Ʒ{elseif $v.rec_type==3}����ϲ��{elseif $v.rec_type==4}��ҳͼ��{elseif $v.rec_type==5}��������{/if}</td>
			<td>{if $v.ischeck==0}����{elseif $v.ischeck==1}��ͨ��{elseif $v.ischeck==2}����{elseif $smarty.now|date_format:'%Y-%m-%d' > $v.et}�ѽ���{/if}</td>
			<td>
			<a href="/d/admin/pro?cmd=check&id={$v.id}">���</a>
			<a href="/d/admin/pro?cmd=mod&id={$v.id}" target="_blank">�޸�</a> 
			<a href="/d/admin/pro?cmd=askDel&id={$v.id}" name="{$v.id}" class="prodel" >ɾ��</a>
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


