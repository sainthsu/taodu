{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_8">
		<h3>����{if $act=='mod'}�޸�{else}���{/if}</h3>
		<form  method="post" name="catform">
		<table class="data">
		<tbody>
			<tr>
				<td class="left">��ƷIID��</td>
				<td>{$proinfo.iid}</td>
				<td class="left">��Ʒ���⣺</td>
				<td>{$proinfo.title}</td>
			<tr>
			<tr>
				<td class="left">���״̬��</td>
				<td>
				<select name="ischeck">
					<option value="0" {if $proinfo.ischeck==0} selected{/if}>�����</option>
					<option value="1" {if $proinfo.ischeck==1} selected{/if}>ͨ��</option>
					<option value="2" {if $proinfo.ischeck==2} selected{/if}>����</option>
					<option value="3" {if $proinfo.ischeck==3} selected{/if}>����</option>
					<option value="4" {if $proinfo.ischeck==4} selected{/if}>Υ��</option>
				</select>
				</td>
				<td colspan="2" class="left"></td>
			</tr>
			<tr>
				<td class="left">������ԣ�</td>
				<td colspan="3"><input type="text" name="fail_reason" class="t" value="{$proinfo.fail_reason|default:'����Ա������ʲôҲûд��'}" /></td>
			</tr>
			<tr>
				<td class="left">&nbsp;</td>
				<td colspan="3" class="grey"><input type="submit" name="submit" value=" �� �� " class="subbtn" /> <input type="reset" value=" �� �� " name="reset" class="ad_reset subbtn" /></td>
			</tr>
		</tbody>
	</table>
		</form>
	</div>
	</div>
</div>
