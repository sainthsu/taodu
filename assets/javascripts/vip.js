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

$(".tang-carousel-element").c_children().c_on("mouseenter",function(){
	var self = $(this).item(0);
	self.c_addClass("scroll-li-hover");
	}).c_on("mouseleave",function(){
	var self = $(this).item(0);
	self.removeClass("scroll-li-hover");
	});

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

function dialog(text)
{
	DOM.query(".alert_info")[0].innerHTML = text;
	DOM.query(".alert_box")[0].style.display="block";
	
	setTimeout(function(){DOM.query(".alert_box")[0].style.display="none";},800);
}

GS.addListener('windowScroll',function(e)
{
   if(e.scrollTop>213 && e.scrollTop < 570)
   {
		$('.responsive_nav').item(0).c_addClass('responsive_fix_nav');
		$('.m_screening').item(0).removeClass('m_fix_screening');
   }
   else if(e.scrollTop>=570)
   {	
		$('.responsive_nav').item(0).removeClass('responsive_fix_nav');
		$('.m_screening').item(0).c_addClass('m_fix_screening');
   }
   else
   {
		$('.m_screening').item(0).removeClass('m_fix_screening');
		$('.responsive_nav').item(0).removeClass('responsive_fix_nav');
   }
   //console.log(e.scrollTop);
});

