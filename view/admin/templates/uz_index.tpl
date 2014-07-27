{include file="header.tpl"}
<div class="admin_layout">
	{include file="content_left.tpl"}
	<div class="main_container">
	<div class="grid_2">
	<table class="report">
			<tr>
				<th colspan="8">
				<a href="/d/admin/pro?type=1">抽奖商品</a>|<a href="/d/admin/pro?type=2">精选特卖</a>|<a href="/d/admin/pro?type=3">兑换商品</a>|<a href="/d/admin/pro?type=4">店铺商品</a>|<a href="/d/admin/pro?type=5">搭配商品</a>|<a href="/d/admin/pro?check=0">待审商品</a>|<a href="/d/admin/pro?check=1">已审商品</a>
				<select name="cat">
				{foreach from=$cats item=v}
				<option value="{$v.id}">{$v.name}</option>
				{/foreach}
				</select>
				</th>
			</tr>
			<tr>
				<th><input type="checkbox" class="selall" /></th>
				<th width="50"><a href="/d/admin/pro?cmd=pro&order={if $request.order=='rank'}rank desc{else}rank{/if}&cat={$request.cat}">排序 {if $request.order=='rank desc'}↑{elseif $request.order=='rank'}↓{/if}</a><br><i>Rank</i></th>
				<th>商品名称<br><i>Pro Name</i></th>
				<th>缩略图<br><i>thumb</i></th>
				<th>价格<br><i>Cost</i></th>
				<th>类目<br><i>Catagory</i></th>
				<th>状态<br><i>State</i></th>
				<th>操作<br><i>Operate</i></th>
			</tr>
		{foreach from=$pros item=v}
		<tr>
			<td><input type="checkbox" name="sel" class="pro_selected" value="{$v.id}" /></td>
			<td>{$v.rank}</td>
			<td><a href="http://item.taobao.com/item.htm?id={$v.iid}" target="_blank">{$v.title}</a></td>
			<td><img src="{$v.pic}" /></td>
			<td>原:{$v.oprice}<br>现:{$v.nprice}</td>
			<td><a href="/d/admin/pro?{if $request.q}q={$request.q}&{/if}cat={$v.catid}{if $request.order}&order={$request.order}{/if}">{$v.name}</a><br>{if $v.type==1}抽奖商品{elseif $v.type==2}精选特卖{elseif $v.type==3}兑换商品{elseif $v.type==4}店铺商品{elseif $v.type==5}搭配商品{/if}<br>{if $v.rec_type==0}无推荐{elseif $v.rec_type==1}爆款推荐{elseif $v.rec_type==2}特惠商品{elseif $v.rec_type==3}猜你喜欢{elseif $v.rec_type==4}首页图推{elseif $v.rec_type==5}大类列推{/if}</td>
			<td>{if $v.ischeck==0}待审{elseif $v.ischeck==1}已通过{elseif $v.ischeck==2}驳回{elseif $smarty.now|date_format:'%Y-%m-%d' > $v.et}已结束{/if}</td>
			<td>
			<a href="/d/admin/pro?cmd=check&id={$v.id}">审核</a>
			<a href="/d/admin/pro?cmd=mod&id={$v.id}" target="_blank">修改</a> 
			<a href="/d/admin/pro?cmd=askDel&id={$v.id}" name="{$v.id}" class="prodel" >删除</a>
			</td>
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
		</tbody>
	</table>
	</div>
	<div class="clear"></div> 
</div>
<script src="/assets/javascripts/pro.js" ></script>


