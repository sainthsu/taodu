{include file="header.tpl"}
<div class="top-banner">
            <div class="banner-wrap">
                <ul class="top-slider-pager" style="right: 152px;">
		</ul>
                <div class="slider-next" id="js-top-slider-next" style="display: block; right: 152.5px;"></div>
                <div class="bx-wrapper" style="width:100%; position:relative;overflow:hidden;">
			<div class="js-top-slider" style="width: 99999px;position:relative;">
			    {foreach from=$banner item=b}
                            <a href="{$b.link}" style="background-image: url({$b.pic});" target="_blank" title="{$b.title}">
			    </a>
			    {/foreach}
			</div>
               </div>
          </div>
</div>
<!--<div class="floor floor-0">
        <div class="news">
            <h4><span>���¶�̬</span></h4>
            <div id="n_index_a4">
                <ul>
                        <li><a href="" target="_blank" class="hot" title="ְ�����ˣ�������ǡ���ô�">ְ�����ˣ�������ǡ���ô�</a></li>
                        <li><a href="" target="_blank" title="�����ͳһ��229 �������370">�����ͳһ��229 �������370</a></li>
                        <li><a href="" target="_blank" title="��49Ԫ����138Ԫб���!">��49Ԫ����138Ԫб���!</a></li>
                        <li><a href="" target="_blank" title="�Ż�����ֹͣ���񣬸�������֪ͨ">�Ż�����ֹͣ���񣬸�������֪ͨ</a></li>

                </ul>
            </div>
            <div id="n_index_a5">
                    <a href="/d/user" target="_blank">
                        <img src="http://img03.taobaocdn.com/imgextra/i3/189209818/T2EN.YXhpXXXXXXXXX_!!189209818.jpg" title="С���ִ�����" style="border-bottom: 1px #ccc solid;"></a>
            </div>
        </div>
        <div class="hot-buy">
            <div class="tabs">
                <a class="tabs-a current" >�����Ƽ�</a>
                <a class="tabs-b" >�ػ���Ʒ</a>
                <a class="tabs-c" >����ϲ��</a>
            </div>
            <div class="tabs-pic-box" id="n_index_t1">
               
            </div>
            <div class="tabs-con">
                <div class="tabs-con-item" id="hot-comm" style="display: block;">
                    <ul class="pro_list clearfix">
			{foreach from=$top item=t}
			<li>
			<a href="http://item.taobao.com/item.htm?id={$t.iid}" class="pic" target="_blank">
			<img src="{$t.pic}" width="174" height="174" title="{$t.title}">
			</a>
			<div class="pro_info">
				<a href="http://item.taobao.com/item.htm?id={$t.iid}" target="_blank" class="name" title="{$t.title}">{$t.title}</a>
				<div class="price"><strong class="red">�Żݼۣ�</strong><strong class="red">��{$t.nprice}</strong><s>��{$t.oprice}</s></div></div>
			</li>
			{/foreach}
			</ul>
		</div>
                <div class="tabs-con-item" id="comms" style="display: none;">
		<ul class="pro_list clearfix">
			{foreach from=$special item=t}
			<li>
			<a href="http://item.taobao.com/item.htm?id={$t.iid}" class="pic" target="_blank">
			<img src="{$t.pic}" width="174" height="174" title="{$t.title}">
			</a>
			<div class="pro_info">
				<a href="http://item.taobao.com/item.htm?id={$t.iid}" target="_blank" class="name" title="{$t.title}">{$t.title}</a>
				<div class="price"><strong class="red">�Żݼۣ�</strong><strong class="red">��{$t.nprice}</strong><s>��{$t.oprice}</s></div>
			</div>
			</li>
			{/foreach}
			</ul>
		</div>
                <div class="tabs-con-item" id="your-like" style="display: none;">
		<ul class="pro_list clearfix">
			{foreach from=$like item=t}
			<li>
			<a href="http://item.taobao.com/item.htm?id={$t.iid}" class="pic" target="_blank">
			<img src="{$t.pic}" width="174" height="174" title="{$t.title}">
			</a>
			<div class="pro_info">
				<a href="http://item.taobao.com/item.htm?id={$t.iid}" target="_blank" class="name" title="{$t.title}">{$t.title}</a>
				<div class="price"><strong class="red">�Żݼۣ�</strong><strong class="red">��{$t.nprice}</strong><s>��{$t.oprice}</s></div></div>
			</li>
			{/foreach}
		</ul>
		</div>
            </div>
        </div>
    </div>-->
<div class="section_cate">
    <h2 class="h_main"><a href="/d/index?action=special&cat=1">����Ůװ <em class="en ff_thm">WOMEN'S FASHION</em></a></h2>
    <div class="spot_temp">
            <div class="temp_ty">
				<ul class="lst_col">
					{foreach from=$recommend[0] item=r}
					<li class="">
					<a href="http://item.taobao.com/item.htm?id={$r.iid}" title="{$r.title}" target="_blank" ><img resizing="false"  data-ks-lazyload="{$r.rec_pic}" alt="{$r.title}" style="opacity: 1;">
					</a>
					</li>
					{/foreach}
				</ul>
			</div>

        <div class="temp_ty" style="clear:both;">
	<ul class="glr_area col5">
		{foreach from=$products[0] item=p key=i}
		<li {if $i==0}class="firstchild"{/if}>
		<a class="thumb" target="_blank" href="http://item.taobao.com/item.htm?id={$p.iid}" title="{$p.title}">
		<img alt="{$p.title}" data-ks-lazyload="{$p.pic}" width="175" style="opacity: 1;">
		</a>
		<a title="{$p.title}" target="_blank" class="subject ellipsis" href="http://item.taobao.com/item.htm?id={$p.iid}">{$p.title}</a>
		<div class="price"><strong>{$p.nprice}Ԫ</strong></div>
		</li>
		{/foreach}
		</ul>
	</div>
    </div>
</div>
<div class="section_cate">
    <h2 class="h_main"><a href="/d/index?action=special&cat=1">����Ь�� <em class="en ff_thm">SHOES & BAG</em></a></h2>
    <div class="spot_temp">
            <div class="temp_ty">
				<ul class="lst_col">
					{foreach from=$recommend[1] item=r}
					<li class="">
					<a href="http://item.taobao.com/item.htm?id={$r.iid}" title="{$r.title}" target="_blank" ><img resizing="false"  data-ks-lazyload="{$r.rec_pic}" alt="{$r.title}" style="opacity: 1;">
					</a>
					</li>
					{/foreach}
				</ul>
			</div>

        <div class="temp_ty" style="clear:both;">
	<ul class="glr_area col5">
		{foreach from=$products[1] item=p key=i}
		<li {if $i==0}class="firstchild"{/if}>
		<a class="thumb" target="_blank" href="http://item.taobao.com/item.htm?id={$p.iid}" title="{$p.title}">
		<img alt="{$p.title}" data-ks-lazyload="{$p.pic}" width="175" style="opacity: 1;">
		</a>
		<a title="{$p.title}" target="_blank" class="subject ellipsis" href="http://item.taobao.com/item.htm?id={$p.iid}">{$p.title}</a>
		<div class="price"><strong>{$p.nprice}Ԫ</strong></div>
		</li>
		{/foreach}
		</ul>
	</div>
    </div>
</div>
<div class="section_cate">
    <h2 class="h_main"><a href="/d/index?action=special&cat=1">ʱ������ <em class="en ff_thm">ACCESSORIES</em></a></h2>
    <div class="spot_temp">
            <div class="temp_ty">
				<ul class="lst_col">
					{foreach from=$recommend[2] item=r}
					<li class="">
					<a href="http://item.taobao.com/item.htm?id={$r.iid}" title="{$r.title}" target="_blank" ><img resizing="false"  data-ks-lazyload="{$r.rec_pic}" alt="{$r.title}" style="opacity: 1;">
					</a>
					</li>
					{/foreach}
				</ul>
			</div>

        <div class="temp_ty" style="clear:both;">
	<ul class="glr_area col5">
		{foreach from=$products[2] item=p key=i}
		<li {if $i==0}class="firstchild"{/if}>
		<a class="thumb" target="_blank" href="http://item.taobao.com/item.htm?id={$p.iid}" title="{$p.title}">
		<img alt="{$p.title}" data-ks-lazyload="{$p.pic}" width="175" style="opacity: 1;">
		</a>
		<a title="{$p.title}" target="_blank" class="subject ellipsis" href="http://item.taobao.com/item.htm?id={$p.iid}">{$p.title}</a>
		<div class="price"><strong>{$p.nprice}Ԫ</strong></div>
		</li>
		{/foreach}
		</ul>
	</div>
    </div>
</div>
<div class="section_cate">
    <h2 class="h_main"><a href="/d/index?action=special&cat=1">ȹװ���� <em class="en ff_thm">UNDERWEAR</em></a></h2>
    <div class="spot_temp">
            <div class="temp_ty">
				<ul class="lst_col">
					{foreach from=$recommend[3] item=r}
					<li class="">
					<a href="http://item.taobao.com/item.htm?id={$r.iid}" title="{$r.title}" target="_blank" ><img resizing="false"  data-ks-lazyload="{$r.rec_pic}" alt="{$r.title}" style="opacity: 1;">
					</a>
					</li>
					{/foreach}
				</ul>
			</div>

        <div class="temp_ty">
	<ul class="glr_area col5" style="clear:both;">
		{foreach from=$products[3] item=p key=i}
		<li {if $i==0}class="firstchild"{/if}>
		<a class="thumb" target="_blank" href="http://item.taobao.com/item.htm?id={$p.iid}" title="{$p.title}">
		<img alt="{$p.title}" data-ks-lazyload="{$p.pic}" width="175" style="opacity: 1;">
		</a>
		<a title="{$p.title}" target="_blank" class="subject ellipsis" href="http://item.taobao.com/item.htm?id={$p.iid}">{$p.title}</a>
		<div class="price"><strong>{$p.nprice}Ԫ</strong></div>
		</li>
		{/foreach}
		</ul>
	</div>
    </div>
</div>

  {include file="footer.tpl"}
<script src="/assets/javascripts/index.js"></script>
