<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

String myurl = request.getRequestURL().toString();
String param = request.getQueryString();
if (param != null) {
	myurl += "?" + param.toString();
}
request.setAttribute("myurl", myurl);

String openId=request.getParameter("openId");

 String shareId=request.getParameter("shareId"); 
 if(shareId.equals(openId)){
   // request.getRequestDispatcher("./indexmain.jsp").forward(request, response);
	response.sendRedirect("./indexmain.jsp?openId="+openId);
}
 

// String openId="oA-3nv3jskFlAPD0Zntbtkq0S3pw";
//String shareId="oA-3nv3jskFlAPD0Zntbtkq0S3pw";
//String openId="test1";
//String subscribe="1";

request.setAttribute("openId", openId);
request.setAttribute("shareId", shareId);
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
    <!-- 全屏模式 -->
	<meta name="x5-fullscreen" content="true">
	<!-- 强制竖屏 -->
	<meta name="x5-orientation" content="portrait">
	<meta name="full-screen" content="yes">
	<!-- 强制竖屏 -->
	<meta name="screen-orientation" content="portrait">
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> 
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache"> 
	<META HTTP-EQUIV="Expires" CONTENT="0"> 
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<title>沃小树分享主页面</title>
	<script type="text/javascript">
		// 初始化页面高度
		document.documentElement.style.height = window.innerHeight + 'px';
	</script>
	<style type="text/css">
		html,body{height: 100%;width: 100%;font-family:"Microsoft YaHei", "微软雅黑";}
		.rule{height: 100%;width: 100%;position: fixed;left: 0;top: 0;right: 0;bottom: 0;background: url(img/backtree.png) no-repeat center center;background-size: cover;z-index: 1001;display: none;}
		.mask{position: fixed;left: 0;top: 0;right: 0;bottom: 0;background: url(img/share.png) no-repeat center center rgba(0,0,0,0.2);background-size: cover;display: none;z-index: 1000;}
		.mainbox{width: 100%;height: 100%;background: url(img/backmain.png) no-repeat center center;background-size: cover;overflow: hidden;}
		header span{display: inline-block;width: 90px;height: 90px;border-radius: 50%;font-size: 0;border: 1px solid #8D8D8D;overflow: hidden;text-align: center;background: #fff;}
		header b{display: inline-block;width: 0;vertical-align: middle;height: 100%;}
		header span img{width: 92px;vertical-align: middle;height: 92px;border-radius: 50%;border: none;border-width: 0;position: relative;left: -1px;top: -1px;}
		header strong{display: inline-block;text-align: center;font-weight: normal;}
		header em{display: inline-block;width: 120px;text-align: center;font-size: 0;} 
		header em i{font-size: 20px;color: #61B9D3;display: inline-block;line-height: 32px;padding-left: 4px;width: 150px;text-align: center;position:relative;left: -10px;}
		header{padding:0 36px 0 54px;margin-top: 35px;position: relative;z-index: 100;}

		header em img{width: 106px;-webkit-animation:revolving 5s 0s infinite;animation: revolving 5s 0s infinite;}
		@-webkit-keyframes revolving{
		 0%{ 
		    -webkit-transform:rotateZ(0deg);
		    transform:rotateZ(0deg);
		  }
		  74%{ 
		    -webkit-transform:rotateZ(0deg);
		    transform:rotateZ(0deg);
		    perspective(700px);
		  }
		  75%{ 
		     -webkit-transform: rotate3d(0, 0, 1, 15deg);
		    transform: rotate3d(0, 0, 1, 15deg);
		    perspective(700px);
		    }
		  80%{
		    -webkit-transform: rotate3d(0, 0, 1, -10deg);
		    transform: rotate3d(0, 0, 1, -10deg);
		    perspective(700px);
		  }
		  85%{
		  	-webkit-transform: rotate3d(0, 0, 1, 5deg);
		    transform: rotate3d(0, 0, 1, 5deg);
		    perspective(700px);
		  }
		  100%{
		  	-webkit-transform: rotate3d(0, 0, 1, 0deg);
		    transform: rotate3d(0, 0, 1, 0deg);
		    perspective(700px);
		  }
		}
		@keyframes revolving{
		 0%{ 
		    -webkit-transform:rotateZ(0deg);
		    transform:rotateZ(0deg);
		  }
		  74%{ 
		    -webkit-transform:rotateZ(0deg);
		    transform:rotateZ(0deg);
		    perspective(700px);
		  }
		  75%{ 
		     -webkit-transform: rotate3d(0, 0, 1, 15deg);
		    transform: rotate3d(0, 0, 1, 15deg);
		    perspective(700px);
		    }
		  80%{
		    -webkit-transform: rotate3d(0, 0, 1, -10deg);
		    transform: rotate3d(0, 0, 1, -10deg);
		    perspective(700px);
		  }
		  85%{
		  	-webkit-transform: rotate3d(0, 0, 1, 5deg);
		    transform: rotate3d(0, 0, 1, 5deg);
		    perspective(700px);
		  }
		  100%{
		  	-webkit-transform: rotate3d(0, 0, 1, 0deg);
		    transform: rotate3d(0, 0, 1, 0deg);
		    perspective(700px);
		  }
		}
		header strong i{font-size: 20px;color: #61B9D3;display: inline-block;position: relative;top: -2px;max-width: 180px;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;}
		.apple button,.apple i{display: inline-block;}
		.apple img{width: 111px;}
		.apple button{position: relative;-webkit-transform: translate3d(0,0,0);
				transform: translate3d(0,0,0);-ms-transform: translate3d(0,0,0);background: transparent;border:0;border: none;}
		.apple button.move{animation: Down 2s 0s linear;-webkit-animation: Down 2s 0s linear;}
		@-webkit-keyframes Down{
		 0%{ 
		    -webkit-transform:translate(2px,10px);
		    transform:translate(2px,10px);
		    perspective(700px);
		  }
		  5%{
		  	-webkit-transform:translate(-6px,10px);
		    transform:translate(-6px,10px);
		    perspective(700px);
		  }
		  50%{
		  	opacity: 0.6;
		  	-webkit-transform:translate(-200px,245px);
		    transform:translate(-200px,245px);
		    perspective(700px);
		  }
		 90%{
		 	opacity: 0;
		 	-webkit-transform:translate(-200px,245px);
		    transform:translate(-200px,245px);
		    perspective(700px);
		 }
		  100%{
		  	opacity: 0;
		  	-webkit-transform:translate(-200px,245px);
		    transform:translate(-200px,245px);
		    perspective(700px);
		  }
		}
		@keyframes Down{
		 0%{ 
		    -webkit-transform:translate(2px,10px);
		    transform:translate(2px,10px);
		    perspective(700px);
		  }
		  5%{
		  	-webkit-transform:translate(-6px,10px);
		    transform:translate(-6px,10px);
		    perspective(700px);
		  }
		  50%{
		  	opacity: 0.6;
		  	-webkit-transform:translate(-200px,245px);
		    transform:translate(-200px,245px);
		    perspective(700px);
		  }
		 90%{
		 	opacity: 0;
		 	-webkit-transform:translate(-200px,245px);
		    transform:translate(-200px,245px);
		    perspective(700px);
		 }
		  100%{
		  	opacity: 0;
		  	-webkit-transform:translate(-200px,245px);
		    transform:translate(-200px,245px);
		    perspective(700px);
		  }
		}
		.apple{text-align: center;margin-top: 122px;}
		.apple i{font-size: 20px;color: white;position: absolute;left: 7px;top:0;width: 111px;text-align: center;line-height: 114px;}
		.apple button.active{-webkit-animation:bounce 3s 0s infinite;animation: bounce 3s 0s infinite;}
			@-webkit-keyframes bounce {

			94%,85%,100%,83%,98%{
				-webkit-transition-timing-function: cubic-bezier(.215,.30,.355,1);
				transition-timing-function: cubic-bezier(.215,.61,.355,1);
				-webkit-transform: translate3d(0,0,0);
				transform: translate3d(0,0,0);
			}

			87%,90% {
				-webkit-transition-timing-function: cubic-bezier(.755,.050,.855,.060);
				transition-timing-function: cubic-bezier(.755,.050,.855,.060);
				-webkit-transform: translate3d(0,-30px,0);
				transform: translate3d(0,-30px,0);
			}

			93% {
				-webkit-transition-timing-function: cubic-bezier(.755,.050,.855,.060);
				transition-timing-function: cubic-bezier(.755,.050,.855,.060);
				-webkit-transform: translate3d(0,-15px,0);
				transform: translate3d(0,-15px,0);
			}

			96% {
				-webkit-transform: translate3d(0,-4px,0);
				transform: translate3d(0,-4px,0);
			}
		}

		@keyframes bounce {
			94%,83%,100%,85%,98%{
				-webkit-transition-timing-function: cubic-bezier(.215,.30,.355,1);
				transition-timing-function: cubic-bezier(.215,.61,.355,1);
				-webkit-transform: translate3d(0,0,0);
				transform: translate3d(0,0,0);
			}

			87%,90% {
				-webkit-transition-timing-function: cubic-bezier(.755,.050,.855,.060);
				transition-timing-function: cubic-bezier(.755,.050,.855,.060);
				-webkit-transform: translate3d(0,-30px,0);
				transform: translate3d(0,-20px,0);
			}

			93% {
				-webkit-transition-timing-function: cubic-bezier(.755,.050,.855,.060);
				transition-timing-function: cubic-bezier(.755,.050,.855,.060);
				-webkit-transform: translate3d(0,-15px,0);
				transform: translate3d(0,-15px,0);
			}

			96% {
				-webkit-transform: translate3d(0,-4px,0);
				transform: translate3d(0,-4px,0);
			}
		}


		.basket{width: 524px;margin:100px 0 0 -50px;position: relative;z-index: 10;}
		.baskapple{width:127px;height: 147px;background: url(img/applehave.png) no-repeat center center;background-size: cover;}
		.kettle{font-size: 0;position: relative;}
		.kettle span{display: inline-block;position: relative;top: -72px;transform:rotate(16deg);opacity: 0;}
		.kettle em{position: absolute;bottom: -5px;left: 42px;}
		.kettle span.active{-webkit-animation:pour 5s 0s linear;animation: pour 5s 0s linear;}
		@-webkit-keyframes pour{
		 0%{ 
		 	opacity: 1;
		    transform:rotate(16deg);
		    -webkit-transform:rotate(16deg);
		  }
		  
		  8%{
		  	opacity: 1;
		  	transform:rotate(6deg);
		  	-webkit-transform:rotate(6deg);
		    perspective(700px);
		  }
		  
		 18%{ 
		  	opacity: 1;
		  	transform:rotate(0deg);
		  	-webkittransform:rotate(6deg);
		    perspective(700px);
		    }
		 
		  to{
		  	opacity: 1;
		  	transform:rotate(0deg);
		  	-webkit-transform:rotate(0deg);
		    perspective(700px);
		  }
		}
		.kettle i{width: 78px;height: 78px;display: inline-block;background: url(img/weaterling.png) no-repeat center center;background-size: cover;position:relative;top: 72px;opacity: 0;}
		.kettle i.active{-webkit-animation:itlt 4s 0s linear;animation: itlt 4s 0s linear;}
		@-webkit-keyframes itlt{
		 0%{ 
		    opacity: 0.8;
		  }
		  10%{ 
		    opacity: 1;
		    perspective(700px);
		  }
		  20%{
		  	 opacity: 0.3;
		    perspective(700px);
		  }
		  25%{
		  	 opacity: 0;
		    perspective(700px);
		  }
		  30%{ 
		     opacity:0.8;
		    perspective(700px);
		    }
		  40%{
		    opacity: 1;
		    perspective(700px);
		  }
		  50%{
		  	opacity: 0.5;
		    perspective(700px);
		  }
		  60%{
		  	 opacity: 0;
		    perspective(700px);
		  }
		  70%{
		  	opacity: 0.6;
		    perspective(700px);
		  }
		  75%{
		  	opacity: 1;
		    perspective(700px);
		  }
		  80%{
		  	opacity: 0.6;
		    perspective(700px);
		  }
		  95%{
		  	opacity: 0.3;
		    perspective(700px);
		  }
		  to{
		  	opacity: 0;
		  	perspective(700px);
		  }
		}
		.baskapple{position: relative;}
		.baskapple b{position: absolute;left: 0;bottom:14px;height: 22px;line-height: 22px;font-size: 22px;color: #fff;width: 100%;text-align: center;font-weight: normal;}
		.baskapple em{position: absolute;top: -60px;left:100%;line-height: 72px;font-size: 22px;color: white;text-align: center;background: url(img/flage.png) no-repeat center center;height: 82px;width: 74px;opacity: 0;}
		section a{height: 64px;line-height: 64px;width: 246px;border-radius: 32px;border:3px solid #007E3D;background: #00A651;font-size: 24px;color: white;display: inline-block;text-align: center;position: relative;z-index: 999;}
		section a:active{color: #BFFFBF;border-color: green;left: -1px;top: -1px;}
		section {margin-top: 48px;padding: 0 42px 0 48px;}
		footer{border: 2px solid #017E3C;width: 502px;padding: 15px 30px;margin:0 auto;margin-top: 30px;border-radius: 20px;}
		footer div:nth-of-type(1){font-size: 20px;line-height: 30px;color: #005B2C;margin-top: 28px;position: relative;}
		footer .fl img{position: absolute;right: 5px;bottom: -15px;}
		footer div:nth-of-type(2){position: relative;}
		footer div:nth-of-type(2) img:nth-of-type(2){position: absolute;bottom:0;right:0;z-index: 666;opacity: 0;}
		.tree{width: 420px;height: 475px;margin: 0 auto;background: url(img/tree.png) no-repeat center center;background-size: cover;margin-top: -20px;position: relative;z-index: 100;}
		.fixed{font-size: 22px;color: white;position: fixed;left: 0;bottom: 0;right: 0;text-align:center;line-height: 46px;height: 46px;background: rgba(0,0,0,0.4);}
		.could{position: absolute;left: 0;top: 0;right: 0;height: 160px;z-index: 10;overflow: hidden;}
		.could img:nth-of-type(1){width:131px;height:58px;-webkit-animation:moveto 100s 0s infinite linear;animation: moveto 100s 0s infinite linear;position: absolute;left: -130px;top: 50px;}
		@-webkit-keyframes moveto{
		 from{ 
		    -webkit-transform:translate3d(0px,0,0);
		    transform:translate3d(0px,0,0);
		  }
		  40%{
		  	-webkit-transform:translate3d(800px,-20px,0);
		    transform:translate3d(800px,-20px,0);
		  }
		  to{
		  	-webkit-transform: translate3d(0px,0,0);
		    transform: translate3d(0,0,0);
		    perspective(700px);
		  }
		}
		.could img:nth-of-type(2){width:125px;height:55px;top:108px;-webkit-animation:moveright 90s 0s infinite linear;animation: moveright 90s 0s infinite linear;position: absolute;right: -130px;top: 120px;}
		@-webkit-keyframes moveright{
		 from{ 
		    -webkit-transform:translate3d(-0px,0,0);
		    transform:translate3d(-0px,0,0);
		  }
		  60%{
		  	-webkit-transform:translate3d(-750px,20px,0);
		    transform:translate3d(-750px,20px,0);
		  }
		  to{
		  	-webkit-transform: translate3d(-0px,0,0);
		    transform: translate3d(-0px,0,0);
		    perspective(700px);
		  }
		}
		em.item{
			  -webkit-animation: left 2s 0.2s infinite;
			  animation: left 2s 0.2s infinite;
			}
			@-webkit-keyframes left{
			 0%{ 
			 	opacity: 0.1;
			    -webkit-transform:translate(0,0);
			    transform:translate(0,0);
			  }
			  20%{
			  	opacity: 1;
			  	-webkit-transform: translate(-10px,0);
			    transform: translate(-10px,0);
			    perspective(700px);
			  }
			  80%{
			  	opacity: 1;
			  	-webkit-transform: translate(-100px,0);
			    transform: translate(-160px,0);
			    perspective(700px);
			  }
			  100%{ 
			  	opacity: 0;
			     -webkit-transform: translate(-180px,0);
			    transform: translate(-180px,0);
			    perspective(700px);
			    }
			 
			}
		.rule .content{width: 572px;height: 836px;margin: 0 auto;background: url(img/rule.png) no-repeat center center;background-size: cover;position: relative;}
		.content h6{font-size: 34px;color: #532E01;line-height: 58px;height: 58px;text-align: center;margin-top: 76px;text-indent: -16px;}
		.content .pagerule{height: 636px;width: 500px;margin:15px auto 0 auto;overflow-y:scroll;position: relative;}
		::-webkit-scrollbar {
		  -webkit-appearance: none;
		}
		::-webkit-scrollbar:vertical {
		  width: 12px;
		}
		::-webkit-scrollbar:horizontal {
		  height: 12px;
		}
		::-webkit-scrollbar-thumb {
		  background: -webkit-linear-gradient(top, #E2B365 0%,#E2B365 20%,#C58651 25%,#C58651 30%,#BD8049 50%,#E2B365 73%,#AB6A40 82%,#AB6A40 86%,#E2B365 100%);
		  border-radius: 10px;
		  border: 2px solid #ffffff;
		}
		::-webkit-scrollbar-track {
		  border-radius: 10px;
		  background: -webkit-linear-gradient(top, #E2B365 0%,#E2B365 20%,#C58651 25%,#C58651 30%,#BD8049 50%,#E2B365 73%,#AB6A40 82%,#AB6A40 86%,#E2B365 100%);
		}
		.pagerule article{padding: 0 20px 0 20px;font-size: 22px;line-height: 30px;}
		.pagerule article h6{font-size: 28px;line-height: 40px;text-align: left;padding-left: 20px;margin-top:20px;}
		.content button{position: absolute;bottom: 6px;left: 50%;width: 360px;margin-left: -180px;height: 42px;line-height: 42px;text-align: center;font-size: 32px;color: #532C01;background:-webkit-linear-gradient(top,#E2B365 0,#CC9755 100%);border-radius: 21px;letter-spacing: 2px;}
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
	<div class="mainbox clearfix">
		<div class="could">
			<img src="img/could_r1_c1.png" alt="">
			<img src="img/couldtright_r1_c1.png" alt="">
		</div>
	<!-- 头部 -->
		<header class="clearfix">
			<strong class="fl">
				<span><img src="img/apple.png" alt=""><b></b></span><br/>
				<i>宛若无垠</i>
			</strong>
			<em class="fr">
				<img src="img/weatershu.png" alt=""><br/>
				<i>拿我给小树浇水</i>
			</em>
		</header>
		<!-- 苹果 -->
		<div class="tree clearfix">
			<div class="apple">
				<button class="active"><img src="img/apple.png" alt=""></button>
			</div>
			<!-- 篮子 水壶 小树的牌子-->
			<div class="basket clearfix">
				<!-- 篮子 -->
				<div class="baskapple fl">
					<b></b>
				</div>
				<!-- 水壶 小牌子-->
				<div class="kettle fr">
					<span>
						<i></i>
						<img src="img/weater.png" alt="">
					</span>
					<em>
						<img src="img/brank_r1_c1.png" alt="">
					</em>
				</div>
			</div>
		</div>
		<!-- button按钮去集市  喊小伙伴分享 -->
		<section class="clearfix">
			<a class="fl">去苹果集市看看</a>
			<a class="fr">帮TA给小树浇水</a>
		</section>
		<!-- 底部分享二维码页面 -->
		<footer class="clearfix">
			<div class="fl">
				长安右侧二维码，关注【联通大数据】<br/>
				不仅可以养育沃小树，还有更多服务<br/>一同开启哟！
				<img src="img/hand.png" alt="">
			</div>
			<div class="fr">
				<img src="img/code.png" alt="">
				<img src="img/qrcode_for_gh_af127617b3a0_430.jpg" alt="">
			</div>
		</footer>
	</div>
	<!-- 规则点击页面 -->
	<div class="fixed">沃小树养育攻略</div>
	<!-- 规则页面 -->
	<div class="rule">
		<div class="content clearfix">
			<h6>沃小树养育攻略</h6>
			<div class="pagerule">
				<article>
					<h6>仔细阅读规则喔...</h6>
					1、关注【联通大数据】即可养育沃小树，每日点击【摘苹果】即可累计苹果，一日摘取一次。<br/>
					2、苹果集市开放期间，可将累计的苹果兑换礼品，每一期苹果集市可兑换多种礼品，同一种礼品只能兑换一次。<br/>
					3、第一期苹果集市开放时间：2017年3月10日至2017年4月10日。<br/>
					4、流量礼品兑换后，苹果集市关闭次月流量到账。<br/>
					5、部分联通用户由于套餐限制，出现流量无法到账，核实后集市将退还苹果，可供下次集市再次兑换其他礼品。<br/>
					6、非联通用户流量无法到账，请兑换其他礼品。<br/>
					7、兑换实物礼品需提供邮寄地址、收件人姓名、联系方式等信息，该信息只用作邮寄礼品。<br/>
					8、实物礼品出现质量问题不予调换。<br/>
					9、【联通大数据】保持对本次活动的最终解释权。<br/>
				</article>
			</div>
			<!-- 返回主页 -->
			<button>宝宝懂了，去养树喽</button>
		</div>
	</div>
</body>
<script src='js/jquery.min.js'></script>
<script type="text/javascript">
// 给ios设备中a元素添加active事件
	var oa = document.getElementsByTagName('a');
	for(var i= 0;i<oa.length;i++){
		oa[i].addEventListener('touchstart',function(){},false);
	}
	document.documentElement.style.height = window.innerHeight + 'px';

	$(function(){
		var openId = "${openId}";
		var shareId="${shareId}";
		
		// 发送ajax请求，进行
		$.ajax({
	        type: "post",
	        // 接口
	        url: "../AppleSubscribe?b="+Math.random()+"&shareId="+shareId,
	        // data : 'ifGet',
	        dataType: "json",
	        success: function (data) {
	        	// // 拿到用户的头像headImgUrl,用户苹果个数num，用户今天有没有摘过苹果times，1代表摘过了，0代表没有摘过,用户昵称Names,关注
					var headImgUrl = data.headImgUrl;
					var num = data.num;
					// var times = 0;
					var Names = data.Names;
					
					$('header .fl img').attr('src',headImgUrl);
					$('header .fl i').html(Names);
					$('.baskapple b').html(num+'颗');
					// 如果判断等于0这个时候显示空篮子'
					if(num == 0){
						$('.baskapple').css('background-image','url(img/backet.png)');
					}
	        },
	        error:function(){
	        	alert("请求失败，请检查您的网络");
	        }
	    });    

		// 点击小水壶添加浇水的动作
		$('header em').on('click',function(){
			$('.kettle span').addClass('active');
			$('.kettle i').addClass('active');
			setTimeout(function(){
				$('.kettle i').removeClass('active');
				$('.kettle span').removeClass('active');
			}, 5000)
		});

		// 点击去苹果集市兑换好礼，跳转到奖品页面
		$('section .fl').on('click',function(){
			window.location.href = './attachednext.jsp?b='+Math.random()+"&openId="+openId;
		});
		// 点击沃小树养育攻略进行规则页面的弹窗
		$('.fixed').on('touchstart',function(){
			$('.rule').slideDown(500);
		});
		// 点击button之后阅读攻略完毕，回到主页面
		$('.content button').on('touchstart',function(){
			$('.rule').slideUp(500);
		});
		$('section .fr').on('click',function(){
			$('.kettle span').addClass('active');
			$('.kettle i').addClass('active');
			setTimeout(function(){
				$('.kettle i').removeClass('active');
				$('.kettle span').removeClass('active');
			}, 5000)
		});

	})
</script>
</html>