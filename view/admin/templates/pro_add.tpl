{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_2">
	<form  method="post" name="proform" class="pro_post" enctype="multipart/form-data" >
	<table class="data">
		<tbody>
			<tr>
				<td class="left">����ID��</td>
				<td><input type="text" class="pro_id" name="proid" value="" /><input type="button" class="getProInfo" value="��ȡ" /></td>
				<td class="left">�����ǳƣ�</td>
				<td><input type="text" name="seller_nick" class="pro_seller_nick" value="" /></td>
			</tr>
			<tr>
				<td class="left">��Ʒ���ƣ�</td>
				<td><input type="text" name="title" class="pro_title n" value="" /></td>
				<td class="left">��������</td>
				<td><input type="text" class="pro_volume" name="volume"/></td>
			</tr>
			<tr>
				<td class="left">��Ʒ���ͣ�</td>
				<td>
				  <select name="cat">
				{foreach from=$cats key=k item=v}
					<option value="{$v.rank}"{if $v.rank==$proinfo.cat} selected{/if}>{$v.name}</option>
				{/foreach}
		        	</select>
				<select name="type">
					<option value="2" >��ѡ����</option>
					<option value="1" >�齱��Ʒ</option>
					<option value="3" >�һ���Ʒ</option>
					<option value="4" >������Ʒ</option>
					<option value="5" >������Ʒ</option>
					<option value="6" >��M��Ʒ</option>
					<option value="7" >������Ʒ</option>
					<option value="8" >��ɴ��Ʒ</option>
					<option value="9" >�Ҿ���Ʒ</option>
				</select>
				<select name="rec_type">
					<option value="0" >���Ƽ�</option>
					<option value="1" >�����Ƽ�</option>
					<option value="2" >�ػ���Ʒ</option>
					<option value="3" >����ϲ��</option>
					<option value="4" >��ҳͼ��</option>
					<option value="5" >��������</option>
				</select>
				<select name="shop_type">
					<option value="1" >�Ա�</option>
					<option value="2" >��è</option>
				</select>
				</td>
				<td class="left">�μӻ������</td>
				<td><input type="text" name="num" class="pro_num" value="" /></td>
			</tr>
			<tr>
				<td class="left">��Ʒ���ӣ�</td>
				<td><input type="text" name="link" class="pro_link n" value="" /> </td>
				<td class="left">����</td>
				<td><input type="text" class="pro_rank" name="rank" value="500" /> Ĭ��Ϊ500</td>
			</tr>
			<tr>
				<td class="left">ԭ�ۣ�</td>
				<td><input type="text" name="oprice" class="pro_oprice" value="" /> Ԫ</td>
				<td class="left">��ǰ�ۣ�</td>
				<td><input type="text" name="nprice" class="pro_nprice" value="" /> Ԫ</td>
			</tr>
			<tr>
				<td class="left">��ʼ���ڣ�</td>
				<td><input type="text" name="start_time" class="Wdate pro_st" value="{if $proinfo.start_time}{$proinfo.st}{else}{$smarty.now|date_format:'%Y-%m-%d 00:00'}{/if}" /></td>
				<td class="left">�������ڣ�</td>
				<td><input type="text" name="end_time" class="Wdate pro_et" value="{if $proinfo.end_time}{$proinfo.et}{else}{$smarty.now|date_format:'%Y-%m-%d 00:00'}{/if}" /></td>
			</tr>
			<tr>
				<td class="left">��ƷͼƬ��</td>
			  <td><input type="text" name="pic" class="pro_pic n" value="" /></td>
			<td class="left">������</td>
              		<td><input type="checkbox" class="pro_carriage" name="carriage" value="1" {if $proinfo.carriage} checked{/if} /> ����</td>
			</tr>
			<tr>
				<td class="left">��ע��</td>
			  <td><input type="text" name="remark" class="pro_remark n" value="" /></td>
				<td class="left">�Ƽ�ͼ��</td>
			  <td><input type="text" name="rec_pic" class="pro_pic n" value="{$proinfo.rec_pic|default:''}" /></td>
				
			</tr>
			<tr class="shiyong"{if $proinfo.type==99}style="display:table-row"{/if}>
				<td class="left">��Ʒ������</td>
				<td colspan="3">
                </td>
			</tr>
			<tr>
				<td class="left">&nbsp;</td>
				<td class="grey"><input type="submit" name="submit" value=" �� �� " class="subbtn" /> <input type="reset" value=" �� �� " name="reset" class="pro_reset subbtn" /></td>
				<td class="left">������֣�</td>
				<td><input type="text" name="points" class="pro_xujf" value="" /></td>
			</tr>
		</tbody>
	</table>
	</form>
	</div>
</div>
<script src="/assets/javascripts/pro_add.js" ></script>


