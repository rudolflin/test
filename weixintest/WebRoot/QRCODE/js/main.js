$(function(){
/*	$("#xy1").bind("click",function(){
		$(this).attr("src","img/x3.jpg");
	});*/
	
	var abc;
	$("#phone1").css("top",(215/627)*$(window).height());
	$("#phone2").css("top",(215/627)*$(window).height());
	$("#phone3").css("top",(400/627)*$(window).height());
	$("#phone4").css("top",(400/627)*$(window).height());
	$("#bangding").css("top",(410/627)*$(window).height());
	$(".qd1").css("top",(310/627)*$(window).height());
//	$(".qd").css("top",(310/627)*$(window).height());
//	$(".qd3").css("top",(310/627)*$(window).height());
	$(".rule").bind("click",function(){
		//window.location.href="hdgz.html";
	});
//	var type=getParameter("type");//从url中获得
	//type=3;
	console.log("type="+type);
	var subscribe=0,isBind=0,tel;
	var count=0,leftWobei,isSpeed=0;//已经盛开了几朵,剩余沃贝数量
	var lingqu=false,hasICollect=false;
	var hasBloomed=0;//朋友是否为本人盛开过
	if(type==1){//首页
		$("#index1").show();$("#index2").hide();$("#index3").hide();
		$("#bg_page1").show();$("#bg_page2").hide();
		$(".rule").css("position","fixed");
		$.ajax({//baoliu
			url : "../duanwu",
			async : false,
			type:"POST",
			dataType : "json",
			data : {
				"openId" : openId,
				"typeStr" : "getInfo"
			},
			success : function(data) {
				if (data.datastate == 0) {
					subscribe=data.subscribe;
					isBind=data.isBind;
					tel=data.tel;
					count=data.count;
					lingqu=data.lingqu;
				}
			},
			error : function() {
				//alert("error1");
			}
		});
		
		$("#bloom3").bind("click",function(){
	///////////////////////////////9ci/////////////////////////////////////////		
			if(count<9){
				alert("集齐9张拼图才能查看我的奖励");
			}else{
				$("#box11").show();
				if(lingqu==true){
					$("#queding5").show();$("#queding4").hide();
				}else{
					$("#queding4").show();$("#queding5").hide();
					$("#queding4").one("click",function(){//点击领取按钮
						if(isBind=="0"){//未绑定
							$("#box11").hide();
							$("#box3").show();
						}else if(isBind=="1"){//已绑定
							//调用领取的ajax
							$.ajax({//baoliu
								url : "../duanwu",
								async : false,
								type:"POST",
								dataType : "json",
								data : {
									"openId" : openId,
									"typeStr" : "lingqu"
								},
								success : function(data) {
									if (data.datastate == 0) {//表示领取成功
										$("#box11").hide();
										$("#tel").text(tel);
										$("#box12").show();
										lingqu=true;
									}else{
										alert("领取失败");
									}
								},
								error : function() {
									//alert("error1");
								}
							});
						}
					});
				}
				
			}
		});
		$("#bloom2").bind("click",function(){
			window.location.href="index.jsp?type=2&openId="+openId;
		});
	}else if(type==2){//个人页
		$("#index2").show();$("#index1").hide();$("#index3").hide();
		$("#bg_page2").show();$("#bg_page1").hide();
		$(".rule").css("position","absolute");
		$.ajax({//baoliu
			url : "../duanwu",
			async : false,
			type:"POST",
			dataType : "json",
			data : {
				"openId" : openId,
				"typeStr" : "getInfo"
			},
			success : function(data) {
				if (data.datastate == 0){
					if(data.friend.length==0){
						$(".rule").css("position","fixed");
						//alert("空");
					}else{
						$(".rule").css("position","absolute");
					    for(var i=0;i<data.friend.length;i++){
					    	te="<div class='Grid'>"+
				    		"<div class='Grid-cell'><img width='100%' src='"+data.friend[i].head+"' style='border-radius:50%' class='touxiang' id='head'></div>"+
				    		"<div class='Grid-cell name'><span id='name'>"+data.friend[i].name+"</span><br /><span id='time'>"+data.friend[i].time.substring(5,16)+"</span></div>"+
				    		"<div class='Grid-cell name2'>帮你收集<span id='howmany'>"+data.friend[i].howmany+"</span>块</div>"+
				    		"</div>"
				    		$("#GridList").append(te);
					    }
					}
					//daigai--关注绑定检查
					subscribe=data.subscribe;
					isBind=data.isBind;
					tel=data.tel;
					count=data.count;
					lingqu=data.lingqu;
					friend=data.friend;
					hasICollect=data.hasICollect;
					
				}else{
					//alert("getInfo error1");
				}
			},
			error : function() {
				//alert("getInfo error2");
			}
		});
		$("#count").text(9-count);
		$(".box4>#phonexxx").attr("src","img/"+count+".png");//gaigai
		$("#icollect").bind("click",function(){
	/////////////////////////////		
			if(count==9){
				alert("已经收集到9块拼图，不能再收集了");
				return;
			}
			if(hasICollect){
				//alert("自己已经给自己收集了,不能再收集了");
				$("#box10").show();
				return;
			}
			if (subscribe == 0) {
				$("#box2").show();
				return;
			} 
			//换图
			//调用ajax修改后台
			$.ajax({
				url : "../duanwu",
				async : false,
				type:"POST",
				dataType : "json",
				data : {
					"openId" : openId,
					"typeStr" : "icollect"
				},
				success : function(data) {
			//		alert(JSON.stringify(data));
					if (data.datastate == 0) {
						if(data.result==true){
							$("#box7").show();
							count++;
							hasICollect=true;
							$(".box4>#phonexxx").attr("src","img/"+count+".png");//gaigai
							return;
						}else if(data.result==false){
							alert("系统繁忙，请稍后再试");
							return;
						}
					}else{
//						alert("抱歉，您不能给自己收集拼图！");
					}
					$(".qd2").parents('.box').hide();
				},
				error : function() {
					//alert("error4");
					$(".qd2").parents('.box').hide();
				}
			});		
			
		});
		$("#bloom").bind("click",function(){//盛开桃花
			if (subscribe == 0) {
				$("#box2").show();
				return;
			}
	///////////////////////////////////////		
			if(count<9){
				$("#box6").show();
			}else{
				$("#box11").show();
				if(lingqu==true){
					$("#queding5").show();$("#queding4").hide();
				}else{
					$("#queding4").show();$("#queding5").hide();
					$("#queding4").one("click",function(){//点击领取按钮
						if(isBind=="0"){//未绑定
							$("#box11").hide();
							$("#box3").show();
						}else if(isBind=="1"){//已绑定
							//调用领取的ajax
							$.ajax({//baoliu
								url : "../duanwu",
								async : false,
								type:"POST",
								dataType : "json",
								data : {
									"openId" : openId,
									"typeStr" : "lingqu"
								},
								success : function(data) {
									if (data.datastate == 0) {//表示领取成功
										$("#box11").hide();
										//alert("tel="+tel);
										$("#tel").text(tel);
										$("#box12").show();
										lingqu=true;
									}else{
										alert("领取失败");
									}
								},
								error : function() {
									//alert("error1");
								}
							});

						}
					});
				}	
			}
		});
	}else if(type==3){//朋友页
		$("#index3").show();$("#index1").hide();$("#index2").hide();
		$("#bg_page2").show();$("#bg_page1").hide();
		$(".rule").css("position","fixed");
		//ajax服务器检查有没有给别人盛开过
		hasBloomed=0;
		//根据shareId检查获得哪个手机which
		//调用ajax获得which（哪个手机）
		$.ajax({//baoliu
			url : "../duanwu",
			async : false,
			type:"POST",
			dataType : "json",
			data : {
				"openId" : shareId,
				"typeStr" : "getInfo"
			},
			success : function(data) {
				if (data.datastate == 0) {
					subscribe=data.subscribe;
					isBind=data.isBind;
					tel=data.tel;
					count=data.count;
					$(".box5>#phoneyyy").attr("src","img/"+count+".png");//gaigai
					$("#count2").text(9-count);
					lingqu=data.lingqu;
				}
			},
			error : function() {
				//alert("error1");
			}
		});
		
		$("#collect").bind("click",function(){//baoliu
	//////////////////////////		
			if(count==9){
				alert("已经收集到9块拼图，不能再收集了");
				return;
			}
			$.ajax({
				url : "../duanwu",
				async : false,
				type:"POST",
				dataType : "json",
				data : {
					"openId1" : openId,
					"openId2" : shareId,
					"typeStr" : "collect"
				},
				success : function(data) {
					if (data.datastate == 0) {
						if (data.subscribe == 0) {
							$("#box2").show();
							return;
						} else if (data.hasHeCollect == true) {//已经盛开过了
							$("#box8").show();
							return;
						}else if(data.result==true){
							$("#box7").show();
							count++;
						//	alert("count="+count);
							$(".box5>#phoneyyy").attr("src","img/"+count+".png");//gaigai
							$("#count2").text(9-count);
							return;
						}else if(data.result==false){
							alert("系统繁忙，请稍后再试");
							return;
						}
					}else{
						alert("抱歉，您不能给自己收集拼图！");
					}
					$(".qd2").parents('.box').hide();
				},
				error : function() {
					//alert("error4");
					$(".qd2").parents('.box').hide();
				}
			});		
		});
		$("#iwantjoin").bind("click",function(){//baoliu
			window.location.href="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx53e7ffd9a8962311&redirect_uri=http%3A%2F%2Fwx1.unisk.cn%2FweixinLinksucaiController.do%3Flink%26id%3Dff80808159c4db10015b65f701b2685a%26jwid%3Dgh_ad35a4a09b60&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect";
		});
	}
	   
	/*subscribe=1;
	isBind=1;*/
	$("#queding6").bind("click",function(){
	 	//var cburl ="http://wxsc1.unisk.cn/WeiXinSC/duanwu/index.jsp?type=3&openId="+openId+"&shareId="+shareId;

//	 	var cburl = "http://wxsc1.unisk.cn/WeiXinSC/duanwu/index.jsp?type=1&openId="+openId;
	//	var encodedCburl = encodeURIComponent(cburl);
//		var weixinId = "gh_d5df6c8a4e03";
		
	//	var bangdingUrl = "http://weixin.unisk.cn/weixinVipController.do?bindingMobile&weixinid="+weixinId+"&openid="+openId+"&cburl="+encodedCburl;
		
	//	https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx53e7ffd9a8962311&redirect_uri=http%3A%2F%2Fwx1.unisk.cn%2FweixinLinksucaiController.do%3Flink%26id%3Dff80808158fdd5d80159062229803264%26jwid%3Dgh_ad35a4a09b60%26cburl&response_type=code&scope=snsapi_base&state=STATE&connect_redirect=1#wechat_redirect	
//			alert("绑定地址："+bangdingUrl);
		
		
		var cburl = "http://wxsd1.unisk.cn/weixin_pintu/page1/index.jsp?type=2&openId="+openId;
		var encodedCburl = encodeURIComponent(cburl);
		var weixinId="gh_ad35a4a09b60";
		var bangdingUrl ="http://weixin.unisk.cn/weixinVipController.do?bindingMobile&weixinid="+weixinId+"&openid="+openId+"&cburl="+encodedCburl;
/*		var cburl = "http://wxsd1.unisk.cn/weixin_pintu/page1/index.jsp?type=1&openId="+openId;
		var encodedCburl = encodeURIComponent("www.taobao.com");
		var appid="wx53e7ffd9a8962311";
		var bangdingUrl ="http://wx1.unisk.cn/weixinLinksucaiController.do?link&id=ff80808158fdd5d80159062229803264&jwid=gh_ad35a4a09b60&cburl="+encodedCburl;
*/		
		console.log(bangdingUrl);
		window.location.href = bangdingUrl;	
	});

	$("#bangding").bind("click",function(){
		$("#box2").hide();
	});
	$(".qd3,.qd2,.qd1,.qd6,.qd8").bind("click",function(){
		$(this).parents('.box').hide();
	});

	$("#box6").bind("click",function(){
		$("#box6").hide();
	});

	$("#hdgz").bind("click",function(){
//		alert("大润发同归于好几口");
		window.location.href="http://wxsd1.unisk.cn/weixin_pintu/page1/gz.html";
	});
	//--------------------common---------------------------------
	function getParameter(name) {
	     var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)" , "i");
	     var r = window .location.search.substr( 1).match(reg);
	     if (r != null) return r[2];
	     return null
	};
	//----------------------share---------------------------------------
	var appId = "wx53e7ffd9a8962311";
	var nonceStr = "oDxlNmsjqvV9D29r";//随意
	var timestamp = "1420942347";//随意
	var signature = null;
	console.log("最终的"+myurl);
	$.ajax({
		url : "../getSignature",
		async : false,
		dataType : "json",
		data : {
			"nonceStr" : nonceStr,
			"timestamp" : timestamp,
			"url":myurl
		},
		success : function(data) {
			if(data.datastate== 1 ){
				signature = data.signature;
			}else{
				signature = "error";
			}
		},
		error : function() {
			signature = "error";
		}
	});
	wx.config({
		debug : false,
		appId : appId,
		timestamp : timestamp,
		nonceStr : nonceStr,
		signature : signature,
		jsApiList : ['checkJsApi', 'onMenuShareTimeline',
				'onMenuShareAppMessage', 'onMenuShareQQ',
				'onMenuShareWeibo', 'hideMenuItems', 'showMenuItems',
				'hideAllNonBaseMenuItem', 'showAllNonBaseMenuItem',
				'translateVoice', 'startRecord', 'stopRecord',
				'onRecordEnd', 'playVoice', 'pauseVoice', 'stopVoice',
				'uploadVoice', 'downloadVoice', 'chooseImage',
				'previewImage', 'uploadImage', 'downloadImage',
				'getNetworkType', 'openLocation', 'getLocation',
				'hideOptionMenu', 'showOptionMenu', 'closeWindow',
				'scanQRCode', 'chooseWXPay', 'openProductSpecificView',
				'addCard', 'chooseCard', 'openCard' ]
	}); 
	
	
	//alert(avaiTime);
/*	if(avaiTime2=="true"){
		alert("本期活动尚未开始");//上线前处理
		wx.ready(function () {
			wx.closeWindow();
		});
	}else if(avaiTime=="false"){
		alert("本期活动已结束");//下线处理
		wx.ready(function () {
			wx.closeWindow();
		});
	}*/
	var	link = "http://wxsd1.unisk.cn/weixin_pintu/re.jsp?state="+openId+"@shareid@3";
	
	var shareDataA=	 {
		"title" : "集拼图，赚流量！",
		"desc" : "您有500M待领取",
		"link" : link,
		"imgUrl" : "http://wxsd1.unisk.cn/weixin_pintu/page1/img/share_icon.png",
		"success": function () {
		},
	    "cancel": function () {
	    }
	};
	var shareDataT= {
		"title" : "集拼图，赚流量！您有500M待领取",
		"desc" : "集拼图，赚流量！您有500M待领取",
		"link" : link,
		"imgUrl" : "http://wxsd1.unisk.cn/weixin_pintu/page1/img/share_icon.png",
		"success": function () {
		},
	    "cancel": function () {
	    }
	};
	wx.ready(function () {
		/*wx.hideMenuItems({
		    menuList: ['menuItem:copyUrl','menuItem:favorite'] 
		});*/
		//alert("type="+type);
		if(type==1||type==2){
			wx.showMenuItems({
			    menuList: ['menuItem:copyUrl','menuItem:favorite','menuItem:share:appMessage','menuItem:share:timeline','menuItem:share:qq','menuItem:share:weiboApp','menuItem:favorite','menuItem:share:facebook','menuItem:share:QZone','menuItem:openWithQQBrowser','menuItem:openWithSafari','menuItem:share:email'] 
			});
			wx.onMenuShareAppMessage(shareDataA);
			wx.onMenuShareTimeline(shareDataT);
		}
		/*else if(type==3){
			wx.showMenuItems({
			    menuList: ['menuItem:copyUrl','menuItem:favorite','menuItem:share:appMessage','menuItem:share:timeline','menuItem:share:qq','menuItem:share:weiboApp','menuItem:favorite','menuItem:share:facebook','menuItem:share:QZone','menuItem:openWithQQBrowser','menuItem:openWithSafari','menuItem:share:email'] 
			});
			wx.onMenuShareAppMessage(shareDataA);
			wx.onMenuShareTimeline(shareDataT);*/
			/*wx.hideMenuItems({
			    menuList: ['menuItem:copyUrl','menuItem:favorite','menuItem:share:appMessage','menuItem:share:timeline','menuItem:share:qq','menuItem:share:weiboApp','menuItem:favorite','menuItem:share:facebook','menuItem:share:QZone','menuItem:openWithQQBrowser','menuItem:openWithSafari','menuItem:share:email'] 
			});*/
		/*}*/
	});
})
