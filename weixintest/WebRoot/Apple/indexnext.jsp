<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

String myurl = request.getRequestURL().toString();
String param = request.getQueryString();
if (param != null) {
	myurl += "?" + param.toString();
}
request.setAttribute("myurl", myurl);

String openId=request.getParameter("openId");

/* String subscribe=request.getParameter("subscribe"); */

//String openId="oA-3nv3jskFlAPD0Zntbtkq0S3pw";
//String openId="test1";
//String subscribe="1";

request.setAttribute("openId", openId);
//request.setAttribute("subscribe", subscribe);
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=640">
	<script src="js/mobile-util.js"></script>
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
	<meta name="format-detection" content="telphone=no"/>
	<meta http-equiv="X-UA-Compatible" content="chrome=1"/>
	<meta name="HandheldFriendly" content="true">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
    <!-- 全屏模式 -->
	<meta name="x5-fullscreen" content="true">
	<!-- 强制竖屏 -->
	<meta name="x5-orientation" content="portrait">
	<meta name="full-screen" content="yes">
	<!-- 强制竖屏 -->
	<meta name="screen-orientation" content="portrait">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<title>沃小树苹果集市</title>
	<style type="text/css">
	 html,body{height: 100%;width: 100%;}
	 .mainbox{width: 100%;height: 100%;background: url(img/backtree.png) no-repeat center center;background-size: cover;}
	 .brand{width: 572px;height: 816px;margin:0 auto;background: url(img/muban.png) no-repeat center center;background-size: 572px 816px;}
	  header{font-size: 36px;color: #542E01;font-weight: 700;text-align: center;line-height: 76px;height: 76px;margin-top: 65px;text-indent: -16px;}
	section div{height: 218px;width: 202px;background: url(img/price_r2_c2.png) no-repeat center center rgba(255,255,255,0.3);background-size: 78% auto;position: relative;}
	section button{height: 56px;width: 200px;border: 3px solid #90100D;border-radius: 28px;background: #D2191F;font-size: 22px;line-height: 56px;padding: 0 27px;margin:13px 0 26px 0;color: white;}
	section img{width: 50%;margin-top: 100px;height: 68px;position: relative;left: 44px;}
	section em{position: absolute;bottom:19px;width: 100%;line-height: 30px;font-size: 17px;text-align: center;left: -3px;color: #00B200;}
	.list{padding: 0 45px;}
	section span{position: absolute;top: 50%;left: 50%;height: 30px;width: 100px;margin-left: -55px;margin-top: 12px;font-size: 22px;line-height: 26px;text-align: center;color: #00B200;}
	.maskdExchange,.exchangeFile,.exchangeSuccess{position: fixed;left: 0;top: 0;bottom: 0;right: 0;z-index: 10;background: rgba(0,0,0,0.7);display: none;}
	
	.maskdExchange div,.exchangeFile div,.exchangeSuccess div{width: 451px;height: 433px;position:absolute;top: 50%;left: 50%;margin:-300px 0 0 -225px;background: url(img/duihuan.png) no-repeat center center;background-size: cover;text-align: center;}
	.exchangeFile div{background-image: url(img/file.png);}
	.exchangeSuccess div{background-image: url(img/success_r.png);}
	.maskdExchange a,.exchangeFile a,.exchangeSuccess a{font-size: 28px;color: #D1181E;display: inline-block;height: 64px;line-height: 64px;width: 240px;text-align: center;border-radius: 33px;background: #FFF;border: 1px solid white;}
	.maskdExchange a:nth-of-type(1),.exchangeFile a:nth-of-type(1),.exchangeSuccess a:nth-of-type(1){margin: 220px 0 18px 0;}
	.exchangeFile a:nth-of-type(1){margin-top: 276px;}
	.maskdExchange a:active,.exchangeFile a:active,.exchangeSuccess a:active{border-color: #B11217;color: #FF2626;}
	.loding{position: fixed;left: 0;right:0;top: 0;bottom: 0;background: rgba(0,0,0,0.7);display: none;z-index: 1111;}
	.loding div{width: 450px;height: 300px;position: absolute;left: 50%;top: 50%;margin-top: -200px;margin-left: -225px;text-align: center;color: white;font-size: 26px;line-height: 60px;}
	.loding img{height: 80px;}
	.bangding,.Recharge{position:fixed;left: 0;top: 0;bottom: 0;right: 0;background:rgba(0,0,0,0.8);z-index: 1100;background-size: 300px auto;display: none;}
	.bangding div,.Recharge div{width: 520px;height: 300px;position: absolute;left:50%;top: 50%;margin-left:-260px;margin-top: -350px;text-align: center;}
	.bangding div h5,.Recharge div h5{font-size: 32px;color:#55B52F;height:70px;line-height:70px;font-weight: normal;}
	.Recharge div{margin-top: -390px;}
	.Recharge div h5{line-height: 60px;}
	.bangding button,.Recharge button{height: 60px;line-height: 60px;width: 360px;background:-webkit-linear-gradient(top,#CBE658 0,#E8FF8B 100%);border-radius: 30px;letter-spacing: 2px;font-size: 32px;color: #289335;}
	.bangding img,.Recharge img{width: 360px;}
	
	
	</style>

</head>
<body>
	<!-- 主要背景页面 -->
	<div class="mainbox">
		<!-- 牌子的背景盒子 -->
		<div class="brand clearfix">
		<!-- 头部内容“苹果集市” -->
			<header>苹果集市</header>
			<!-- 各种奖品列表 -->
			<div class="list clearfix">
				<section class="fl">
					<div>
						<img src="img/youpan.jpg" alt="">
						<em>沃妹定制U盘</em>
					</div>
					<button data-number="30">30颗苹果兑换</button>
				</section>
				<section class="fr"> 
					<div>
						<span>全国流量200M</span>
					</div>
					<button data-number="25">25颗苹果兑换</button>
				</section>
				<section class="fl">
					<div>
						<span>全国流量100M</span>
					</div>
					<button data-number="20">20颗苹果兑换</button>
				</section>
				<section class="fr">
					<div>
						<span>全国流量50M</span>
					</div>
					<button data-number="15">15颗苹果兑换</button>
				</section>
			</div>
		</div>
	</div>
	<!-- 兑换苹果弹窗 -->
	<div class="maskdExchange">
		<div class="clearfix">
			<a href="javascript:;">当然啦</a>
			<a href="javascript:;">等等，我再想想</a>
		</div>
	</div>
	<!-- 兑换失败弹窗 -->
	<div class="exchangeFile">
		<div class="clearfix">
			<a href="javascript:;">再看看别的</a>
		</div>
	</div>
	<!-- 兑换成功的弹窗 -->
	<div class="exchangeSuccess">
		<div class="clearfix">
			<a href="javascript:;">我知道啦</a>
			<a href="javascript:;">喊小伙伴来收苹果</a>
		</div>
	</div>
	<!-- 发送请求之前的loding页面 -->
	<div class="loding">
		<div>
			<img src="img/load.gif" alt=""><br/>
			<span>正在加载请稍后&nbsp;.&nbsp;.&nbsp;.</span>
		</div>
	</div>
	<!-- 提示绑定页面 -->
	<div class="bangding">
		<div>
			<img src="img/binding.png" alt="">
			<h5>亲，绑定了手机号码才能充值流量额</h5>
			<button>点击去绑定吧</button>
		</div>
	</div>
	<!-- 充值成功页面 -->
	<div class="Recharge">
		<div>
			<img src="img/treeok_r2_c2.png" alt="">
			<h5>提交成功了！<br>我们将于24小时内为您充值</h5>
		</div>
	</div>
</body>
<script src='js/jquery.min.js'></script>
<script type="text/javascript" src="js/jweixin-1.0.0.js"></script>
	<script type="text/javascript">
	var openId = "${openId}";
	
	</script>


<script type="text/javascript">
   var openId = "${openId}";
   var appleNum=20;
  
	// 给ios设备中a元素添加active事件
	var oa = document.getElementsByTagName('a');
	for(var i= 0;i<oa.length;i++){
		oa[i].addEventListener('touchstart',function(){},false);
	}
	document.documentElement.style.height = window.innerHeight + 'px';
	
	$(function(){
		// 发送ajax请求，进行
		$.ajax({
	        type: "post",
	        // 接口
	        url: "../Apple2?b="+Math.random()+"&openId="+openId,
	        // data : 'ifGet',
	        dataType: "json",
	        success: function (data) {
	        	// 苹果的个数
					var num = data.num;
					appleNum= data.num;
					// 有没有绑定手机号码,1代表已经绑定了，0代表没有绑定
					var tel = data.tel;
					// end表示如果苹果已经兑换完了，这个产品下架，对应的button不能点击，并且显示已经兑换完了
					// 所有的end都是1代表奖品没了，零代表奖品还有
					var endone = data.endone;
					var endtwo = data.endtwo;
					var endthree = data.endthree;
					var endfour = data.endfour;
					// 通过url传给下一个页面的参数prizeType，来确定是哪个奖品
					// 1代表是30个苹果兑换的优盘
					// 2代表是200M流量
					// 3代表100M流量
					// 4代表50M流量
					var prizeType = null;
					// 点击兑换的时候弹出确定兑换的框
					(function(jQuery){
						$('section button').on('click',function(event){
							event.stopPropagation();
							$('.maskdExchange').fadeIn('fast');
							$('.maskdExchange').find('a').eq(0).attr('Number',$(this).data('number'));
							$('body').on('touchmove',function(){
								return false;
							});
						});
						if(endone == 1){
							$('section').eq(0).find('button').off('click');
							$('section').eq(0).find('button').html('此奖品已经兑换完');
							$('section').eq(0).find('button').css('background','#B21116');
							$('section').eq(0).find('button').css('color','#888');

						};
						if(endtwo == 1){
							$('section').eq(1).find('button').off('click');
							$('section').eq(1).find('button').html('此奖品已经兑换完');
							$('section').eq(1).find('button').css('background','#B21116');
							$('section').eq(1).find('button').css('color','#888');

						};
						if(endthree == 1){
							$('section').eq(2).find('button').off('click');
							$('section').eq(2).find('button').html('此奖品已经兑换完');
							$('section').eq(2).find('button').css('background','#B21116');
							$('section').eq(2).find('button').css('color','#888');

						};
						if(endfour == 1){
							$('section').eq(3).find('button').off('click');
							$('section').eq(3).find('button').html('此奖品已经兑换完');
							$('section').eq(3).find('button').css('background','#B21116');
							$('section').eq(3).find('button').css('color','#888');

						};

						// 点击等等我在想想的时候，隐藏兑换页面
						$('.maskdExchange').find('a').eq(1).on('click',function(event){
								event.stopPropagation();
								$('.maskdExchange').css('display','none');
							});
						$('.maskdExchange').find('a').eq(0).on('click',function(event){
							event.stopPropagation();
							var myDate=new Date().getTime();
							if($(this).attr('Number') > num){
								$('.maskdExchange').css('display','none');
								$('.exchangeFile').css('display','block');
								$('.exchangeFile').find('a').on('click',function(event){
									event.stopPropagation();
									$('.exchangeFile').css('display','none');
								});
							}else{
								// 说明是实物
								if($(this).attr('Number') == 30){
									prizeType = 1;
									window.location.href = './indexfourinput.jsp'+"?openId="+openId;
								}
								// 说明是200M流量
								if($(this).attr('Number') == 25){
									prizeType = 2;
									// 没有绑定手机号码
									if(tel == 0){
										$('.bangding').css('display','block');
										$('.bangding button').on('click',function(event){
											event.stopPropagation();
											window.location.href = "http://bigdata.chinaunicom.com/send/bind/index.jsp?openId="+openId;
										})
									}else{
										$.ajax({
									        type: "post",
									        // 接口
									        url: "../AppleFlow?a="+Math.random()+"&openId="+openId,
									        data : {"prizeType":prizeType},
									        dataType: "json",
									        beforeSend:function(){
									        	$('.loding').css('display','block');
									        	$('.loding').find('span').html('正在提交请稍后&nbsp;.&nbsp;.&nbsp;.')
									        },
									        success:function (data) {
									        	if(data.success == 1){
									        		$('.loding').css('display','none');
									        		$('.Recharge').css('display','block');
									        		setTimeout(function(){
														window.location.href = './indexnext.jsp?a='+myDate+"&openId="+openId;
									        		}, 1200);
									        	}else{
									        		alert("请求超时，请重新提交")
									        	}
									        }
									    });
									}
									
								}
								if($(this).attr('Number') == 20){
									prizeType = 3;
									if(tel == 0){
										// 绑定手机号
										$('.bangding').css('display','block');
										$('.bangding button').on('click',function(event){
											event.stopPropagation();
											window.location.href = "http://bigdata.chinaunicom.com/send/bind/index.jsp?openId="+openId;
										})
									}else{
										$.ajax({
									        type: "post",
									        // 接口
									        url: "../AppleFlow?a="+Math.random()+"&openId="+openId,
									        data : {"prizeType":prizeType},
									        dataType: "json",
									        beforeSend:function(){
									        	$('.loding').css('display','block');
									        	$('.loding').find('span').html('正在提交请稍后&nbsp;.&nbsp;.&nbsp;.')
									        },
									        success:function (data) {
									        	if(data.success == 1){
									        		$('.loding').css('display','none');
									        		$('.Recharge').css('display','block');
									        		setTimeout(function(){
														window.location.href = './indexnext.jsp?a='+myDate+"&openId="+openId;
									        		}, 1200);
									        	}else{
									        		alert("请求超时，请重新提交")
									        	}
									        }
									    });
									}
								}
								if($(this).attr('Number') == 15){
									prizeType = 4;
									if(tel == 0){
										$('.bangding').css('display','block');
										$('.bangding button').on('click',function(event){
											event.stopPropagation();
											window.location.href = "http://bigdata.chinaunicom.com/send/bind/index.jsp?openId="+openId;
										})
									}else{
										$.ajax({
									        type: "post",
									        // 接口
									        url: "../AppleFlow?a="+Math.random()+"&openId="+openId,
									        data : {"prizeType":prizeType},
									        dataType: "json",
									        beforeSend:function(){
									        	$('.loding').css('display','block');
									        	$('.loding').find('span').html('正在提交请稍后&nbsp;.&nbsp;.&nbsp;.')
									        },
									        success:function (data) {
									        	if(data.success == 1){
									        		$('.loding').css('display','none');
									        		$('.Recharge').css('display','block');
									        		setTimeout(function(){
														window.location.href = './indexnext.jsp?a='+myDate+"&openId="+openId;
									        		},1200);
									        	}else{
									        		alert('请求超时，请重新提交');
									        	}
									        }
									    });
									}
								}
							}
						});
						$('body').on('touchmove',function(){
							return false;
						})
					})($);
	        },
	        error:function(){
	        	alert('网络不给力，请检查您的网络');
	        }
	    });
	});
	
	var myurl ="http://bigdata.chinaunicom.com/send/Apple/indexnext.jsp?openId="+openId;	
//    alert(myurl);
    var appId = "wx69b4b5a41b8c6d0b";
	var nonceStr = "oDxlNmsjqvV9D29r";//随意
	var timestamp = "1420942347";//随意
	var signature = null;
			
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
					if(data.datastate== 0 ){
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
			
			var	link ="https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx69b4b5a41b8c6d0b&redirect_uri=http%3A%2F%2Fbigdata.chinaunicom.com%2Fsend%2FuserInfoServlet?type=10@shareid@"+openId+"&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
			//
			var shareDataA=	 {
				"title" : "签到不努力，流量徒伤悲！养育沃小树，兑换免费全国流量啦！",
				"desc" : "我已经收获了"+appleNum+"颗苹果，有机会获得U盘、流量等好礼了，你也快来吧！",
				"link" : link,
				"imgUrl" : "http://bigdata.chinaunicom.com/send/woCredit/img/share_icon.jpg",
				"success": function(){
				},
			    "cancel": function () {
			    }
			};
			var shareDataT= {
				"title" : "签到不努力，流量徒伤悲！养育沃小树，兑换免费全国流量啦",
				"link" : link,
				"imgUrl" : "http://bigdata.chinaunicom.com/send/woCredit/img/share_icon.jpg",
				"success": function () {
				},
			    "cancel": function () {
			    }
			};
			wx.ready(function () {
				wx.onMenuShareAppMessage(shareDataA);
				wx.onMenuShareTimeline(shareDataT);
			});
	
</script>


</html>