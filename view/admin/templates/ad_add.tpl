{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
<div class="grid_2">
	<form  method="post" name="codeform" enctype="multipart/form-data">
	<table class="data">
		<tbody>
			<tr>
				<td class="left">ͼƬ��ַ��</td>
				<td><input type="text" name="src" class="t" value="" /></td>
				<td class="left">������</td>
				<td><input type="checkbox" value="1" name="target"{if !$adinfo.target||$adinfo.target==1} checked{/if} /> �´��ڴ�
                </td>
			</tr>
			<tr>
				<td class="left">���ӵ�ַ��</td>
				<td><input type="text" name="link" class="t" value="" /></td>
				<td class="left">����</td>
				<td><input type="text" name="rank" value="{if $adinfo.rank}{$adinfo.rank}{else}10{/if}" /></td>
			</tr>
			<tr>
				<td class="left">��ʼ���ڣ�</td>
				<td><input class="kg_datePicker ad_st" data-config='{"isHoliday": false,
                           "minDate" :"2013-08-09","finalTriggerNode" : "kg_datePicker_final", "finalTriggerMinDate" : "2013-08-10"}' type="text" name="start_time" value=""/></td>
				<td class="left">�������ڣ�</td>
				<td><input class="kg_datePicker ad_et" data-config='{"isHoliday": false,
                           "minDate" :"2013-08-09","finalTriggerNode" : "kg_datePicker_final", "finalTriggerMinDate" : "2013-08-10"}' type="text" name="end_time" value=""/></td>
			</tr>
			<tr>
				<td class="left">���⣺</td>
				<td><input type="text" name="title" class="t" value="" /></td>
				<td class="left">��ע��</td>
				<td><input type="text" name="remark" value="" /> </td>
			</tr>
			<tr>
				<td class="left">��Ŀ��</td>
				<td colspan="3">
				<select name="cat">
                    <option value="100">��ҳ�ֲ�</option>
                    <option value="98"{if $adinfo.cat==98} selected{/if}>�һ���ҳ</option>
                    <option value="97"{if $adinfo.cat==97} selected{/if}>�һ�����ҳ�ֲ�</option>
		    <option value="96"{if $adinfo.cat==96} selected{/if}>�в�</option>
                    <option value="99"{if $adinfo.cat==99} selected{/if}>�ײ�</option>
				</select>
				</td>
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
<script src="/assets/javascripts/ad.js"></script>
