var $ = KISSY.DOM.query;
var DOM = KISSY.DOM;
var Event = KISSY.Event;
var Anim=KISSY.Anim;

	$('.pro_id')[0].onkeyup = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	$('.pro_id')[0].onpaste = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	$('.pro_id')[0].ondblclick=function () {this.value='';};
	
	Event.on($('.pro_oprice')[0],"keyup",function (event)
	{
	var e=event;
	if(e&&e.keyCode!=8&&e.keyCode!=39&&e.keyCode!=37)
	{ 
		this.value = this.value.replace(/[^\d.]/g,"");
		
		this.value = this.value.replace(/^\./g,"");
		
		this.value = this.value.replace(/\.{2,}/g,".");
		
		obj.value = this.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");

		if(this.value.indexOf('.')!=-1){if(e.keyCode!=190) this.value = parseFloat(this.value).toFixed(2);}
	}
	});
	
	Event.on($('.pro_nprice')[0],"keyup",function (event)
	{
	var e=event;
	if(e&&e.keyCode!=8&&e.keyCode!=39&&e.keyCode!=37)
	{ 
		this.value = this.value.replace(/[^\d.]/g,"");
		
		this.value = this.value.replace(/^\./g,"");
		
		this.value = this.value.replace(/\.{2,}/g,".");
		
		obj.value = this.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
		
		if(this.value.indexOf('.')!=-1){if(e.keyCode!=190) this.value = parseFloat(this.value).toFixed(2);}
	}
	});
	
	Event.on($('.pro_oprice')[0],"paste",function (event)
	{
	var e=event;
	if(e&&e.keyCode!=8&&e.keyCode!=39&&e.keyCode!=37)
	{ 
		this.value = this.value.replace(/[^\d.]/g,"");
		
		this.value = this.value.replace(/^\./g,"");
		
		this.value = this.value.replace(/\.{2,}/g,".");
		
		obj.value = this.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
		
		if(this.value.indexOf('.')!=-1){if(e.keyCode!=190) this.value = parseFloat(this.value).toFixed(2);}
	}
	});
	
	Event.on($('.pro_nprice')[0],"paste",function (event)
	{
	var e=event;
	if(e&&e.keyCode!=8&&e.keyCode!=39&&e.keyCode!=37)
	{
		this.value = this.value.replace(/[^\d.]/g,"");
		
		this.value = this.value.replace(/^\./g,"");
		
		this.value = this.value.replace(/\.{2,}/g,".");
		
		obj.value = this.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
		
		if(this.value.indexOf('.')!=-1){if(e.keyCode!=190) this.value = parseFloat(this.value).toFixed(2);}
	}
	});
	
	Event.on($(".getProInfo")[0],"click",function()
	{
		var id = $('.pro_id')[0].value;
		if(id=="")
		{
			dialog("商品id不能为空！");
			return false;
		}
		
		KISSY.io(
			{         
         		jsonp: "callback" , 
          		url: "/d/index?action=info",
          		data: {"id":id}, 
            	success: function(data)
				{
					console.log(data);
					if(data[0].result==1)
					{
						var item = data[1].item;
						$(".pro_title")[0].value = item.title ;
						$(".pro_pic")[0].value = item.pic ;
						$(".pro_oprice")[0].value = item.oprice ;
						$(".pro_nprice")[0].value = item.nprice ;
						$(".pro_shop")[0].value = item.nick ;
					}
					else if(data[0].result==0)
					{
						dialog("该商品未参加淘客！");
					}
				},
          		error: function()
				{
					dialog("请求错误，请重试！");
          		},
				dataType:"jsonp",
     	    });
	
	});

	Event.on($('.pro_post')[0],"click",function()
	{
		var t=['pro_id','pro_title','pro_shop','pro_reason','pro_oprice','pro_nprice','pro_pic','pro_num'];
		var n=['宝贝ID','标题','商家旺旺','申请说明','原价','当前价','商品图片','商品数量'];
		
		var proinfo = new Array();
		for(var i in t)
		{
			proinfo[i]=$("."+t[i])[0].value;
			if(!proinfo[i])
			{
				dialog(n[i]+"不能为空");
				return false;
			}
		}
		if($(".pro_title")[0].value.length>15)
		{
			dialog("商品标题超过限制！");
			return false;
		}
		KISSY.io(
			{         
         		jsonp: "callback" , 
          		url: "/d/index?action=addus",
          		data: {"id":proinfo[0],"title":proinfo[1],"shop":proinfo[2],"reason":proinfo[3],"oprice":proinfo[4],"nprice":proinfo[5],"pic":proinfo[6],"num":proinfo[7],"cmd":3,"cat":$(".pro_cat")[0].value,"type":$(".pro_type")[0].value}, 
            		success: function(data)
				{
					if(data.result==0||data.result==2)
					{
						dialog(data.info);
						return false;
					}
					if(data.result==1)
					{
						dialog(data.info);
						for(var i in t)
						{
							$("."+t[i])[0].value="";
						}
						Event.fire(DOM.query(".refresh-click")[0],"click");
						return true;
					}
				},
          		error: function()
				{
					dialog("请求错误，请重试！");
          			},
            		dataType:"jsonp",
     	    	});
	});

	Event.on($('.proSearch')[0],"click",function()
	{
		var id = $('.pro_id')[0].value;
		if(id=="")
		{
			dialog("商品id不能为空！");
			return false;
		}
		
		KISSY.io(
			{         
         		jsonp: "callback" , 
          		url: "/d/index?action=addus",
          		data: {"id":id,"cmd":2}, 
            	success: function(data)
				{
					console.log(data);
					dialog(data.info);
				},
          		error: function()
				{
					dialog("请求错误，请重试！");
          		},
			dataType:"jsonp",
     	    });
	
	});
	//$(".clear-signs").[0];

function setSign()
{
	//exchange product
var signdels = DOM.query(".sign-del");

var signlen=signdels.length;
var id;
for(var i=0;i<signlen;i++)
{
	
	signdels[i].onclick = function()
	{
		var self = this;
		id = self.getAttribute("title");
		KISSY.io(
		{         
         	jsonp: "callback" , 
          	url: "/d/user?action=del",
          	data: {"id":id},
		dataType:"jsonp",
            	success: function(data)
			{
				if(data.result==0)
				{
					dialog("删除失败！");
					return false;
				}
				if(data.result==1)
				{
					dialog("删除成功！");
					//console.log(self.parentNode.parentNode);
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
function setMod()
{
var signmods = DOM.query(".sign-mod");

var modlen=signmods.length;
for(var i=0;i<modlen;i++)
{
	
	signmods[i].onclick = function()
	{
		console.log("clicked");
		var self = this;
		var id = self.getAttribute("title");
		KISSY.io(
		{         
         	jsonp: "callback" , 
          	url: "/d/user?action=getPro",
          	data: {"id":id},
		dataType:"jsonp",
            	success: function(data)
			{
				if(data.result==0)
				{
					dialog("商品获取失败！");
					return false;
				}
				if(data.result==1)
				{
					var pro = data.pro;
					var t=['pro_id','pro_title','pro_shop','pro_reason','pro_oprice','pro_nprice','pro_pic'];
		
					$("."+t[0])[0].value = pro.iid;
					$("."+t[1])[0].value = pro.title;
					$("."+t[2])[0].value = pro.seller_nick;
					$("."+t[3])[0].value = pro.reason;
					$("."+t[4])[0].value = pro.oprice;
					$("."+t[5])[0].value = pro.nprice;
					$("."+t[6])[0].value = pro.pic;
					$(".pro_num")[0].value = pro.num;
					$(".pro_cat")[0].selectedIndex = pro.cat-1;
					$(".pro_type")[0].selectedIndex = pro.type-1;
					
					DOM.query(".addus_04")[0].style.display="none";
					DOM.query(".addus_03")[0].style.display="block";
					
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
setSign();
setMod();
Event.on(DOM.query(".clear-signs")[0],"click",function(){
		KISSY.io(
		{         
         	jsonp: "callback" , 
          	url: "/d/user?action=delAll",
          	data: {"token":1},
		dataType:"jsonp",
            	success: function(data)
			{
				if(data.result==0)
				{
					dialog("删除失败！");
					return false;
				}
				if(data.result==1)
				{
					dialog("删除成功！");
					DOM.query(".sign-table")[0].innerHTML="";
					return true;
				}
			},
          	error: function()
			{
				dialog("请求错误，请重试！");
          		},
     	 	});

});

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

