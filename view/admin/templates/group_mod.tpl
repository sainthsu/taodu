{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
<div class="grid_2">
	<form  method="post" name="proform" class="pro_post" enctype="multipart/form-data" >
	<table class="data">
		<tbody>
			<tr>
				<td class="left">���⣺</td>
				<td><input type="text" name="title" class="group_title" value="{$groupinfo.title}" /></td>
				<td class="left">�Ƽ����ͣ�</td>
				<td><select name="rec_type">
					<option value="0" {if $groupinfo.rec_type==0} selected{/if}>���Ƽ�</option>
					<option value="1" {if $groupinfo.rec_type==1} selected{/if}>��ҳһ</option>
				</select>
				</td>
			</tr>
			<tr>
			  <td class="left">ͼƬ��</td>
			  <td><input type="text" name="pic" class="group_pic" value="{$groupinfo.pic}" /></td>
			</tr>
			<tr>
				<td class="left">��Ʒ���У�</td>
				<td><input type="text" name="pro_list" value="{$groupinfo.pro_list}"></td>
				<td colspan="2">������Ʒ��iid��;��Ӣ�ķֺţ��ָ�</td>
			</tr>
			<tr>
				<td class="left">�������</td>
				<td colspan="3"><input type="text" name="intro" value="{$groupinfo.intro}" style="width:98%;"></td>
			</tr>
			<tr>
				<td class="left">&nbsp;</td>
				<td class="grey"><input type="submit" name="submit" value=" �� �� " class="subbtn" /> <input type="reset" value=" �� �� " name="reset" class="pro_reset subbtn" /></td>
			</tr>
		</tbody>
	</table>
	</form>
</div>
</div>
</div>
<script src="/assets/javascripts/group_add.js" ></script>


