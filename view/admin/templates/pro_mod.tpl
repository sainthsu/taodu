{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
<div class="grid_2">
	<form  method="post" name="proform" class="pro_post">
	<table class="data">
		<tbody>
			<tr>
				<td class="left">����ID��</td>
				<td><input type="text" class="pro_id" name="proid" value="{$proinfo.iid}" /><input type="button" id="getProInfo" value="��ȡ" /></td>
				<td class="left">�����ǳƣ�</td>
				<td><input type="text" name="seller_nick" class="pro_seller_nick" value="{$proinfo.seller_nick}" /></td>
			</tr>
			<tr>
				<td class="left">��Ʒ���ƣ�</td>
				<td><input type="text" name="title" class="pro_title n" value="{$proinfo.title}" /></td>
				<td class="left">��������</td>
				<td><input type="text" class="pro_volume" name="volume" value="{$proinfo.volume}" /></td>
			</tr>
			<tr>
				<td class="left">����ͣ�</td>
				<td>
				  <select name="cat">
				    <?php
				{foreach from=$cats key=k item=v}
					<option value="{$v.rank}"{if $v.rank==$proinfo.cat} selected{/if}>{$v.name}</option>
				{/foreach}
				?>
		        	  </select>
				<select name="type">
					<option value="2" {if $proinfo.type==2} selected{/if}>��ѡ����</option>
					<option value="1" {if $proinfo.type==1} selected{/if}>�齱��Ʒ</option>
					<option value="3" {if $proinfo.type==3} selected{/if}>�һ���Ʒ</option>
					<option value="4" {if $proinfo.type==4} selected{/if}>������Ʒ</option>
					<option value="5" {if $proinfo.type==5} selected{/if}>������Ʒ</option>
					<option value="6" {if $proinfo.type==6} selected{/if}>��M��Ʒ</option>
					<option value="7" {if $proinfo.type==7} selected{/if}>������Ʒ</option>
					<option value="8" {if $proinfo.type==8} selected{/if}>��ɴ��Ʒ</option>
					<option value="9" {if $proinfo.type==9} selected{/if}>�Ҿ���Ʒ</option>
				</select>
				<select name="rec_type">
					<option value="0" {if $proinfo.rec_type==0} selected{/if}>���Ƽ�</option>
					<option value="1" {if $proinfo.rec_type==1} selected{/if}>�����Ƽ�</option>
					<option value="2" {if $proinfo.rec_type==2} selected{/if}>�ػ���Ʒ</option>
					<option value="3" {if $proinfo.rec_type==3} selected{/if}>����ϲ��</option>
					<option value="4" {if $proinfo.rec_type==4} selected{/if}>��ҳͼ��</option>
					<option value="5" {if $proinfo.rec_type==5} selected{/if}>��������</option>
				</select>
				<select name="shop_type">
					<option value="1" {if $proinfo.shop_type==1} selected{/if}>�Ա�</option>
					<option value="2" {if $proinfo.shop_type==2} selected{/if}>��è</option>
				</select>
				</td>
				<td class="left">�μӻ������</td>
				<td><input type="text" name="num" class="pro_num" value="{$proinfo.num}" /></td>
			</tr>
			<tr>
				<td class="left">��Ʒ���ӣ�</td>
				<td><input type="text" name="link" class="pro_link n" value="{$proinfo.link}" /> </td>
				<td class="left">����</td>
				<td><input type="text" name="rank"class="pro_rank" value="{if $proinfo.rank}{$proinfo.rank}{else}500{/if}" /> Ĭ��Ϊ500</td>
			</tr>
			<tr>
				<td class="left">ԭ�ۣ�</td>
				<td><input type="text" name="oprice" class="pro_oprice" value="{$proinfo.oprice}" /> Ԫ</td>
				<td class="left">��ǰ�ۣ�</td>
				<td><input type="text" name="nprice" class="pro_nprice" value="{$proinfo.nprice}" /> Ԫ</td>
			</tr>
			<tr>
				<td class="left">��ʼ���ڣ�</td>
				<td><input type="text" name="start_time"  class="Wdate pro_st" value="{if $proinfo.st}{$proinfo.st}{else}{$smarty.now|date_format:'%Y-%m-%d 00:00'}{/if}" /></td>
				<td class="left">�������ڣ�</td>
				<td><input type="text" name="end_time" class="Wdate pro_et" value="{if $proinfo.et}{$proinfo.et}{else}{$smarty.now|date_format:'%Y-%m-%d 00:00'}{/if}" /></td>
			</tr>
			<tr>
				<td class="left">��ƷͼƬ��</td>
			  <td><input type="text" name="pic" class="pro_pic n" value="{$proinfo.pic}" /></td>
				<td class="left">������</td>
              <td><input type="checkbox" class="pro_carriage" name="carriage" value="1" {if $proinfo.carriage==1} checked{/if} /> ����</td>
			</tr>
			<tr>
				<td class="left">��ע��</td>
			  <td><input type="text" name="remark" class="pro_remark n" value="{$proinfo.remark}" /></td>
				<td class="left">����ͼ��</td>
			  <td><input type="text" name="rec_pic" class="pro_pic n" value="{$proinfo.rpic|default:''}" /></td>
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
				<td><input type="text" name="points" class="pro_xujf" value="{$proinfo.points|default:''}" /></td>
			</tr>
		</tbody>
	</table>
	</form>
</div>
</div>
</div>
<script src="/assets/javascripts/pro_add.js" ></script>

