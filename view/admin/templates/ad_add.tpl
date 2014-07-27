{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
<div class="grid_2">
	<form  method="post" name="codeform" enctype="multipart/form-data">
	<table class="data">
		<tbody>
			<tr>
				<td class="left">图片地址：</td>
				<td><input type="text" name="src" class="t" value="" /></td>
				<td class="left">其他：</td>
				<td><input type="checkbox" value="1" name="target"{if !$adinfo.target||$adinfo.target==1} checked{/if} /> 新窗口打开
                </td>
			</tr>
			<tr>
				<td class="left">链接地址：</td>
				<td><input type="text" name="link" class="t" value="" /></td>
				<td class="left">排序：</td>
				<td><input type="text" name="rank" value="{if $adinfo.rank}{$adinfo.rank}{else}10{/if}" /></td>
			</tr>
			<tr>
				<td class="left">开始日期：</td>
				<td><input class="kg_datePicker ad_st" data-config='{"isHoliday": false,
                           "minDate" :"2013-08-09","finalTriggerNode" : "kg_datePicker_final", "finalTriggerMinDate" : "2013-08-10"}' type="text" name="start_time" value=""/></td>
				<td class="left">结束日期：</td>
				<td><input class="kg_datePicker ad_et" data-config='{"isHoliday": false,
                           "minDate" :"2013-08-09","finalTriggerNode" : "kg_datePicker_final", "finalTriggerMinDate" : "2013-08-10"}' type="text" name="end_time" value=""/></td>
			</tr>
			<tr>
				<td class="left">标题：</td>
				<td><input type="text" name="title" class="t" value="" /></td>
				<td class="left">备注：</td>
				<td><input type="text" name="remark" value="" /> </td>
			</tr>
			<tr>
				<td class="left">类目：</td>
				<td colspan="3">
				<select name="cat">
                    <option value="100">首页轮播</option>
                    <option value="98"{if $adinfo.cat==98} selected{/if}>兑换首页</option>
                    <option value="97"{if $adinfo.cat==97} selected{/if}>兑换详情页轮播</option>
		    <option value="96"{if $adinfo.cat==96} selected{/if}>中部</option>
                    <option value="99"{if $adinfo.cat==99} selected{/if}>底部</option>
				</select>
				</td>
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
<script src="/assets/javascripts/ad.js"></script>
