{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_2">
	<form  method="post" name="proform" class="pro_post" enctype="multipart/form-data" >
	<table class="data">
		<tbody>
			<tr>
				<td class="left">宝贝ID：</td>
				<td><input type="text" class="pro_id" name="proid" value="" /><input type="button" class="getProInfo" value="获取" /></td>
				<td class="left">卖家昵称：</td>
				<td><input type="text" name="seller_nick" class="pro_seller_nick" value="" /></td>
			</tr>
			<tr>
				<td class="left">商品名称：</td>
				<td><input type="text" name="title" class="pro_title n" value="" /></td>
				<td class="left">月销量：</td>
				<td><input type="text" class="pro_volume" name="volume"/></td>
			</tr>
			<tr>
				<td class="left">商品类型：</td>
				<td>
				  <select name="cat">
				{foreach from=$cats key=k item=v}
					<option value="{$v.rank}"{if $v.rank==$proinfo.cat} selected{/if}>{$v.name}</option>
				{/foreach}
		        	</select>
				<select name="type">
					<option value="2" >精选特卖</option>
					<option value="1" >抽奖商品</option>
					<option value="3" >兑换商品</option>
					<option value="4" >店铺商品</option>
					<option value="5" >搭配商品</option>
					<option value="6" >胖M商品</option>
					<option value="7" >妈妈商品</option>
					<option value="8" >婚纱商品</option>
					<option value="9" >家居商品</option>
				</select>
				<select name="rec_type">
					<option value="0" >无推荐</option>
					<option value="1" >爆款推荐</option>
					<option value="2" >特惠商品</option>
					<option value="3" >猜你喜欢</option>
					<option value="4" >首页图推</option>
					<option value="5" >大类列推</option>
				</select>
				<select name="shop_type">
					<option value="1" >淘宝</option>
					<option value="2" >天猫</option>
				</select>
				</td>
				<td class="left">参加活动数量：</td>
				<td><input type="text" name="num" class="pro_num" value="" /></td>
			</tr>
			<tr>
				<td class="left">商品链接：</td>
				<td><input type="text" name="link" class="pro_link n" value="" /> </td>
				<td class="left">排序：</td>
				<td><input type="text" class="pro_rank" name="rank" value="500" /> 默认为500</td>
			</tr>
			<tr>
				<td class="left">原价：</td>
				<td><input type="text" name="oprice" class="pro_oprice" value="" /> 元</td>
				<td class="left">当前价：</td>
				<td><input type="text" name="nprice" class="pro_nprice" value="" /> 元</td>
			</tr>
			<tr>
				<td class="left">开始日期：</td>
				<td><input type="text" name="start_time" class="Wdate pro_st" value="{if $proinfo.start_time}{$proinfo.st}{else}{$smarty.now|date_format:'%Y-%m-%d 00:00'}{/if}" /></td>
				<td class="left">结束日期：</td>
				<td><input type="text" name="end_time" class="Wdate pro_et" value="{if $proinfo.end_time}{$proinfo.et}{else}{$smarty.now|date_format:'%Y-%m-%d 00:00'}{/if}" /></td>
			</tr>
			<tr>
				<td class="left">商品图片：</td>
			  <td><input type="text" name="pic" class="pro_pic n" value="" /></td>
			<td class="left">其他：</td>
              		<td><input type="checkbox" class="pro_carriage" name="carriage" value="1" {if $proinfo.carriage} checked{/if} /> 包邮</td>
			</tr>
			<tr>
				<td class="left">备注：</td>
			  <td><input type="text" name="remark" class="pro_remark n" value="" /></td>
				<td class="left">推荐图：</td>
			  <td><input type="text" name="rec_pic" class="pro_pic n" value="{$proinfo.rec_pic|default:''}" /></td>
				
			</tr>
			<tr class="shiyong"{if $proinfo.type==99}style="display:table-row"{/if}>
				<td class="left">商品描述：</td>
				<td colspan="3">
                </td>
			</tr>
			<tr>
				<td class="left">&nbsp;</td>
				<td class="grey"><input type="submit" name="submit" value=" 提 交 " class="subbtn" /> <input type="reset" value=" 重 置 " name="reset" class="pro_reset subbtn" /></td>
				<td class="left">所需积分：</td>
				<td><input type="text" name="points" class="pro_xujf" value="" /></td>
			</tr>
		</tbody>
	</table>
	</form>
	</div>
</div>
<script src="/assets/javascripts/pro_add.js" ></script>


