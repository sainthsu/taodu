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
			alert('û��ѡ���κμ�¼');
			return false;
		}

		ids=ids.substring(1);
	
		//if(confirm("��ȷ����ID��Ϊ"+ids+"�ļ�¼ɾ����ɾ���󽫲��ɻָ�!"))
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
					alert("������������ԣ�");
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
			alert("�����ʲ���Ϊ�գ�");
		}
	});


