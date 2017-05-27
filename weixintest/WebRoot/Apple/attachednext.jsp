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


//String shareId="oA-3nv3jskFlAPD0Zntbtkq0S3pw";
//String openId="test1";
//String subscribe="1";

request.setAttribute("openId", openId);
//request.setAttribute("shareId", shareId);
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
	<title>沃小树分享副页面</title>
	<style type="text/css">
	 html,body{height: 100%;width: 100%;}
	 .mainbox{width: 100%;height: 100%;background: url(img/backmain.png) no-repeat center center;background-size: cover;text-align: center;}
	 .brand{width: 572px;height: 816px;margin:0 auto;background: url(img/muban.png) no-repeat center center;background-size: 572px 816px;}
	  header{font-size: 36px;color: #542E01;font-weight: 700;text-align: center;line-height: 76px;height: 76px;margin-top: 65px;text-indent: -16px;}
	section div{height: 218px;width: 202px;background: url(img/price_r2_c2.png) no-repeat center center rgba(255,255,255,0.3);background-size: 78% auto;position: relative;}

	section button{height: 56px;width: 200px;border: 3px solid #90100D;border-radius: 28px;background: #D2191F;font-size: 22px;line-height: 56px;padding: 0 27px;margin:13px 0 26px 0;color: white;}
	section img{width: 50%;margin-top: 100px;height: 68px;position: relative;left: -7px;}
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
	.raise{height: 80px;width: 460px;font-size: 40px;color: white;background:-webkit-linear-gradient(top,#CBE658 0,#E8FF8B 100%);border-radius: 40px;letter-spacing: 3px;font-size: 32px;color: #289335;margin-top: 40px;}
	.follow{position: fixed;left: 0;top: 0;bottom: 0;right: 0;background: url(img/code_r2_c2.png) no-repeat center 150px rgba(0,0,0,0.8);background-size: 360px auto;z-index: 10;text-align: center;display: none;}
	.follow img{margin-top: 200px;opacity: 0;}
	.follow span{display: inline-block;font-size: 30px;color: white;line-height: 40px;margin-top: 60px;}
	</style>
	<script type="text/javascript" src="js/jweixin-1.0.0.js"></script>
	<script type="text/javascript">
	var openId = "${openId}";
    var bRotate = false;
	function onBridgeReady(){
 		WeixinJSBridge.call('hideOptionMenu');
	}
	if (typeof WeixinJSBridge == "undefined"){
    if( document.addEventListener ){
        document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
    }else if (document.attachEvent){
        document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
        document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
    }
	}else{
    onBridgeReady();
	}
	</script>

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
		<button class="raise">我也要养沃小树</button>
	</div>
	
	<!-- 发送请求之前的loding页面 -->
	<div class="follow clearfix">
		<div>
			<img src="img/qrcode_for_gh_af127617b3a0_430.jpg" alt=""><br/>
			<span>亲长按二维码关注一下<br/>就可以养沃小树了</span>
		</div>
	</div>
</body>
<script src='js/jquery.min.js'></script>
<script type="text/javascript">
    var openId = "${openId}";
	// 给ios设备中a元素添加active事件
	var oa = document.getElementsByTagName('a');
	for(var i= 0;i<oa.length;i++){
		oa[i].addEventListener('touchstart',function(){},false);
	}
	document.documentElement.style.height = window.innerHeight + 'px';
	
	$(function(){
		$.ajax({
	        type: "post",
	        // 接口
	        url: "../AppleSubscribe?a="+Math.random()+"&openId="+openId,
	        // data : 'ifGet',
	        dataType: "json",
	        success: function (data) {
	        		// 判断是否已经关注data.follow是1代表已经关注
		        	// data.follow是0代表没有关注
					$('button').on('touchend',function(){
						if(data.follow == 1){
							window.location.href = "./indexmain.jsp?openId="+openId;
						}else{
							$('.follow').fadeIn('fast');
						}
					});

	        },
	        error:function(){
	        	alert("加载失败，请检查您的网络");
	        }
	      });
		// 防止ios端的滚动
		$('body').on('touchmove',function(){
			return false;
		});
		
	})
</script>
</html>