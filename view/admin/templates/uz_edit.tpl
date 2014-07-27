{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_2">
	<form  method="post" name="proform" class="pro_post" >
	<table class="data">
		<tbody>
        <tr>
          <td class="left">优站名称*：</td>
          <td colspan="2"><input name="name" type="text">
          </td>
		  <td class="left">商品iid*：</td>
          <td colspan="2"><input name="iid_start" type="text" style="width:100px;" class="startc"> --> <input name="iid_end" type="text" class="short"  style="width:100px;" class="endc"></td>
        </tr>
        <tr>
          <td class="left">url*：</td>
          <td colspan="2"><input name="url" type="text">
	  	  </td>
		  <td class="left">分页字符*：</td>
          <td colspan="2"><input name="page_str" type="text">
	  	  </td>
        </tr>
		<tr>
          <td class="left">商品区块*：</td>
          <td colspan="2"><input name="zone_start" type="text" style="width:100px;" class="startc"> --> <input name="zone_end" type="text" class="short"  style="width:100px;" class="endc"></td>
          <td class="left">单个商品*：</td>
          <td colspan="2"><input name="pro_start" type="text" style="width:100px;" class="spage"> --> <input name="pro_end" type="text" style="width:100px;" class="epage"></td>
        </tr>
        <tr>
          <td class="left">标题*：</td>
          <td colspan="2"><input name="title_start" type="text" style="width:100px;" class="startc"> --> <input name="title_end" type="text" class="short"  style="width:100px;" class="endc"></td>
		  <td class="left">图片*：</td>
          <td colspan="2"><input name="pic_start" type="text" style="width:100px;" class="startc"> --> <input name="pic_end" type="text" class="short"  style="width:100px;" class="endc"></td>
        </tr>
		<tr>
          <td class="left">原价：</td>
          <td colspan="2"><input name="oprice_start" type="text" style="width:100px;" class="startc"> --> <input name="oprice_end" type="text" class="short"  style="width:100px;" class="endc"></td>
          <td class="left">现价：</td>
          <td colspan="2"><input name="nprice_start" type="text" style="width:100px;" class="spage"> --> <input name="nprice_end" type="text" style="width:100px;" class="epage"></td>
        </tr>
		<tr>
          <td class="left">备注，小编语录等：</td>
          <td colspan="2"><input name="remark_start" type="text" style="width:100px;" class="startc"> --> <input name="remark_end" type="text" class="short"  style="width:100px;" class="endc"></td>
          <td class="left">是否开始：</td>
          <td colspan="2"><input name="isstart_start" type="text" style="width:100px;" class="spage"> --> <input name="isstart_end" type="text" style="width:100px;" class="epage"></td>
        </tr>
		<tr>
          <td class="left">销量：</td>
          <td colspan="2"><input name="volume_start" type="text" style="width:100px;" class="startc"> --> <input name="volume_end" type="text" class="short"  style="width:100px;" class="endc"></td>
          <td class="left">开始时间：</td>
          <td colspan="2"><input name="starttime_start" type="text" style="width:100px;" class="spage"> --> <input name="starttime_end" type="text" style="width:100px;" class="epage"></td>
        </tr>
		<tr>
          <td class="left">店铺类型：</td>
          <td colspan="2"><input name="shoptype_start" type="text" style="width:100px;" class="startc"> --> <input name="shoptype_end" type="text" class="short"  style="width:100px;" class="endc"></td>
          <td class="left">喜欢数：</td>
          <td colspan="2"><input name="like_start" type="text" style="width:100px;" class="spage"> --> <input name="like_end" type="text" style="width:100px;" class="epage"></td>
        </tr>
		<tr>
          <td class="left">自定义：</td>
          <td colspan="2"><input name="diy_start" type="text" style="width:100px;" class="startc"> --> <input name="diy_end" type="text" class="short"  style="width:100px;" class="endc"></td>
		  <td class="left">对应数据库列名：</td>
          <td colspan="2"><input name="diy_column" type="text">
        </tr>
        <tr>
			  <td class="left">&nbsp;</td>
			  <td class="grey" colspan="3"><input type="submit" name="submit" value=" 提 交 " class="submit-btn">带星号＊为必填选项</td>
			</tr>
		</tbody>
	</table>
	</form>
	</div>
</div>


