var $ = KISSY.DOM.query;
var DOM = KISSY.DOM;
var Event = KISSY.Event;
var Anim=KISSY.Anim;
	
	Event.on($('.link_post')[0],"click",function()
	{
		var t=['uz_link','uz_type','uz_mini_logo','uz_big_logo','uz_wangwang'];
		var n=['站点链接','站点类型','小图链接','大图链接','站长旺旺'];
		
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
		var uzurl = /^http:\/\/.*\.uz\.taobao\.com/i;
		if(!uzurl.test($(".uz_link")[0].value))
		{
			dialog("站点链接不符合要求！");
			return false;
		}
		var urlReg = /^http:\/\//i;
		if(!urlReg.test($(".uz_mini_logo")[0].value)||!urlReg.test($(".uz_mini_logo")[0].value))
		{
			dialog("图片链接不符合要求！");
			return false;
		}
		KISSY.io(
			{         
         		jsonp: "callback" , 
          		url: "/d/link?action=add",
          		data: {"link":proinfo[0],"type":proinfo[1],"mini_logo":proinfo[2],"big_logo":proinfo[3],"wangwang":proinfo[4]}, 
            		success: function(data)
				{
					if(data.result==0)
					{
						dialog(data.info);
						return false;
					}
					else if(data.result==2)
					{
						dialog(data.info);
						for(var i in t)
						{
							$("."+t[i])[0].value="";
						}
						DOM.query(".yourlink")[0].innerHTML=data.link;
						DOM.query(".addus_03")[0].style.display="none";
						DOM.query(".link-result")[0].style.display="block";
						//Event.fire(DOM.query(".refresh-click")[0],"click");
						return true;
					}
					else if(data.result==1)
					{
						//dialog(data.info);
						for(var i in t)
						{
							$("."+t[i])[0].value="";
						}
						DOM.query(".yourlink")[0].innerHTML=data.link;
						DOM.query(".addus_03")[0].style.display="none";
						DOM.query(".link-result")[0].style.display="block";
						//Event.fire(DOM.query(".refresh-click")[0],"click");
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

