var $ = KISSY.DOM.query;
var DOM = KISSY.DOM;
var Event = KISSY.Event;
var Anim=KISSY.Anim;



	var addel=$(".ad_del");
	for(var i=0;i<addel.length;i++)
	{
		addel[i].onclick= function ()
		{
			var id = this.getAttribute("name");
			if(confirm('确认删除该条记录？删除后不可恢复！'))
			{
				KISSY.io(
				{         
         		jsonp: "callback" , 
          		url: "/d/admin/ad?cmd=del",
          		data: {"id":id}, 
            	success: function(data)
				{
					alert(data.result);
					window.location.reload();
				},
          		error: function()
				{
					alert("请求错误，请重试！");
          		},
            	dataType:"jsonp",
     	    	});
			}
		};
	}

	Event.on($(".searchBtn")[0],"click",function()
	{
		var keywords = $(".keywords")[0].value;
		if(!keywords)
		{
			alert("搜索词不能为空！");
		}
		else
		{
			window.location = "/d/admin/pro?q="+keywords;
		}
	});

