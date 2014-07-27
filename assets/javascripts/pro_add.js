var $ = KISSY.DOM.query;
var DOM = KISSY.DOM;
var Event = KISSY.Event;
var Anim=KISSY.Anim;
	
	Event.on($('.pro_post')[0],"submit",function()
	{
		var t=['pro_title','pro_st','pro_et','pro_oprice','pro_nprice','pro_link','pro_volume'];
		var n=['标题','开始日期','结束日期','原价','当前价','链接','已售数量'];
		for(var i in t)
		{
			if(!$("."+t[i])[0].value)
			{
				alert(n[i]+"不能为空");
				return false;
			}
		}
		if(!$('.pro_pic')[0].value){alert('商品图片不能为空');return false;}
		if(!$('.pro_id')[0].value){alert('宝贝ID不能为空');return false;}
	});

	
	$('.pro_id')[0].onkeyup = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	$('.pro_id')[0].onpaste = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	$('.pro_id')[0].ondblclick=function () {this.value='';};

	$('.pro_num')[0].onkeyup = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	$('.pro_rank')[0].onkeyup = function () {this.value=this.value.replace(/[^\d]/gi,'');};
	
	Event.on($('.pro_oprice')[0],"keyup",function (event)
	{
	var e=event;
	if(e&&e.keyCode!=8&&e.keyCode!=39&&e.keyCode!=37)
	{ //不是按后退、右、左键
		//先把非数字的都替换掉，除了数字和.
		this.value = this.value.replace(/[^\d.]/g,"");
		//必须保证第一个为数字而不是.
		this.value = this.value.replace(/^\./g,"");
		//保证只有出现一个.而没有多个.
		this.value = this.value.replace(/\.{2,}/g,".");
		//保证.只出现一次，而不能出现两次以上
		obj.value = this.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
		//四舍五入到 2 位
		if(this.value.indexOf('.')!=-1){if(e.keyCode!=190) this.value = parseFloat(this.value).toFixed(2);}
	}
	});
	
	Event.on($('.pro_nprice')[0],"keyup",function (event)
	{
	var e=event;
	if(e&&e.keyCode!=8&&e.keyCode!=39&&e.keyCode!=37)
	{ //不是按后退、右、左键
		//先把非数字的都替换掉，除了数字和.
		this.value = this.value.replace(/[^\d.]/g,"");
		//必须保证第一个为数字而不是.
		this.value = this.value.replace(/^\./g,"");
		//保证只有出现一个.而没有多个.
		this.value = this.value.replace(/\.{2,}/g,".");
		//保证.只出现一次，而不能出现两次以上
		obj.value = this.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
		//四舍五入到 2 位
		if(this.value.indexOf('.')!=-1){if(e.keyCode!=190) this.value = parseFloat(this.value).toFixed(2);}
	}
	});
	
	Event.on($('.pro_oprice')[0],"paste",function (event)
	{
	var e=event;
	if(e&&e.keyCode!=8&&e.keyCode!=39&&e.keyCode!=37)
	{ //不是按后退、右、左键
		//先把非数字的都替换掉，除了数字和.
		this.value = this.value.replace(/[^\d.]/g,"");
		//必须保证第一个为数字而不是.
		this.value = this.value.replace(/^\./g,"");
		//保证只有出现一个.而没有多个.
		this.value = this.value.replace(/\.{2,}/g,".");
		//保证.只出现一次，而不能出现两次以上
		obj.value = this.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
		//四舍五入到 2 位
		if(this.value.indexOf('.')!=-1){if(e.keyCode!=190) this.value = parseFloat(this.value).toFixed(2);}
	}
	});
	
	Event.on($('.pro_nprice')[0],"paste",function (event)
	{
	var e=event;
	if(e&&e.keyCode!=8&&e.keyCode!=39&&e.keyCode!=37)
	{ //不是按后退、右、左键
		//先把非数字的都替换掉，除了数字和.
		this.value = this.value.replace(/[^\d.]/g,"");
		//必须保证第一个为数字而不是.
		this.value = this.value.replace(/^\./g,"");
		//保证只有出现一个.而没有多个.
		this.value = this.value.replace(/\.{2,}/g,".");
		//保证.只出现一次，而不能出现两次以上
		obj.value = this.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
		//四舍五入到 2 位
		if(this.value.indexOf('.')!=-1){if(e.keyCode!=190) this.value = parseFloat(this.value).toFixed(2);}
	}
	});
	
	Event.on($(".getProInfo")[0],"click",function()
	{
		var id = $('.pro_id')[0].value;
		KISSY.io(
			{         
         		jsonp: "callback" , 
          		url: "/d/admin/pro?cmd=info",
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
						$(".pro_seller_nick")[0].value = item.seller_nick;
						$(".pro_link")[0].value = item.link ;
						$(".pro_volume")[0].value = item.volume ;
					}
					else if(data[0].result==0)
					{
						alert("该商品未参加淘客！");
					}
				},
          		error: function()
				{
					alert("请求错误，请重试！");
          		},
				dataType:"jsonp",
     	    });
	
	});


	Event.on($(".searchBtn")[0],"click",function()
	{
		var keywords = $(".keywords")[0].value;
		if(!keywords)
		{
			alert("搜索词不能为空！");
		}
	});


