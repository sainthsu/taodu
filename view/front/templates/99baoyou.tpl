{include file="../../includes/header.tpl"}
<link href="/assets/stylesheets/act/99baoyou.css" rel="stylesheet" />
<div id="bg" class="clearfix">
    	<div class="sharebar">
        	<a href="/d/index?action=yugao" target="_blank" class="baoming"></a>
        	<a href="#" class="tixing"></a>
            <div class="sns-widget share" data-sharebtn='{
    "pic":"",
    "client_id":"",
    "comment":"亲们，特价疯抢9.9专场很给力，上百款9.9宝贝，限量开抢ING！",
    "title":"特价疯抢，专人砍价，良心推荐！",
    "isShowFriend":false,
    "type":"webpage",
    "key":"location.href"}'>
</div>
        </div>
        <div class="container">
{if $hidepros}
<p style="text-align:center; color:#fff; font-size:16px; padding:100px 0;">亲们，本场开始时间为：{$hidepros}。<br />查看预告请前往：www.tejiafengqiang.com/act/99baoyou</p>
{else}
{foreach from=$pros key=k item=v}
<div class="group clearfix">
    <span class="product rwd-row cat cat{$k}">
        <img src="/assets/images/act/99baoyou/cat_{$k}.png">
    </span>
    {foreach from=$v item=pro}
    <div class="product_content">
    {if $pro.st|date_format:"%Y-%m-%d" > $smarty.now|date_format:"%Y-%m-%d"}
    <a class="product rwd-row">
    {elseif $pro.ischeck==3}
     <a class="product rwd-row soldOut">
          <img class="soldOutImg" src="/assets/images/act/99baoyou/T115FOXpBhXXayfMZ5-132-130.png">
    {else}
	 <a href="{$pro.link}" target="_blank" class="product rwd-row">
    {/if}
              <span class="imgBox">
                  <img src="{$pro.pic}">
              </span>
              <span class="info">
                  <strong class="currentPrice">￥<i>{$pro.nprice}</i></strong>
                  <del class="originalPrice">￥{$pro.oprice}</del>
                  <span class="sellStatus">{$pro.title}</span>
              </span>
	</a>
    </div>
	{/foreach}
</div>
{/foreach}
{/if}
        <div class="bar">
            <img src="/assets/images/act/99baoyou/bar{$dt}.jpg" border="0" usemap="#Map" />
            <map name="Map" id="Map">
              <area shape="poly" coords="5,47,104,5,113,28,18,69,3,64" href="/view/front/act.php?action=99baoyou&dt=20130422" />
              <area shape="poly" coords="4,72,114,104,131,144,26,113" href="/view/front/act.php?action=99baoyou&dt=20130423" />
              <area shape="poly" coords="14,115,16,145,107,173,130,165,127,151,115,144" href="/view/front/act.php?action=99baoyou&dt=20130424" />
              <area shape="poly" coords="15,205,12,216,31,228,92,217,123,211,134,181" href="/view/front/act.php?action=99baoyou&dt=20130425" />
        </map>
        </div>
        </div>
    </div>
{include file="../../includes/footer.tpl"}
