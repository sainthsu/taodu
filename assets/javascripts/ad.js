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
			if(confirm('ȷ��ɾ��������¼��ɾ���󲻿ɻָ���'))
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
					alert("������������ԣ�");
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
			alert("�����ʲ���Ϊ�գ�");
		}
		else
		{
			window.location = "/d/admin/pro?q="+keywords;
		}
	});

