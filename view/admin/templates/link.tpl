{include file="header.tpl"}
<div class="admin_layout">
{include file="cooperation_left.tpl"}
	<div class="main_container">
<div class="grid_15">
	<table class="report leftt">
		<thead><tr>
			<th>logo<br><i>Pro Cat Name</i></th>
			<th>����<br><i>Rank</i></th>
			<th>����<br><i>Rank</i></th>
			<th>����<br><i>Operate</i></th></tr>
		</thead>
		<tbody>
		{if $links}
		{foreach from=$links item=v}
		<tr>
			<td><a href="{$v.link}" target="_blank"><img src="{$v.mini_logo}" height="50" /></a></td>
			<td>{$v.link}<br>http://taodu.uz.taobao.com?fromid={$v.id}&nocache=1</td>
			<td>{$v.rank}</td>
			<td>
			<a href="/d/admin/link?act=mod&id={$v.id}">�޸�</a>
			<a href="/d/admin/link?act=askDel&id={$v.id}">ɾ��</a>
			</td>
		</tr>
		{/foreach}
		{/if}
		</tbody>
	</table>
	</div>
	<div class="grid_8">
		<h3>����{if $act=='mod'}�޸�{else}���{/if}</h3>
		<form  method="post" name="catform">
		<div class="add_form">
			<p>
			<label>Uվ��ҳ����</label>
				<input type="text" value="" name="link" class="text-input uz_link">
				<div class="id_notice"><span class="blue">��дվ��URL������http�������ظ��ύ��</span></div>
			</p>
			<p>
			<label>վ������</label>
			<select name="type" class="uz_type">
			<option value="1">���ӻ�</option>
			<option value="2">�Զ���</option>
            </select>
			</p>
			<p class="clear"></p>
			<p>
			<label>Сͼ��ַ</label>
			<input type="text" value="" name="mini_logo" class="text-input uz_mini_logo">
			<span class="blue clear">��ַ�������Ա���ַ 70X70(�ֱ��ʲ����Ͻ���ɾ��)</span>
			</p>
			<p>
			<label>��ͼ��ַ</label>
			<input type="text" value="" name="big_logo" class="text-input uz_big_logo">
			<span class="blue clear">��ַ�������Ա���ַ 130X80(�ֱ��ʲ����Ͻ���ɾ��)</span>
			</p>
			<p class="clear"></p>
			<p>
			<label>վ������</label>
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
