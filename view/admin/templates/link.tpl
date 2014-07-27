{include file="header.tpl"}
<div class="admin_layout">
{include file="cooperation_left.tpl"}
	<div class="main_container">
<div class="grid_15">
	<table class="report leftt">
		<thead><tr>
			<th>logo<br><i>Pro Cat Name</i></th>
			<th>链接<br><i>Rank</i></th>
			<th>排序<br><i>Rank</i></th>
			<th>操作<br><i>Operate</i></th></tr>
		</thead>
		<tbody>
		{if $links}
		{foreach from=$links item=v}
		<tr>
			<td><a href="{$v.link}" target="_blank"><img src="{$v.mini_logo}" height="50" /></a></td>
			<td>{$v.link}<br>http://taodu.uz.taobao.com?fromid={$v.id}&nocache=1</td>
			<td>{$v.rank}</td>
			<td>
			<a href="/d/admin/link?act=mod&id={$v.id}">修改</a>
			<a href="/d/admin/link?act=askDel&id={$v.id}">删除</a>
			</td>
		</tr>
		{/foreach}
		{/if}
		</tbody>
	</table>
	</div>
	<div class="grid_8">
		<h3>友链{if $act=='mod'}修改{else}添加{/if}</h3>
		<form  method="post" name="catform">
		<div class="add_form">
			<p>
			<label>U站首页链接</label>
				<input type="text" value="" name="link" class="text-input uz_link">
				<div class="id_notice"><span class="blue">填写站点URL（包含http，不可重复提交）</span></div>
			</p>
			<p>
			<label>站点类型</label>
			<select name="type" class="uz_type">
			<option value="1">可视化</option>
			<option value="2">自定义</option>
            </select>
			</p>
			<p class="clear"></p>
			<p>
			<label>小图地址</label>
			<input type="text" value="" name="mini_logo" class="text-input uz_mini_logo">
			<span class="blue clear">地址必须是淘宝地址 70X70(分辨率不符合将被删除)</span>
			</p>
			<p>
			<label>大图地址</label>
			<input type="text" value="" name="big_logo" class="text-input uz_big_logo">
			<span class="blue clear">地址必须是淘宝地址 130X80(分辨率不符合将被删除)</span>
			</p>
			<p class="clear"></p>
			<p>
			<label>站长旺旺</label>
				<input type="text" value="" name="wangwang" class="text-input uz_wangwang">
			</p>
			<p>
			<label>&nbsp;</label>
			<input type="submit" value="1" name="submit" class="button pro_post link_post">
			</p>
		</div>
	</div>
		</form>
	</div>
</div>
</div>
