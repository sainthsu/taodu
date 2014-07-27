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
var Anim = KISSY.Anim ;

var SWTICH = function() {
 function id(name) {return DOM.query("."+name)[0];}
 //遍历函数
 function each(arr, callback, thisp) {
  if (arr.forEach) {
   arr.forEach(callback, thisp);
  } else {
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
 
 return {
  //count:图片数量,wrapId:包裹图片的DIV,ulId:按钮DIV,infoId：信息栏，stopTime：每张图片停留的时间
  scroll : function(count,wrapId,ulId,stopTime) {
   var self=this;
   var targetIdx=0;      //目标图片序号
   var curIndex=0;       //现在图片序号
   //添加Li按钮
   var frag=document.createDocumentFragment();
   //console.log(frag);
   this.num=[];    //存储各个li的应用，为下面的添加事件做准备
  
   for(var i=0;i<count;i++){
    this.num[i]=frag.appendChild(document.createElement("li"));
   }
   //console.log(id(ulId));
   id(ulId).appendChild(frag);
   //初始化信息
   this.img = id(wrapId).getElementsByTagName("a");
   this.num[0].className="on";
   
   //设置banner_bg为透明
   //var banAnim=Anim(id("banner_bg"),{filter:"alpha(opacity=0.3)",opacity:"0.3"},0.01);
   //banAnim.run(); 
   //将除了第一张外的所有图片设置为透明
   each(this.img,function(elem,idx,arr){
    if (idx!=0) {
     DOM.addClass(elem,"in");
     var anim;
     if(anim){
       anim.stop();
        }
      // 启动动画
     anim=Anim(elem,{filter:"alpha(opacity=0)",opacity:"0"},0.01);
     anim.run();
     DOM.addClass(elem,"in"); 
    }
   });
   
   //为所有的li添加点击事件
   each(this.num,function(elem,idx,arr){
    elem.onclick=function(){
     self.fade(idx,curIndex);
     curIndex=idx;
     targetIdx=idx;
    }
   });
   //自动轮播效果
   var itv=setInterval(function(){
    if(targetIdx<self.num.length-1){
     targetIdx++;
    }else{
     targetIdx=0;
     }
    self.fade(targetIdx,curIndex);
    curIndex=targetIdx;
    },stopTime);
   id(ulId).onmouseover=function(){ clearInterval(itv)};
   id(ulId).onmouseout=function(){
    itv=setInterval(function(){
     if(targetIdx<self.num.length-1){
      targetIdx++;
     }else{
      targetIdx=0;
      }
     self.fade(targetIdx,curIndex);
     curIndex=targetIdx;
    },stopTime);
   }
  },
  fade:function(idx,lastIdx){
   if(idx==lastIdx) return;
   var self=this;
   fadeOut(self.img[lastIdx]);
   fadeIn(self.img[idx]);
   each(self.num,function(elem,elemidx,arr){
    if (elemidx!=idx) {
     self.num[elemidx].className='';
    }else{
     id("list").style.background="";
     self.num[elemidx].className='on';
     }
   });
  }
 }
}();
var len = DOM.query(".banner_list")[0].getElementsByTagName("a").length;

SWTICH.scroll(len,"banner_list","list",4000);


var weixin = DOM.query(".ban_ricl")[0];
var wxSwitch = DOM.query(".ban_ri_switch")[0];

Event.on(weixin,"mouseleave",function(e)
{
   //console.log(weixin);
	$('.ban_ric').removeClass("ban_ric_selected");
	DOM.removeClass(weixin,"red_weixin");
	var up=Anim(wxSwitch,{marginTop:"0px"},0.4);
   	up.run();
});
Event.on(weixin,"mouseenter",function(e)
{
	var down=Anim(wxSwitch,{marginTop:"-262px"},0.3,"easeIn",function()
	{
		$('.ban_ric').c_addClass("ban_ric_selected");
		DOM.addClass(weixin,"red_weixin");
	});
   	down.run();
});

var tabs = DOM.query(".tab");

/* tab1 */
function checkUser()
{
	KISSY.io(
		{         
         	jsonp: "callback" , 
          	url: "/d/user?action=getUserInfo",
          	data: {"data":1},
			dataType:"jsonp",
            success: function(data)
			{
				if(data.result==0)
				{
						dialog(data.user);
						return false;
				}
				if(data.result==1)
				{
					var userInfo = data.user;
				      
					if(userInfo.truename!=null&&userInfo.qq!=null&&userInfo.phone!=null&&userInfo.email!=null&&userInfo.address!=null)
					{
						var userBtn = DOM.query(".userinfo_btn")[0];
						userBtn.innerHTML = "<img src='http://img04.taobaocdn.com/imgextra/i4/1661536580/T2b0wGXihXXXXXXXXX_!!1661536580.jpg'>";
						if(DOM.hasClass(userBtn,"add_userinfo_btn"))
						{
							DOM.removeClass(userBtn,"add_userinfo_btn");
						}
					}
					else
					{
						var userBtn = DOM.query(".userinfo_btn")[0];
						userBtn.innerHTML = "<img src='http://img02.taobaocdn.com/imgextra/i2/1661536580/T2UDMFXdJaXXXXXXXX_!!1661536580.jpg'>";
						if(!DOM.hasClass(userBtn,"add_userinfo_btn"))
						{
							DOM.addClass(userBtn,"add_userinfo_btn");
						}
					}
					return true;
				}
			},
          	error: function()
			{
			dialog("请求错误，请重试！");
			return false;
          	},
     	 });
}

/*tab2 */
function getExchange()
{
	//console.log("get exchange");
	KISSY.io(
		{         
         	jsonp: "callback" , 
          	url: "/d/user?action=exPro",
          	data: {"token":1},
		dataType:"jsonp",
            success: function(data)
			{
				if(data.result==0)
				{
						dialog(data.pros);
						return false;
				}
				if(data.result==1)
				{
					var pros = data.pros;
					
					var proLen = pros.length;
					var proStr = "";
					for(var i=0;i<proLen;i++)
					{
						var p = pros[i];
						
						proStr +="<div class='hei_pica' style='height:290px;margin-left:5px;margin-top:10px;'><div class='bigmg_a'><a href='http://item.taobao.com/item.htm?id=";
						proStr +=p.iid;
						proStr +="'><img src='";
						proStr +=p.pic;
						proStr +="'></a></div><div class='bigmg_b'><span class='bigmg_bl'>";
						proStr +=p.title;
						proStr +="</span><span class='bigmg_br' style='padding-top:3px;'>";
						proStr +=p.num;
						proStr +="件</span></div><div class='bigmg_c'><span class='bigmg_bl'>￥<i>";
						proStr +=p.nprice;
						proStr +="</i>&nbsp;<b>￥";
						proStr +=p.oprice;
						proStr +="</b></span><span class='bigmg_br zhzu'><a href='#' class='do_exchange' title='";
						proStr +=p.id;
						proStr +="'><img src='http://img01.taobaocdn.com/imgextra/i1/1661536580/T2BPkFXcdaXXXXXXXX_!!1661536580.png'>";
						proStr +=p.points;
						proStr +="</a></span></div></div>";
					}
					DOM.query(".exchange_pros")[0].innerHTML = proStr;
					setExchange();
					return true;
				}
			},
          	error: function()
			{
				dialog("请求错误，请重试！");
          	},
     	 });

}

function setExchange()
{
//exchange product
var exchange = DOM.query(".do_exchange");
var exlen=exchange.length;
var id;
for(var i=0;i<exlen;i++)
{
	
	exchange[i].onclick = function()
	{
		id = this.getAttribute("title");
		KISSY.io(
		{         
         	jsonp: "callback" , 
          	url: "/d/user?action=exchange",
          	data: {"id":id},
		dataType:"jsonp",
            	success: function(data)
			{
				if(data.result==0)
				{
					DOM.query(".ex_fail_box")[0].style.display = "block";
					return false;
				}
				if(data.result==1)
				{
					DOM.query(".ex_success_box")[0].style.display = "block";
					return true;
				}
				if(data.result==2)
				{
					DOM.query(".ex_noinfo_box")[0].style.display = "block";
					return false;
				}
				if(data.result==3)
				{
					dialog(data.info);
					return false;
				}
			},
          	error: function()
			{
				dialog("请求错误，请重试！");
          		},
     	 	});

	};
}
}

Event.on(DOM.query(".fail-box-close")[0],"click",function(){DOM.query(".ex_fail_box")[0].style.display = "none";});
Event.on(DOM.query(".success-box-close")[0],"click",function(){DOM.query(".ex_success_box")[0].style.display = "none";});
Event.on(DOM.query(".noinfo-box-close")[0],"click",function(){DOM.query(".ex_noinfo_box")[0].style.display = "none";});
Event.on(DOM.query(".fail-box-close")[1],"click",function(){DOM.query(".ex_fail_box")[0].style.display = "none";});
Event.on(DOM.query(".success-box-close")[1],"click",function(){DOM.query(".ex_success_box")[0].style.display = "none";});
Event.on(DOM.query(".noinfo-box-close")[1],"click",function(){DOM.query(".ex_noinfo_box")[0].style.display = "none";});

/*tab 3*/
var userQQ = DOM.query('.user_qq')[0];
	userQQ.onkeyup = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	userQQ.onpaste = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	userQQ.ondblclick=function () {this.value='';};
var userPhone = DOM.query(".user_phone")[0];
 	userPhone.onkeyup = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	userPhone.onpaste = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	userPhone.ondblclick=function () {this.value='';};

Event.on(DOM.query(".user_info_submit")[0],"click",function()
	{
		var username = DOM.query(".user_name")[0].value;
		var realname = DOM.query(".user_real")[0].value;
		var qq = userQQ.value;
		var phone = userPhone.value;
		var email = DOM.query(".user_email")[0].value;
		var address = DOM.query(".user_address")[0].value;
		
		KISSY.io(
		{         
         	jsonp: "callback" , 
          	url: "/d/user?action=saveUser",
          	data: {"realname":realname,"qq":qq,"phone":phone,"email":email,"address":address},
			dataType:"jsonp",
            success: function(data)
			{
				if(data.result==0)
				{
						dialog(data.info);
						return false;
				}
				if(data.result==1)
				{
						dialog(data.info);
						return true;
				}
			},
          	error: function()
			{
				dialog("请求错误，请重试！");
          	},
     	 });
	});

function getUser()
{
	KISSY.io(
		{         
         	jsonp: "callback" , 
          	url: "/d/user?action=getUserInfo",
          	data: {"data":1},
			dataType:"jsonp",
            success: function(data)
			{
				if(data.result==0)
				{
						dialog(data.user);
						return false;
				}
				if(data.result==1)
				{
					var userInfo = data.user;
				      
					if(userInfo != false)
					{
					DOM.query(".user_real")[0].value = userInfo.realname;
					userQQ.value = userInfo.qq;
					userPhone.value = userInfo.phone;
					DOM.query(".user_email")[0].value = userInfo.email;
					DOM.query(".user_address")[0].value = userInfo.address;
					}
					return true;
				}
			},
          	error: function()
			{
			dialog("请求错误，请重试！");
			return false;
          	},
     	 });
}

/*tab 4 */
function getEvent(page)
{
	KISSY.io(
		{         
         	jsonp: "callback" , 
          	url: "/d/user?action=his",
          	data: {"page":page},
			dataType:"jsonp",
            success: function(data)
			{
				if(data.result==0)
				{
						dialog(data.info);
						return false;
				}
				if(data.result==1)
				{
					var events = data.events;
					var eventLen = events.length;
					var eventStr = "";
					for(var i=0;i<eventLen;i++)
					{
						eventStr += "<tr><td height='34' width='15%' align='center' valign='middle' bgcolor='#F7F7F7' class='putgd'>";
						eventStr += events[i].time;
						eventStr += "</td><td height='34' width='75%' align='center' valign='middle' bgcolor='#F7F7F7' class='putgd'>";
						eventStr += events[i].description;
						eventStr += "</td><td height='34' width='10%' align='left' valign='middle' bgcolor='#F7F7F7' class='putgd'><a class='event_del' title='";
						eventStr += events[i].id;
						
						eventStr += "'><img src='http://img03.taobaocdn.com/imgextra/i3/1661536580/T2WpZHXepXXXXXXXXX_!!1661536580.jpg'></a></td></tr>";
					}

					DOM.query(".event_list_table")[0].innerHTML = eventStr;
					setEvent();
					return true;
				}
			},
          	error: function()
			{
			dialog("请求错误，请重试！");
          	},
     	 });

}

function setEvent()
{
	//exchange product
var eventdels = DOM.query(".event_del");
var eventlen=eventdels.length;
var id;
for(var i=0;i<eventlen;i++)
{
	
	eventdels[i].onclick = function()
	{
		var self = this;
		id = self.getAttribute("title");
		KISSY.io(
		{         
         	jsonp: "callback" , 
          	url: "/d/user?action=eventDel",
          	data: {"id":id},
		dataType:"jsonp",
            	success: function(data)
			{
				if(data.result==0)
				{
					dialog(data.info);
					DOM.query(".event_list_table")[0].innerHTML="";
					return false;
				}
				if(data.result==1)
				{
					dialog(data.info);
					console.log(self.parentNode.parentNode);
					self.parentNode.parentNode.parentNode.removeChild(self.parentNode.parentNode);
					return true;
				}
			},
          	error: function()
			{
				dialog("请求错误，请重试！");
          		},
     	 	});

	};
}

}
/*   */
function dialog(text)
{
	DOM.query(".alert_info")[0].innerHTML = text;
	DOM.query(".alert_box")[0].style.display="block";
	
	setTimeout(function(){DOM.query(".alert_box")[0].style.display="none";},800);
}

var loadingFrame = DOM.query(".loading_frame")[0];
for(var i=0;i<4;i++)
{
	Event.on(tabs[i],"click",function()
	{
	   for(var j=0;j<4;j++)
	   {
	      var con=DOM.query(".con_tab_"+j)[0];
 	      con.style.display="none";
	   }
	   var id = DOM.attr(this,"data-id");
	   console.log(id);
	   $(".tab").removeClass("yanse_a");
	   DOM.addClass(this,"yanse_a");
	   loadingFrame.style.display="block";
	   switch(id)
	   {
		case "0":
			checkUser();
			break;
		case "1":
			getExchange();
			break;
		case "2":
			getUser();
			break;
		case "3":
			getEvent(1);
			break;
	   }
	   setTimeout(function(){
	   loadingFrame.style.display="none";
	   DOM.query(".con_tab_"+id)[0].style.display="block";
	   },500);
	 });

}

Event.on(DOM.query(".add_userinfo_btn")[0],"click",function(){
	Event.fire(tabs[2],"click");
	});
Event.on(DOM.query(".event_clear")[0],"click",function(){
	KISSY.io(
		{         
         	jsonp: "callback" , 
          	url: "/d/user?action=eventDel",
          	data: {"token":1},
		dataType:"jsonp",
            	success: function(data)
			{
				if(data.result==0)
				{
					dialog(data.info);
					return false;
				}
				if(data.result==1)
				{
					dialog(data.info);
					DOM.query(".event_list_table")[0].innerHTML="";
					return true;
				}
			},
          	error: function()
			{
				dialog("请求错误，请重试！");
          		},
     	 	});
	});

setExchange();
setEvent();

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
						DOM.query(".pearl-num")[0].innerHTML=parseInt(DOM.query(".pearl-num")[0].innerHTML)+data.pearl;
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

/*
http://t.taobao.com/cooperate/publish_favor.do?favor_type=1100036&favor_target_key=380884536_100001236&favor_sub_type=1&favor_app_id&comment=%23%E6%B7%98%E5%AE%9DU%E7%AB%99%23%E6%88%91%E5%88%9A%E5%88%9A%E5%9C%A8%E6%B7%98%E5%AE%9D%E4%B8%8A%E5%8F%91%E7%8E%B0%E4%B8%80%E4%B8%AA%E5%BE%88%E4%B8%8D%E9%94%99%E7%9A%84U%E7%AB%99-%E3%80%90%E5%AE%B6%E4%B9%A1%E5%91%B3%E3%80%91%EF%BC%8C%E6%B7%98%E5%AE%9D%E7%9A%84%E6%83%85%E6%84%9F%E5%91%B3%E6%9D%A5%E4%BA%86%EF%BC%8C%E4%BD%A0%E4%B9%9F%E6%9D%A5%E7%9C%8B%E7%9C%8B%E3%80%82&pic=http%3A%2F%2Fimg4.tbcdn.cn%2Ftfscom%2Fi1%2F14536024833857839%2FT2t73yXjBXXXXXXXXX_!!380884536-0-dgshop.jpg&client_id=170193&type=webpage&title=%E5%AE%B6%E4%B9%A1%E5%91%B3&key=http%3A%2F%2Fjiaxiangwei.uz.taobao.com%2F&_tb_token_=5b01ysITbKm&_ksTS=1375161325153_273&callback=jsonp274&_input_charset=utf-8&t=1375161325104
*/
