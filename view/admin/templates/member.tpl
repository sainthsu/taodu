{include file="header.tpl"}
<div class="admin_layout">
	{include file="user_left.tpl"}
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
				<th width="50">ͷ��<br><i>avatar</i></th>
				<th>����<br><i>thumb</i></th>
				<th>QQ<br><i>Cost</i></th>
				<th>�ֻ�<br><i>Catagory</i></th>
				<th>��ַ<br><i>Pro Name</i></th>
				<th>����<br><i>State</i></th>
				<th>����<br><i>Operate</i></th>
			</tr>
		{foreach from=$users item=v}
		<tr>
			<td><input type="checkbox" name="sel" class="pro_selected" value="{$v.id}" /></td>
			<td><img class="user_avatar" src="/sd/getAvatar.do?encryptednick={$v.username}"</td>
			<td>{$v.truename|default:"δ����"}</td>
			<td>{$v.qq|default:"δ����"}</td>
			<td>{$v.phone|default:"δ����"}</td>
			<td>{$v.address|default:"δ����"}</td>
			<td>{$v.points}</td>
			<td>
			<a href="/d/admin/member?cmd=check&id={$v.id}">����</a>
			<a href="/d/admin/member?cmd=mod&id={$v.id}" target="_blank">�޸�</a> 
			<a href="/d/admin/member?cmd=askDel&id={$v.id}" class="prodel" >ɾ��</a>
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


