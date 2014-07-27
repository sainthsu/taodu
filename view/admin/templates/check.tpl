{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_8">
		<h3>店铺{if $act=='mod'}修改{else}添加{/if}</h3>
		<form  method="post" name="catform">
		<table class="data">
		<tbody>
			<tr>
				<td class="left">商品IID：</td>
				<td>{$proinfo.iid}</td>
				<td class="left">商品标题：</td>
				<td>{$proinfo.title}</td>
			<tr>
			<tr>
				<td class="left">审核状态：</td>
				<td>
				<select name="ischeck">
					<option value="0" {if $proinfo.ischeck==0} selected{/if}>审核中</option>
					<option value="1" {if $proinfo.ischeck==1} selected{/if}>通过</option>
					<option value="2" {if $proinfo.ischeck==2} selected{/if}>驳回</option>
					<option value="3" {if $proinfo.ischeck==3} selected{/if}>结束</option>
					<option value="4" {if $proinfo.ischeck==4} selected{/if}>违法</option>
				</select>
				</td>
				<td colspan="2" class="left"></td>
			</tr>
			<tr>
				<td class="left">审核留言：</td>
				<td colspan="3"><input type="text" name="fail_reason" class="t" value="{$proinfo.fail_reason|default:'管理员很懒，什么也没写！'}" /></td>
			</tr>
			<tr>
				<td class="left">&nbsp;</td>
				<td colspan="3" class="grey"><input type="submit" name="submit" value=" 提 交 " class="subbtn" /> <input type="reset" value=" 重 置 " name="reset" class="ad_reset subbtn" /></td>
			</tr>
		</tbody>
	</table>
		</form>
	</div>
	</div>
</div>
