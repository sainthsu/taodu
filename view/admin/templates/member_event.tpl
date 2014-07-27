{include file="header.tpl"}
<div class="admin_layout">
	{include file="user_left.tpl"}
	<div class="main_container">
	<div class="grid_2">
	<table class="report">
			  <tr style="color:#666666;font-size:14px;font-weight:bold;">
				<td height="30" width="15%" align="center" valign="middle" bgcolor="#F7F7F7">时间</td>
				<td height="30" width="35%" align="center" valign="middle" bgcolor="#F7F7F7">加密昵称</td>
				<td height="30" width="40%" align="center" valign="middle" bgcolor="#F7F7F7">详情</td>
				<td height="30" width="10%" align="center" valign="middle" bgcolor="#F7F7F7">操作</td>
			  </tr>
			
			{foreach from=$events item=i}
			<tr>
				<td height="34" width="15%" align="center" valign="middle" bgcolor="#F7F7F7" class="putgd" style="font-family:'微软雅黑'">{$i.time}</td>
				<td height="34" width="35%" align="center" valign="middle" bgcolor="#F7F7F7" class="putgd">{$i.username}</td>
				<td height="34" width="40%" align="center" valign="middle" bgcolor="#F7F7F7" class="putgd">{$i.event}</td>
				<td height="34" width="10%" align="left" valign="middle" bgcolor="#F7F7F7" class="putgd"><a class="event_del" title="{$i.id}"><img style="width:7px;height:7px;"src="http://img03.taobaocdn.com/imgextra/i3/1661536580/T2WpZHXepXXXXXXXXX_!!1661536580.jpg" /></a></td>
			  </tr>
			{/foreach}			

			<tr><td colspan="8" style="text-align:left">
			<select class="pro_caozuo">
				<option value="1">删除</option>
			</select>
			<input type="text" style="display:none; height:13px;" name="ts" id="ts" value="请输入续期天数..." />
			<input type="button" class="pro_act" value="提交" />
		</td></tr>
		<tr><td colspan="8" class="page">{$pageStr}</td></tr>
	</table>
	</div>
	<div class="clear"></div> 
</div>
<script src="/assets/javascripts/pro.js" ></script>


