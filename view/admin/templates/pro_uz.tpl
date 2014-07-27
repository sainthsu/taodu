{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_2">
	<form  method="post" name="proform" class="pro_post" >
	<table class="data">
		<tbody>
        <tr>
          <td class="left">U站地址：</td>
          <td>
		<input name="uz_url" type="text" style="width:200px;" class="startc">
		  </td>
        <tr>
          <td class="left"><input name="api_support" value="1" type="checkbox" checked="checked"/></td>
          <td>是否开启淘宝API协助收集</td>
        </tr>
        <tr>
			  <td class="left">&nbsp;</td>
			  <td class="grey" colspan="3"><input type="submit" name="submit" value=" 提 交 " class="submit-btn"> 更新后请自行审核产品是否符合标准以及修改现价、结束日期等信息</td>
			</tr>
		</tbody>
	</table>
	</form>
	<a href="#" class="publish">发布今日商品至UZ内置数据库</a>
	</div>
</div>
<script src="/assets/javascripts/pro_collect.js" ></script>


