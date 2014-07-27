{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_2">
	<form  method="post" name="proform" class="pro_post" >
	<table class="data">
		<tbody>
        <tr>
          <td class="left">更新类目ID：</td>
          <td colspan="3"><input name="catInput" type="text" class="cat-input">多个用英文逗号分开
          	<select name="cat">
		{foreach from=$cats item=c}
		<option value="{$c.rank}">{$c.rank}-{$c.name}</option>
		{/foreach}
		</select>
		排序：
		<select name="order">
			<option value="0">默认排序</option>
			<option value="1">折扣价格从高到低</option>
			<option value="2">折扣价格从低到高</option>
			<option value="3">信用等级从高到低</option>
			<option value="4">信用等级从低到高</option>
			<option value="5">佣金比率从高到低</option>
			<option value="6">佣金比率从低到高</option>
			<option value="7">成交量成高到低</option>
			<option value="8">成交量从低到高</option>
		</select>
        </td>
        </tr>
        <tr>
          <td class="left">抓取类目ID：</td>
          <td colspan="3"><input name="cidInput" type="text" class="cid-input"> 同更新类目对应，个数相同
             <select class="cid" name="cid" style="MARGIN-TOP: 1px; WIDTH: 222px">
		{foreach from=$api_cids key=k item=v}
		<option value="{$k}"{if $k<1} disabled style="background-color:#F60; color:#fff"{else} style="padding-left:2em"{/if}>{$k}-{$v}</option>
		{/foreach}
    	     </select>
	  </td>
        </tr>
        <tr>
          <td class="left">价格：</td>
          <td><input name="startprice" type="text" style="width:100px;" class="startc"> --> <input name="endprice" type="text" class="short"  style="width:100px;" class="endc"></td>
          <td class="left">页码：</td>
          <td><input name="spage" type="text" style="width:100px;" class="spage"> 页 - <input name="epage" type="text" style="width:100px;" class="epage"> 页</td>
        </tr>
        <tr>
          <td class="left">关键字：</td>
          <td><input name="q" type="text" class="q-input"> </td>
	  <td class="left">每页商品个数：</td>
          <td><input name="page" type="text" class="page-size">默认为40</td>
        </tr>
        <tr>
			  <td class="left">&nbsp;</td>
			  <td class="grey" colspan="3"><input type="submit" name="submit" value=" 提 交 " class="submit-btn"> 更新后请自行审核产品是否符合标准以及修改现价、结束日期等信息</td>
			</tr>
		</tbody>
	</table>
	</form>
	</div>
</div>
<script src="/assets/javascripts/pro_collect.js" ></script>


