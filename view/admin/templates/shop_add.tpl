{include file="header.tpl"}
<div class="admin_layout">
{include file="cooperation_left.tpl"}
	<div class="main_container">
	<div class="grid_8">
		<h3>店铺{if $act=='mod'}修改{else}添加{/if}</h3>
		<form  method="post" name="catform">
		<table class="data">
		<tbody>
			<tr>
				<td class="left">店铺标题：</td>
				<td><input type="text" name="title" value="{$shopinfo.title|default:''}" /></td>
				<td class="left">卖家昵称：</td>
				<td><input type="text" name="nick" value="{$shopinfo.nick|default:''}" /></td>
			</tr>
			<tr>
				<td class="left">店铺类型：</td>
				<td>
				  <select name="cat">
				{foreach from=$cats key=k item=v}
					<option value="{$v.rank}"{if $v.rank==$shopinfo.cat} selected{/if}>{$v.name}</option>
				{/foreach}
		        	</select>
				<select name="rec_type">
					<option value="0" {if $shopinfo.rec_type==0} selected{/if}>无推荐</option>
					<option value="1" {if $shopinfo.rec_type==1} selected{/if}>首页一</option>
					<option value="2" {if $shopinfo.rec_type==2} selected{/if}>首页右</option>
					<option value="3" {if $shopinfo.rec_type==3} selected{/if}>内页</option>
					<option value="4" {if $shopinfo.rec_type==4} selected{/if}>店铺页</option>
				</select>
				<select name="shop_type">
					<option value="1" {if $shopinfo.shop_type==1} selected{/if}>淘宝</option>
					<option value="2" {if $shopinfo.shop_type==2} selected{/if}>天猫</option>
				</select>
				</td>
				<td class="left">折扣：</td>
				<td><input type="text" name="discount" class="shop_discount" value="{$shopinfo.discount|default:''}" /></td>
			</tr>
			<tr>
				<td class="left">图片地址：</td>
				<td><input type="text" name="thumb" value="{$shopinfo.thumb|default:''}" /></td>
				<td class="left">小标题：</td>
				<td><input type="text" name="tip" value="{$shopinfo.tip|default:''}" /></td>
			</tr>
			<tr>
				<td class="left">店铺链接：</td>
				<td><input type="text" name="link" value="{$shopinfo.link|default:''}" /> </td>
				<td class="left">缩略图：</td>
				<td><input type="text" name="thumb" value="{$shopinfo.thumb|default:''}" /></td>
			</tr>
			<tr>
				<td class="left">简短介绍：</td>
				<td colspan="3"><textarea name="intro" style="width:149px;height:150px;">{if $shopinfo.intro}{$shopinfo.intro}{/if}</textarea></td>
			</tr>
			<tr>
				<td class="left">&nbsp;</td>
				<td colspan="3" class="grey"><input type="submit" name="submit" value="提交" class="subbtn" /> <input type="reset" value=" 重 置 " name="reset" class="ad_reset subbtn" /></td>
			</tr>
		</form>
	</div>
	</div>
</div>
