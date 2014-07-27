<div class="tjfq" id="tjfq">
  <div class="g-menu">
	<div class="menu-shadow-hack"></div>
	<div class="g-menu-wrap">
		<a href="/d/index?aciton=index" class="all-btn" style="float:left;">淘尚之城-购物之都</a>
        	<div class="channel">
            	<ul>
            	<li{if !$request.action || $request.action=='index'}
				 class="current"
			   {/if}>
			<a class="first" href="/d/jing">全部</a></li>
            	{foreach key=k item=v from=$nav_types}
            	<li
			{if $k==$request.type && $request.type && !$request.date}
				class="current" 
			{/if}>
				<a href="/d/jing?action=cate&type={$k}">{$v}</a>
			</li>
            	{/foreach}
            	</ul>
        	</div>
		<a href="/d/index?action=addus" class="addus">商家要逆袭</a>
	</div>
    </div>
	
