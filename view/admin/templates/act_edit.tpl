{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
<div class="grid_2">
	<form  method="post" name="codeform" enctype="multipart/form-data">
	<table class="data">
		<tbody>
			<tr>
				<td class="left">���⣺</td>
				<td><input type="text" name="title" class="t" value="{$actinfo.title|default:''}" /></td>
				<td class="left">��ע��</td>
				<td><input type="text" name="remark" value="{$adinfo.remark|default:''}" /> </td>
			</tr>
			<tr>
				<td class="left">ͼƬ��ַ��</td>
				<td><input type="text" name="pic" class="t" value="{$actinfo.pic|default:''}" /></td>
				<td class="left">������</td>
				<td><input type="checkbox" value="1" name="target"{if !$actinfo.target||$actinfo.target==1} checked{/if} /> �´��ڴ�
                </td>
			</tr>
			<tr>
				<td class="left">����ͼ��</td>
				<td><input type="text" name="thumb" class="t" value="{$actinfo.thumb|default:''}" /></td>
			</tr>
			<tr>
				<td class="left">��̽��ܣ�</td>
				<td colspan="3"><input type="text" name="intro" class="t" value="{$actinfo.intro|default:''}" /></td>
			</tr>
			<tr>
			<td class="left">���ҳ</td>
    			<td colspan="3" class="edit_area">
			<div class="kg_editorContainer"   data-config='{literal}{{/literal}"width" : "700px" , "height": "500px" {literal}{/literal}}'>
    			<textarea name='content' class="ks-editor-textarea" tabindex="0" style="width:700px;height: 400px;">            
    			{$content|default:''}
    			</textarea>
			</div>
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
</div></div>
<script src="/assets/javascripts/ad.js"></script>
