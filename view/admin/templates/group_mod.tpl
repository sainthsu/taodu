{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
<div class="grid_2">
	<form  method="post" name="proform" class="pro_post" enctype="multipart/form-data" >
	<table class="data">
		<tbody>
			<tr>
				<td class="left">标题：</td>
				<td><input type="text" name="title" class="group_title" value="{$groupinfo.title}" /></td>
				<td class="left">推荐类型：</td>
				<td><select name="rec_type">
					<option value="0" {if $groupinfo.rec_type==0} selected{/if}>无推荐</option>
					<option value="1" {if $groupinfo.rec_type==1} selected{/if}>首页一</option>
				</select>
				</td>
			</tr>
			<tr>
			  <td class="left">图片：</td>
			  <td><input type="text" name="pic" class="group_pic" value="{$groupinfo.pic}" /></td>
			</tr>
			<tr>
				<td class="left">商品队列：</td>
				<td><input type="text" name="pro_list" value="{$groupinfo.pro_list}"></td>
				<td colspan="2">各个商品的iid以;（英文分号）分隔</td>
			</tr>
			<tr>
				<td class="left">搭配介绍</td>
				<td colspan="3"><input type="text" name="intro" value="{$groupinfo.intro}" style="width:98%;"></td>
			</tr>
			<tr>
				<td class="left">&nbsp;</td>
				<td class="grey"><input type="submit" name="submit" value=" 提 交 " class="subbtn" /> <input type="reset" value=" 重 置 " name="reset" class="pro_reset subbtn" /></td>
			</tr>
		</tbody>
	</table>
	</form>
</div>
</div>
</div>
<script src="/assets/javascripts/group_add.js" ></script>


