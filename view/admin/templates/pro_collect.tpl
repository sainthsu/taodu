{include file="header.tpl"}
<div class="admin_layout">
{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_2">
	<form  method="post" name="proform" class="pro_post" >
	<table class="data">
		<tbody>
        <tr>
          <td class="left">������ĿID��</td>
          <td colspan="3"><input name="catInput" type="text" class="cat-input">�����Ӣ�Ķ��ŷֿ�
          	<select name="cat">
		{foreach from=$cats item=c}
		<option value="{$c.rank}">{$c.rank}-{$c.name}</option>
		{/foreach}
		</select>
		����
		<select name="order">
			<option value="0">Ĭ������</option>
			<option value="1">�ۿۼ۸�Ӹߵ���</option>
			<option value="2">�ۿۼ۸�ӵ͵���</option>
			<option value="3">���õȼ��Ӹߵ���</option>
			<option value="4">���õȼ��ӵ͵���</option>
			<option value="5">Ӷ����ʴӸߵ���</option>
			<option value="6">Ӷ����ʴӵ͵���</option>
			<option value="7">�ɽ����ɸߵ���</option>
			<option value="8">�ɽ����ӵ͵���</option>
		</select>
        </td>
        </tr>
        <tr>
          <td class="left">ץȡ��ĿID��</td>
          <td colspan="3"><input name="cidInput" type="text" class="cid-input"> ͬ������Ŀ��Ӧ��������ͬ
             <select class="cid" name="cid" style="MARGIN-TOP: 1px; WIDTH: 222px">
		{foreach from=$api_cids key=k item=v}
		<option value="{$k}"{if $k<1} disabled style="background-color:#F60; color:#fff"{else} style="padding-left:2em"{/if}>{$k}-{$v}</option>
		{/foreach}
    	     </select>
	  </td>
        </tr>
        <tr>
          <td class="left">�۸�</td>
          <td><input name="startprice" type="text" style="width:100px;" class="startc"> --> <input name="endprice" type="text" class="short"  style="width:100px;" class="endc"></td>
          <td class="left">ҳ�룺</td>
          <td><input name="spage" type="text" style="width:100px;" class="spage"> ҳ - <input name="epage" type="text" style="width:100px;" class="epage"> ҳ</td>
        </tr>
        <tr>
          <td class="left">�ؼ��֣�</td>
          <td><input name="q" type="text" class="q-input"> </td>
	  <td class="left">ÿҳ��Ʒ������</td>
          <td><input name="page" type="text" class="page-size">Ĭ��Ϊ40</td>
        </tr>
        <tr>
			  <td class="left">&nbsp;</td>
			  <td class="grey" colspan="3"><input type="submit" name="submit" value=" �� �� " class="submit-btn"> ���º���������˲�Ʒ�Ƿ���ϱ�׼�Լ��޸��ּۡ��������ڵ���Ϣ</td>
			</tr>
		</tbody>
	</table>
	</form>
	</div>
</div>
<script src="/assets/javascripts/pro_collect.js" ></script>


