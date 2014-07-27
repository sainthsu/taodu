var $ = KISSY.all; 
var DOM = KISSY.DOM;
var Event = KISSY.Event;
var Anim = KISSY.Anim ;

var oneimga = DOM.query(".meiimga");
var leftCursor = DOM.query(".meil_img");
var rightCursor = DOM.query(".meir_img");
var len = oneimga.length;

var rightmove;
var leftmove;

for(var j=0;j<len;j++)
{
	
	Event.on(oneimga[j],"mouseenter",function(e)
	{
		var i = oneimga.indexOf(this);
		leftCursor[i].style.display="block";
		rightCursor[i].style.display="block";
	});
	Event.on(leftCursor[j],"mouseenter",function(e)
	{
		var i = leftCursor.indexOf(this);
		leftCursor[i].style.display="block";
		rightCursor[i].style.display="block";
	});
	Event.on(rightCursor[j],"mouseenter",function(e)
	{
		var i = rightCursor.indexOf(this);
		leftCursor[i].style.display="block";
		rightCursor[i].style.display="block";
	});
	Event.on(oneimga[j],"mouseleave",function(e)
	{
		var i = oneimga.indexOf(this);
		leftCursor[i].style.display="none";
		rightCursor[i].style.display="none";
	});

	Event.on(rightCursor[j],"click",function(e)
	{
		var i = rightCursor.indexOf(this);
		clearInterval(rightmove);
		rightmove= setInterval(function(){moveRight(i)},0.1);
	});

	Event.on(leftCursor[j],"click",function(e)
	{	
		var i = leftCursor.indexOf(this);
		clearInterval(leftmove);
		leftmove = setInterval(function(){moveLeft(i)},0.1);
		console.log("ccc");
	});

}

function moveLeft(i)
{
	if(oneimga[i].scrollLeft==1400)
	{
		oneimga[i].scrollLeft = 0;
	}
	oneimga[i].scrollLeft +=10;
	if(oneimga[i].scrollLeft==700||oneimga[i].scrollLeft==1400)
	{
		clearInterval(leftmove);
	}
}
function moveRight(i)
	{
		if(oneimga[i].scrollLeft==0)
		{
			oneimga[i].scrollLeft = 1400;
		}
		oneimga[i].scrollLeft -=10;
		if(oneimga[i].scrollLeft==0||oneimga[i].scrollLeft==700)
		{
			clearInterval(rightmove);
		}
	}

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
	DOM.query(".now-date")[0].innerHTML = yearNow+"��"+monthNow+"��";
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
	{KISSY.io(
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
					dialog("������������ԣ�");
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
