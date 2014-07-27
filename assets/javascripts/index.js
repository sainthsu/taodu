/**************************************************
 * 用法：
 *count:图片数量，
 *wrapId:包裹图片的DIV的className
 *ulId:按钮DIV class,
 *infoId：信息栏
 *stopTime：每张图片停留的时间
 *SWTICH.scroll(count,wrapId,ulId,infoId,stopTime);
 **************************************************/
var $ = KISSY.all; 
var DOM = KISSY.DOM;
var Event = KISSY.Event;
var Anim = KISSY.Anim;

var tangContainer = DOM.query('.tang-carousel-container')[0];
var filter,cate,order,page;
Event.on(tangContainer,"mouseenter",function()
	{
		DOM.addClass(DOM.query(".scroll-area")[0],"scroll-hover");
	});
Event.on(tangContainer,"mouseleave",function()
	{
		DOM.removeClass(DOM.query(".scroll-area")[0],"scroll-hover");
	});
var tangUl = tangContainer;

var rightmove;
Event.on(DOM.query('.tang-carousel-btn-next')[0],"click",function(e)
{
	clearInterval(rightmove);
	rightmove = setInterval(moveRight,1);
});

function moveRight()
{
	if(tangUl.scrollLeft==2880)
	{
		tangUl.scrollLeft=0;
	}
	tangUl.scrollLeft +=10;
	if(tangUl.scrollLeft==0||tangUl.scrollLeft==960||tangUl.scrollLeft==1920||tangUl.scrollLeft==2880)
	{
		clearInterval(rightmove);
	}
}

var leftmove;
Event.on(DOM.query('.tang-carousel-btn-prev')[0],"click",function(e)
{
	clearInterval(leftmove);
	leftmove = setInterval(moveLeft,1);
});

function moveLeft()
{
	if(tangUl.scrollLeft==0)
	{
		tangUl.scrollLeft=2880
	}
	tangUl.scrollLeft -=10;

	if(tangUl.scrollLeft==0||tangUl.scrollLeft==960||tangUl.scrollLeft==1920||tangUl.scrollLeft==2880)
	{
		clearInterval(leftmove);
	}
}

$(".filter").c_on("click",function(){
	var self = $(this).item(0);
	filter= DOM.attr(this,'data-filter');
	cate = getCate();
	order = getOrder();
	$(".filter").removeClass('selected');
	self.c_addClass('selected');
	console.log('filter:'+filter+";cate:"+cate+";order:"+order);
	GETPRO(filter,cate,order,1);
});

$(".choose-cate").c_on("click",function(){
	var self = $(this).item(0);
	cate= DOM.attr(this,'data-cate');
	filter = getFilter();
	order = getOrder();
	$(".choose-cate").removeClass('selected');
	self.c_addClass('selected');
	GETPRO(filter,cate,order,1);
});

$(".sort-type").c_on("click",function(){
	var self = $(this).item(0);
	order= DOM.attr(this,'data-order');
	filter = getFilter();
	cate = getCate();
	$(".sort-type").removeClass('selected');
	self.c_addClass('selected');
	GETPRO(filter,cate,order,1);

});

setHover();

function getFilter()
{
	var selected = $('.filter').c_filter('.selected').c_getDOMNodes();
	var filter = DOM.attr(selected,'data-filter');
	return filter;
}

function getCate()
{
	var selected = $('.choose-cate').c_filter('.selected').c_getDOMNodes();
	var cate = DOM.attr(selected,'data-cate');
	return cate;
}

function getOrder()
{
	var selected = $('.sort-area').c_children('.selected').c_getDOMNodes();
	var order = DOM.attr(selected,'data-order');
	return order;
}

$(".tang-carousel-element").c_children().c_on("mouseenter",function(){
	var self = $(this).item(0);
	self.c_addClass("scroll-li-hover");
	}).c_on("mouseleave",function(){
	var self = $(this).item(0);
	self.removeClass("scroll-li-hover");
	});

function setHover()
{
	$(".wt-good-item-n").c_on("mouseenter",function(){
	var self = $(this).item(0);
	self.c_addClass("wt-good-item-n-hover");
	}).c_on("mouseleave",function(){
	var self = $(this).item(0);
	self.removeClass("wt-good-item-n-hover");
	});
}

var GETPRO = function(filter,cate,order,page)
{
	if(cate == undefined)
	{
		cate = 0;
	}
	
	var goodsContainer = DOM.query('.goods-container')[0];
	$('.goods-container').c_children().fadeIn();
	goodsContainer.innerHTML = '<img class="loading" src="/assets/images/loading.gif"/>';
	KISSY.io(
			{         
         		jsonp: "callback" , 
          		url: "/d/pro?action=json",
          		data: {"filter":filter,"cate":cate,"page":page,"order":order},
				dataType:"jsonp",
            	success: function(data)
				{
					if(data.result==0)
					{
						dialog(data.info);
						return false;
					}
					else if(data.result==1)
					{
						var list = data.list;
						var length = list.length;
						if(length > 0)
						{
							var htmlStr = "";
							for(var i = 0;i<length;i++)
							{
								var pro = list[i];
								htmlStr += '<div class="mb20 wt-good-item-n ';
								htmlStr += i%4==0?'wt-good-first-n':'mr19';
								htmlStr += '"><a href="http://item.taobao.com/item.htm?id=';
								htmlStr += pro.iid;
								htmlStr +='" class="good-item-n-wrap" target="_blank"><div class="good-item-n-border"></div></a>';
								htmlStr += '<div class="good-n-meta clearfix"><div class="good-n-img"><div class="good-indication"><i class="free-appointment"></i></div><a href="http://item.taobao.com/item.htm?id=';
								htmlStr += pro.iid;
								htmlStr += '" style="display:block;" target="_blank"><img class="img-goods-pic" alt="" src="';
								htmlStr += pro.pic;
								htmlStr += '"></a>';
								htmlStr += '<a class="good-loc" href="http://item.taobao.com/item.htm?id=';
								htmlStr += pro.iid;
								htmlStr += '" target="_blank"><div class="good-loc-bg"></div><span>';
								htmlStr += pro.remark==undefined?'实惠好看，挺不错的哦！':pro.remark;
								htmlStr += '</span></a></div>';
								htmlStr += '<div class="good-n-title"><a class="fcb" href="http://aitem.taobao.com/item.htm?id=';
								htmlStr += '" target="_blank" title="';
								htmlStr += pro.title+'">'+pro.title+'</a></div></div>';
							htmlStr += '<div class="good-n-price"><div class="good-value"> <small>￥</small>';
							htmlStr += pro.nprice;
							htmlStr += '</div><div class="good-pre"> <span>￥';
							htmlStr += pro.oprice;
							htmlStr += '</span> </div><span class="good-rebate">';
							htmlStr += pro.discount;
							htmlStr += '折</span></div><div class="good-n-foot"><a class="n-sitename" target="_blank" title="">';
							htmlStr += pro.seller_nick;
							htmlStr += '</a><div class="n-bought">';
							htmlStr += pro.volume;
							htmlStr += '人购买 </div><a class="favor favor-ico" data-id="80003">收藏</a></div><div class="msg clearfix"><a class="close-ico"></a><b>收藏成功!</b><a class="favor-login">登录</a> 后收藏才能长久保存</div></div>';
							}
							goodsContainer.innerHTML = htmlStr;
							setHover();
						}	
					}
				},
          		error: function()
				{
					dialog("请求错误，请重试！");
          		},
     	   });
};

$('.more-link').c_on("click",function(){
	var self = $(this);
	page = DOM.attr(this,"data-page");
	
	GETMORE(filter,cate,order,parseInt(page)+1);
});

var GETMORE = function(filter,cate,order,page)
{
	var more = DOM.query('.more-tip')[0];
	if(cate == undefined)
	{
		cate = 0;
	}
	
	var goodsContainer =  DOM.query('.goods-container')[0];

	more.innerHTML = '正在加载<img src="/assets/images/loading.gif"/>';
	KISSY.io(
			{         
         		jsonp: "callback" , 
          		url: "/d/pro?action=json",
          		data: {"filter":filter,"cate":cate,"page":page,"order":order},
				dataType:"jsonp",
            	success: function(data)
				{
					if(data.result==0)
					{
						dialog(data.info);
						return false;
					}
					else if(data.result==1)
					{
						var list = data.list;
						var length = list.length;
						if(length > 0)
						{
							var htmlStr = "";
							for(var i = 0;i<length;i++)
							{
								var pro = list[i];
								htmlStr += '<div class="mb20 wt-good-item-n ';
								htmlStr += i%4==0?'wt-good-first-n':'mr19';
								htmlStr += '"><a href="http://item.taobao.com/item.htm?id=';
								htmlStr += pro.iid;
								htmlStr +='" class="good-item-n-wrap" target="_blank"><div class="good-item-n-border"></div></a>';
								htmlStr += '<div class="good-n-meta clearfix"><div class="good-n-img"><div class="good-indication"><i class="free-appointment"></i></div><a href="http://item.taobao.com/item.htm?id=';
								htmlStr += pro.iid;
								htmlStr += '" style="display:block;" target="_blank"><img class="img-goods-pic" alt="" src="';
								htmlStr += pro.pic;
								htmlStr += '"></a>';
								htmlStr += '<a class="good-loc" href="http://item.taobao.com/item.htm?id=';
								htmlStr += pro.iid;
								htmlStr += '" target="_blank"><div class="good-loc-bg"></div><span>';
								htmlStr += pro.remark==undefined?'实惠好看，挺不错的哦！':pro.remark;
								htmlStr += '</span></a></div>';
								htmlStr += '<div class="good-n-title"><a class="fcb" href="http://aitem.taobao.com/item.htm?id=';
								htmlStr += '" target="_blank" title="';
								htmlStr += pro.title+'">'+pro.title+'</a></div></div>';
							htmlStr += '<div class="good-n-price"><div class="good-value"> <small>￥</small>';
							htmlStr += pro.nprice;
							htmlStr += '</div><div class="good-pre"> <span>￥';
							htmlStr += pro.oprice;
							htmlStr += '</span> </div><span class="good-rebate">';
							htmlStr += pro.discount;
							htmlStr += '折</span></div><div class="good-n-foot"><a class="n-sitename" target="_blank" title="">';
							htmlStr += pro.seller_nick;
							htmlStr += '</a><div class="n-bought">';
							htmlStr += pro.volume;

							htmlStr += '人购买 </div><a class="favor favor-ico" data-id="80003">收藏</a></div><div class="msg clearfix"><a class="close-ico"></a><b>收藏成功!</b><a class="favor-login">登录</a> 后收藏才能长久保存</div></div>';
							}
							//console.log(goodsContainer.innerHTML);
							goodsContainer.innerHTML += htmlStr;
							setHover();
							DOM.attr(DOM.query(".more-link")[0],"data-page",page);
						}	
					}
				},
          		error: function()
				{
					dialog("请求错误，请重试！");
          		},
     	   });
	setTimeout(function(){more.innerHTML = "显示更多给力商品";},2000);
};

/*
var SWTICH = function()
{
 function id(name) {return DOM.query("."+name)[0];}
 //遍历函数
 function each(arr, callback, thisp) 
{
  if (arr.forEach)
  {
   arr.forEach(callback, thisp);
  } 
  else
  {
   for (var i = 0, len = arr.length; i < len; i++)
    callback.call(thisp, arr[i], i, arr);
  }
 }
 function fadeIn(elem) {
  DOM.removeClass(elem,"in");
  var anim;
  if(anim){
    anim.stop();
     }
   // 启动动画
  anim=Anim(elem,{filter:"alpha(opacity=1)",opacity:"1"});
  anim.run();
 }
 function fadeOut(elem) {
  var anim;
  if(anim){
    anim.stop();
     }
   // 启动动画
  anim=Anim(elem,{filter:"alpha(opacity=0)",opacity:"0"});
  anim.run();
  DOM.addClass(elem,"in"); 
 }
 function moveTo(elem,leftoffset)
 {
	var anim;
  	if(anim){

    	anim.stop();
     	}
   // 启动动画leftoffset
	var leftStr = leftoffset+"px";
	console.log(leftoffset);
  	anim=Anim(DOM.query('.js-top-slider')[0],{left:leftStr},1);
  	anim.run();
 }
 return {
  //count:图片数量,wrapId:包裹图片的DIV,ulId:按钮DIV,infoId：信息栏，stopTime：每张图片停留的时间
  scroll : function(count,wrapId,ulId,stopTime)
 {
   var self=this;
   var targetIdx=0;      //目标图片序号
   var curIndex=0;      //现在图片序号
  
   //添加Li按钮
   var frag=document.createDocumentFragment();
   //console.log(frag);
   this.num=[];    //存储各个li的应用，为下面的添加事件做准备
  
   for(var i=0;i<count;i++)
   {
    (this.num[i]=frag.appendChild(document.createElement("li"))).innerHTML=i+1;
   }
   
   id(ulId).appendChild(frag);
   //初始化信息
   this.imgWidth = id("g-menu").offsetWidth;
   this.wrap = id(wrapId)
   this.img = this.wrap.getElementsByTagName("a");
   this.num[0].className="on";
   
   for(var j=0;j<count;j++)
   {
   	this.img[j].style.width= this.imgWidth+"px";
   }
   
   //为所有的li添加点击事件
   each(this.num,function(elem,idx,arr)
   {
    elem.onclick=function()
   {
     self.move(idx,curIndex);
     curIndex=idx;
     targetIdx=idx;
    }
   });
   //自动轮播效果

   var itv=setInterval(function()
    {
    if(targetIdx<self.num.length-1)
    {
     targetIdx++;
    }
    else
    {
     targetIdx=0;
    }
    self.move(targetIdx,curIndex);
    curIndex=targetIdx;
    },stopTime);

   id(ulId).onmouseover=function(){ clearInterval(itv)};
   id(ulId).onmouseout=function()
   {
    itv=setInterval(function()
   {
     if(targetIdx<self.num.length-1)
     {
      targetIdx++;
     }
     else
     {
      targetIdx=0;
     }
     self.move(targetIdx,curIndex);
     curIndex=targetIdx;
    },stopTime);

   }
  },
  move:function(idx,lastIdx)
  {
   if(idx==lastIdx) return;
   var self=this;
   
   moveTo(self.wrap,idx*(-id("g-menu").offsetWidth));
   each(self.num,function(elem,elemidx,arr)
   {
    if (elemidx!=idx)
    {
     self.num[elemidx].className='';
    }
    else
    {
     self.num[elemidx].className='on';
    }
   });
  }

 }
}();
var len = DOM.query(".js-top-slider")[0].getElementsByTagName("a").length;

SWTICH.scroll(len,"js-top-slider","top-slider-pager",3000);*/
//calender

    var monthNames = new Array ( "", "1","2","3","4","5","6","7", "8", "9", "10", "11", "12" );
    var endDay = new Array ( 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 );
    
    var monthNow = 0;
    var dateNow = 0;
    var dayNow = 0;
    var yearNow = 0;

    var now = new Date ();
    monthNow = now.getMonth () + 1;
    yearNow = now.getFullYear ();
    dateNow = now.getDate();
    dayNow = now.getDay()+1;

	DOM.query(".now-date")[0].innerHTML = yearNow+"年"+monthNow+"月";
    if(((yearNow % 4 == 0) && (yearNow % 100 != 0)) || (yearNow % 400 == 0))
    {
	 endDay[2] = 29;
    }

    var days=endDay[monthNow];
    var firstDay = now;
    firstDay.setDate(1);
    var testMe = firstDay.getDate();
    if (testMe == 2) firstDay.setDate(0);
    var startDay = firstDay.getDay();
    var calenderStr = "<table class='calender' width='90%' border='0' cellspacing='1' cellpadding='2'><tr>";
    var column = 0;
    for (var i=0; i<startDay; i++)
    {
      calenderStr +="\n<TD><FONT STYLE='font-size:9pt'> </FONT></TD>";
      column++;
    }
 
    for (i=1; i<=days; i++)
    {
        if (i == dateNow)
        {
             calenderStr += "</TD><TD ALIGN='CENTER' class='day-box' BGCOLOR='#FF8040'><FONT        STYLE='font-size:9pt;Color:#ffffff'><B>";
        }
        else
        {
             calenderStr += "</TD><TD BGCOLOR='#FFFFFF' class='day-box' ALIGN='CENTER'><FONT STYLE='font-size:9pt;font-family:Arial;Color:#999999'>";
        }
       calenderStr += i;
        if (i == dateNow)
		calenderStr +="</FONT></TD>";
        column++;
        if (column == 7)
       	{
            calenderStr += "<TR>"; 
            column = 0;
        }
    }
    for (; column<7; column++)
    {
      calenderStr +="\n<TD><FONT STYLE='font-size:9pt'> </FONT></TD>";
    }
    calenderStr += "</tr></table>";
    DOM.query(".calender_table")[0].innerHTML = calenderStr;

//sign up
Event.on(DOM.query(".sign_button")[0],"click",function()
	{
		KISSY.io(
			{         
         		jsonp: "callback" , 
          		url: "/d/user?action=sign",
          		data: {"data":1},
			dataType:"jsonp",
            		success: function(data)
				{
					if(data.result==0)
					{
						dialog(data.info);
						return false;
					}
					else if(data.result==1)
					{
						dialog(data.info);
						return true;
					}
					else if(data.result==2)
					{

						var daynum = data.num;
						DOM.query(".sign-num")[0].innerHTML=daynum;
						var daystr = data.days;
						var days = daystr.split(',');
						var dayboxes = DOM.query(".day-box");
						for(var j=0;j<daynum;j++)
						{
							DOM.addClass(dayboxes[days[j]-1],"signDay");
						}
						DOM.query(".qiandao")[0].style.display="block";
						
					}
				},
          		error: function()
				{
					dialog("请求错误，请重试！");
          			},
     	    	});
	});

Event.on(DOM.query(".calender_ok")[0],"click",function()
{
	DOM.query(".qiandao")[0].style.display="none";
});

function dialog(text)
{
	DOM.query(".alert_info")[0].innerHTML = text;
	DOM.query(".alert_box")[0].style.display="block";
	
	setTimeout(function(){DOM.query(".alert_box")[0].style.display="none";},800);
}

GS.addListener('windowScroll',function(e)
{
   if(e.scrollTop>=693)
   {
		$('.control-area').item(0).c_addClass('control-area-absorb');
   }
   else
   {
		$('.control-area').item(0).removeClass('control-area-absorb');
   }
   console.log(e.scrollTop);
});

