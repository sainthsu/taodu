{include file="header.tpl"}
<div class="admin_layout">
	{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_2">
	<table class="report">
			<tr>
				<form  method="post">
				<td colspan=3>��ʼʱ�䣺<br><input name="startTime" type="text" style="width:100px;" value="{$smarty.now|date_format:'%Y-%m-%d 00:00'}"/></td>
				<td colspan=3>�μ�������<br><input name="num" type="text" style="width:100px;" /></td>
				<td><input type="submit" name="import" value="һ��¼��" class="submit-btn"></td>
				</form>
			</tr>
			<tr>
				<th><input type="checkbox" class="selall" /></th>
				<th>��Ʒ����<br><i>Pro Name</i></th>
				<th>����ͼ<br><i>thumb</i></th>
				<th>�۸�<br><i>Cost</i></th>
				<th>����<br><i>Catagory</i></th>
				<th>Ӷ��<br><i>State</i></th>
				<th>����<br><i>Operate</i></th>
			</tr>
		{foreach from=$pros item=v}
		<tr>
			<td><input type="checkbox" name="sel" class="pro_selected" value="{$v.id}" /></td>
			<td><a href="http://item.taobao.com/item.htm?id={$v.num_iid}" target="_blank">{$v.title}</a></td>
			<td><img src="{$v.pic_url}" /></td>
			<td>ԭ:{$v.price}<br>��:{$v.nprice}</td>
			<td>��ʼ��{$v.start_time}<br>
			    ������{$v.end_time}
			</td>
			<td>30���۳���{$v.volume}
			</td>
			<td>
			<a href="/d/admin/pro?cmd=collect&del=1&id={$v.id}" name="{$v.id}" class="prodel" >ɾ��</a>
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


