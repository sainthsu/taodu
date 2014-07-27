var $ = KISSY.DOM.query;
var DOM = KISSY.DOM;
var Event = KISSY.Event;
var Anim=KISSY.Anim;
	
/*index*/

	var prosel = $(".pro_selected");
	for(var i=0;i<prosel.length;i++)
	{
		prosel[i].onclick = function()
		{
			if(this.getAttribute("checked"))
			{
				this.removeAttribute("checked");
			}
			else
			{
				this.setAttribute("checked","checked");
			}
		}
	}

	Event.on($(".selall")[0],"click",function()
	{
		var prosel = $(".pro_selected");
		for(var i=0;i<prosel.length;i++)
		{
			if(prosel[i].getAttribute("checked"))
			{
				prosel[i].removeAttribute("checked");
			}
			else
			{
				prosel[i].setAttribute("checked","checked");
			}
		}
	});

	Event.on($(".pro_act")[0],"click",function()
	{
		var ids='';
		var prosel = $(".pro_selected");
		for(var i=0;i<prosel.length;i++)
		{
			if(prosel[i].getAttribute("checked"))
			{
				ids+=','+prosel[i].value;
			}
		}

		if(ids=='')
		{
			alert('没有选择任何记录');
			return false;
		}

		ids=ids.substring(1);
	
		//if(confirm("您确定将ID号为"+ids+"的记录删除？删除后将不可恢复!"))
		//{
			KISSY.io(

				{         
         		jsonp: "callback" , 
          		url: "/d/admin/pro?cmd=del",
          		data: {"id":ids}, 
            	success: function(data)
				{
					alert(data.result);
				},
          		error: function()
				{
					alert("请求错误，请重试！");
          		},
            	dataType:"jsonp",
     	    	});
		//}
	
	});

	Event.on($(".searchBtn")[0],"click",function()
	{
		var keywords = $(".keywords")[0].value;
		if(!keywords)
		{
			alert("搜索词不能为空！");
		}
	});


