var $ = KISSY.DOM.query;
var DOM = KISSY.DOM;
var Event = KISSY.Event;
var Anim=KISSY.Anim;

	$('.spage')[0].onkeyup = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	$('.spage')[0].onpaste = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	$('.spage')[0].ondblclick=function () {this.value='';};
	$('.epage')[0].onkeyup = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	$('.epage')[0].onpaste = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	$('.epage')[0].ondblclick=function () {this.value='';};
	$('.page-size')[0].onkeyup = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	$('.page-size')[0].onpaste = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	$('.page-size')[0].ondblclick=function () {this.value='';};

Event.on($(".publish")[0],"click",function()
	{
		KISSY.io(
			{         
         		jsonp: "callback" , 
          		url: "/d/admin/pro?cmd=publish",
          		data: {"id":0}, 
            	success: function(data)
				{
					console.log(data);
					if(data.result==1)
					{
						alert("success!!!");
					}
					else if(data.result==0)
					{
						alert("error!!!");
					}
				},
          		error: function()
				{
					alert("������������ԣ�");

          		},
				dataType:"jsonp",
     	    });
	
	});
/*
	Event.on($(".submit-btn")[0],"click",function()
	{
		var t=['startc','endc','spage','epage','q-input'];
		var n=['�ۿ�����','�ۿ�����','��ʼҳ��','����ҳ��','�ؼ���'];
		var array=[];
		for(var i in t)
		{
			if(!array[i] = $("."+t[i])[0].value)
			{
				alert(n[i]+"����Ϊ��");
				return false;
			}
		}

		var catInput = $('.cat-input')[0].value;
		var cat = $('.cat')[0].value;
		var cidInput = $('.cat-input')[0].value;
		var cid = $('.cat')[0].value;
		var pagesize = $('.page-size')[0].value;

		KISSY.io(
			{         
         		jsonp: "callback" , 
          		url: "/d/admin/pro?cmd=info",
          		data: {"id":id}, 
            	success: function(data)
				{
					console.log(data);
					if(data.result==1)
					{

					}
					else if(data.result==0)
					{
						alert(data.info);
					}
				},
          		error: function()
				{
					alert("������������ԣ�");
          		},
				dataType:"jsonp",
     	    });
	
	});
*/

	Event.on($(".searchBtn")[0],"click",function()
	{
		var keywords = $(".keywords")[0].value;
		if(!keywords)
		{
			alert("�����ʲ���Ϊ�գ�");
		}
	});

