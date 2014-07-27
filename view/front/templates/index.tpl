{include file="../../includes/header.tpl"}
	<div class="container index_container">
	{if $ads[0]}
	<div class="focusAD catagory_slide slide">
	<ul>
		{foreach from=$ads item=v}
				<li><a href="{$v.link}" 
				{if $v.target} target=_blank{/if}>
				<img src="{$v.src}" /></a>
				</li>
		{/foreach}
	</ul>
	</div>
	{/if}
    
    {if $pros1}
    {$str}
    {foreach from=$pros1 item=pro key=i}
				<li class="proList">
				<a target="_blank" class="p" title="{$pro.title}" href="{$pro.link}">
		  		<span class="{if $pro.type==10}ju{else}pic_c{/if}"><img src="{$pro.pic}" /></span>
		  		<span class="title">{$pro.ptitle}{$pro.title}</span>
		  		<!-- 
		  		<span class="list1_op">原价：<b class="ho">{$pro.oprice}</b> 元</span>
				<span class="list1_num">仅提供：<b>{$pro.num}</b> 件</span>
		  		<span class="list1_np">{$pro.pname}：<b class="ho">{$pro.nprice} {$pro.carriage}</b></span>
		  		 -->
		  		<p class="fl">
	                <span class="price_list_sale">￥
	                	<em>{$pro.nprice}</em>
	                	<del class="f12 gray">￥{$pro.oprice}</del>
	                </span>
	                <span class="price_list_time">
	                	<i {if $pro.shop_type==1}class="tmall"{/if}></i>
	                	仅提供：{if $pro.num>0}{$pro.num}{else}100{/if}
						 件
	                </span>
	            </p>
		  		{$pro.zhuangtai}
				{if $pro.ischeck==3 || $now>$pro.et}
					<i class="soldout"></i>
				{/if}
		  		</a>
				</li>
    {/foreach}
    {$str1}
    {/if}
    {if $pros2}
    {$str2}
    <div style="padding-bottom:10px;border-top:1px solid #FFCC7F; border-bottom:1px solid #FFCC7F;background-color:#FFFFE5; display:none;" id=xiawu><div class="recpro_list"><ul>
    {foreach from=$pros2 item=pro key=i}
				<li class="proList">
				<a target="_blank" class="p" title="{$pro.title}" href="{$pro.link}">
		  		<span class="{if $pro.type==10}ju{else}pic_c{/if}"><img src="{$pro.pic}" /></span>
		  		<span class="title">{$pro.ptitle}{$pro.title}</span>
		  		<!-- 
		  		<span class="list1_op">原价：<b class="ho">{$pro.oprice}</b> 元</span>
				<span class="list1_num">仅提供：<b>{$pro.num}</b> 件</span>
		  		<span class="list1_np">{$pro.pname}：<b class="ho">{$pro.nprice} {$pro.carriage}</b></span>
		  		 -->
		  		<p class="fl">
	                <span class="price_list_sale">￥
	                	<em>{$pro.nprice}</em>
	                	<del class="f12 gray">￥{$pro.oprice}</del>
	                </span>
	                <span class="price_list_time">
	                	<i {if $pro.shop_type==1}class="tmall"{/if}></i>
	                	仅提供：{if $pro.num>0}{$pro.num}{else}100{/if}
						 件
	                </span>
	            </p>
		  		{$pro.zhuangtai}
				{if $pro.ischeck==3 || $now>$pro.et}
					<i class="soldout"></i>
				{/if}
		  		</a>
				</li>
    {/foreach}
    </ul>
    <div class="clear"></div>
    </div></div>
    {/if}
	<div class="recpro_list">
			<ul>
				<li>
					<div class="nav-bao">
						<div class="top"></div>
  						<img src="/assets/images/logo.gif" style="height:64px;">
						<div class="center_bg">						
							<div class="top-state">
								<span class="select normal">热门</span>
								<span class="explain">不看你就out了</span>
							</div>		
							<div class="classify">
								<a href="/d/jing"{if !$request.action || $request.action=='index'}
				 				class="acitve"{/if}>全部</a>
					            {foreach key=k item=v from=$catList}
				                	<a href="/d/jing?action=cate&id={$v.id}" {if $request.id == $v.id}class="acitve"{/if}>{$v.name}</a>
				                {/foreach}
							</div>
							<div class="type_show">
								<ul>
									<li>
										<a href="/d/jing?action=cate&type=0" {if $request.type==="0"}class="active"{/if}>9.9包邮</a>
									</li>
									<li>
										<a href="/d/jing?action=cate&type=1" {if $request.type==1}class="active"{/if}>39封顶</a>
									</li>
									<li>
										<a href="#" class="yugao" title="优惠信息早知道">明日预告</a>
										<em class="num">5点</em>
									</li>
								</ul>
							</div>
							<div class="discount-num">
								<a href="/d/jing?action=cate&date=today">
									<i class="tjfq-num"></i>
									精选特卖独家的优惠有：
									<b>{$tejianum}</b>
									件
								</a>
							</div>
							<div class="search-box">
								<form action="" method="get">
									<input type="text" name="q" value="{if $q}{$q}{else}不想逛了，我搜~{/if}" title="不想逛了，我搜~" class="text q" />
									<input type="submit" class="btn search_btn" value="" />
								</form>
							</div>
						</div>
						<div class="end1"></div>
					</div>
				</li>
			{foreach from=$pros item=pro key=i}
				<li class="proList">
				<a target="_blank" class="p" title="{$pro.title}" href="{$pro.link}">
		  		<span class="{if $pro.type==10}ju{else}pic_c{/if}"><img src="{$pro.pic}" /></span>
		  		<span class="title">{$pro.ptitle}{$pro.title}</span>
		  		<!-- 
		  		<span class="list1_op">原价：<b class="ho">{$pro.oprice}</b> 元</span>
				<span class="list1_num">仅提供：<b>{$pro.num}</b> 件</span>
		  		<span class="list1_np">{$pro.pname}：<b class="ho">{$pro.nprice} {$pro.carriage}</b></span>
		  		 -->
		  		<p class="fl">
	                <span class="price_list_sale">￥
	                	<em>{$pro.nprice}</em>
	                	<del class="f12 gray">￥{$pro.oprice}</del>
	                </span>
	                <span class="price_list_time">
	                	<i {if $pro.shop_type==1}class="tmall"{/if}></i>
	                	仅提供：{if $pro.num>0}{$pro.num}{else}100{/if}
						 件
	                </span>
	            </p>
		  		{$pro.zhuangtai}
				{if $pro.ischeck==3 || $now>$pro.et}
					<i class="soldout"></i>
				{/if}
		  		</a>
				</li>
			{/foreach}
			</ul>
	</div>

	<div class="block70"></div>
	<div class="pagination">
		{$pageStr}
	</div>
	</div>
{include file="../../includes/footer.tpl"}
