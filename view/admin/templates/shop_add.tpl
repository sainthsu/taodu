{include file="header.tpl"}
<div class="admin_layout">
{include file="cooperation_left.tpl"}
	<div class="main_container">
	<div class="grid_8">
		<h3>����{if $act=='mod'}�޸�{else}���{/if}</h3>
		<form  method="post" name="catform">
		<table class="data">
		<tbody>
			<tr>
				<td class="left">���̱��⣺</td>
				<td><input type="text" name="title" value="{$shopinfo.title|default:''}" /></td>
				<td class="left">�����ǳƣ�</td>
				<td><input type="text" name="nick" value="{$shopinfo.nick|default:''}" /></td>
			</tr>
			<tr>
				<td class="left">�������ͣ�</td>
				<td>
				  <select name="cat">
				{foreach from=$cats key=k item=v}
					<option value="{$v.rank}"{if $v.rank==$shopinfo.cat} selected{/if}>{$v.name}</option>
				{/foreach}
		        	</select>
				<select name="rec_type">
					<option value="0" {if $shopinfo.rec_type==0} selected{/if}>���Ƽ�</option>
					<option value="1" {if $shopinfo.rec_type==1} selected{/if}>��ҳһ</option>
					<option value="2" {if $shopinfo.rec_type==2} selected{/if}>��ҳ��</option>
					<option value="3" {if $shopinfo.rec_type==3} selected{/if}>��ҳ</option>
					<option value="4" {if $shopinfo.rec_type==4} selected{/if}>����ҳ</option>
				</select>
				<select name="shop_type">
					<option value="1" {if $shopinfo.shop_type==1} selected{/if}>�Ա�</option>
					<option value="2" {if $shopinfo.shop_type==2} selected{/if}>��è</option>
				</select>
				</td>
				<td class="left">�ۿۣ�</td>
				<td><input type="text" name="discount" class="shop_discount" value="{$shopinfo.discount|default:''}" /></td>
			</tr>
			<tr>
				<td class="left">ͼƬ��ַ��</td>
				<td><input type="text" name="thumb" value="{$shopinfo.thumb|default:''}" /></td>
				<td class="left">С���⣺</td>
				<td><input type="text" name="tip" value="{$shopinfo.tip|default:''}" /></td>
			</tr>
			<tr>
				<td class="left">�������ӣ�</td>
				<td><input type="text" name="link" value="{$shopinfo.link|default:''}" /> </td>
				<td class="left">����ͼ��</td>
				<td><input type="text" name="thumb" value="{$shopinfo.thumb|default:''}" /></td>
			</tr>
			<tr>
				<td class="left">��̽��ܣ�</td>
				<td colspan="3"><textarea name="intro" style="width:149px;height:150px;">{if $shopinfo.intro}{$shopinfo.intro}{/if}</textarea></td>
			</tr>
			<tr>
				<td class="left">&nbsp;</td>
				<td colspan="3" class="grey"><input type="submit" name="submit" value="�ύ" class="subbtn" /> <input type="reset" value=" �� �� " name="reset" class="ad_reset subbtn" /></td>
			</tr>
		</form>
	</div>
	</div>
</div>
