<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

String myurl = request.getRequestURL().toString();
String param = request.getQueryString();
if (param != null) {
	myurl += "?" + param.toString();
}
request.setAttribute("myurl", myurl);

String openId=request.getParameter("openId");
request.setAttribute("openId", openId);
//request.setAttribute("subscribe", subscribe);
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>填写信息页面</title>
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
	<script type="text/javascript">
		document.documentElement.style.height = window.innerHeight + 'px';
	</script>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<style type="text/css">
	.mainboxinput{position: fixed;left: 0;top: 0;bottom: 0;right: 0;background: url(img/backtree.png) no-repeat center center;background: cover;}
	.mainboxinput li{line-height:85px;font-size: 0;}
	.mainboxinput ul{margin-top: 30px;}
	.mainboxinput li span{display: inline-block;vertical-align: middle;font-size: 30px;color: #55B52F;width: 160px;text-align: right;padding-right: 10px;padding-left: 8px;}
	.mainboxinput li input{height: 60px;border-radius:30px;box-shadow: 0 0 13px 3px #55B52F;vertical-align:middle;width: 370px;line-height: 60px;font-size: 30px;padding:0 15px;-webkit-appearance:none;color: #289335;}
	
	.mainboxinput div{font-size: 30px;line-height: 60px;color:#289335;text-indent: 3em;}
	.mainboxinput{width: 100%;height: 100%;background: url(img/backtree.png) no-repeat center top;background-size: cover;}
	.mainboxinput form{width: 580px;margin: 0 auto;padding-right:10px;margin-top: 60px; }
	.mainboxinput button{font-size: 36px;height:60px;line-height:60px;width:500px;border-radius: 30px;background:-webkit-linear-gradient(top,#55B52F 0,#289335 100%);color: white;position: relative;left: -45px;}
	.mainboxinput .btn{text-align: center;margin-top: 15px;letter-spacing: 2px;}
	.mainboxinput .prompt span{font-size: 32px;color: #289335;line-height:100px;display: inline-block;}

	.mainboxinput .prompt{position: fixed;left: 0;top: 0;bottom: 0;right: 0;background: rgba(0,0,0,0.6);display: none;text-align: center;}
	.mainboxinput .prompt p{position: absolute;left: 50%;top: 50%;margin-left: -250px;margin-top: -215px;height: 200px;width: 500px;height: 200px;border-radius: 30px;background: rgba(255,255,255,0.6);text-align: center;text-indent: 0;}
	.mainboxinput .prompt input{font-size: 36px;line-height: 60px;height: 60px;width: 400px;border-radius: 30px;background:-webkit-linear-gradient(top,#55B52F 0,#289335 100%);color: white;color: white;}
	.mainboxinput .mask{position: fixed;left: 0;top: 0;bottom: 0;right: 0;background: rgba(0,0,0,0.6);text-align: center;display: none;}
	.mainboxinput .mask strong{width: 500px;height: 100px;line-height: 100px;border: 1px solid white;background: rgba(255,255,255,0.9);margin-top:300px;font-size: 28px;display: inline-block;border-radius: 20px;}
	.mainboxinput h3{height: 80px;line-height: 80px;font-size: 40px;color: #289335;text-align: center;text-shadow:3px 3px #99FF99;margin-top: 60px;}
	.mask{position: fixed;left: 0;top: 0;bottom: 0;right: 0;background: rgba(0,0,0,0.7);z-index: 100;text-align: center;display: none;}
	.mask strong{font-size: 30px;color: white;display: inline-block;margin-top: 300px;}
	</style>
</head>
<body>
	<div class="mainboxinput clearfix">
		<h3>请填写您的信息</h3>
		<form action="" method="post">
			<ul>
				<li><span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</span><input type="text" name="username" placeholder="请填写姓名"></li>
				<li><span>手机号码：</span><input type="text" name="telnumber" placeholder="请填写手机号码"></li>
				<li><span>收件地址：</span><input type="text" name="local" placeholder="请填写收件地址"></li>
				<li><span>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;编：</span><input type="text" name="zipcode" placeholder="请填写邮编"></li>
				<!-- 填写种类的input -->
				<!-- <input type="hidden" name="prizeType" value=""> -->
				<li> <input id="openId" name="openId" hidden="true"></li>
			</ul>
			<input type="hidden" name="type" value="hehehe">
			<div>*请认真填写，提交后不予更改</div>
		</form>
		<div class="btn"><button>确认领奖</button></div>
		<!-- 提示框 -->
		<div class="prompt clearfix">
			<p>
				<span>手机号有误，请认真填写</span>
				<input type="button" value="返回重新填写">
			</p>
		</div>
	</div>
	<div class="mask clearfix">
		<strong>您已经提交过信息，不能重复提交</strong>
	</div>
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript">
		 var openId = "${openId}";
	$(function(){
		// 页面加载判断是否已经领过将
		$("#openId").val(openId);
		$.ajax({ 
		  type:'POST',
		  dataType:'json',
		  data:{"first":1},
		  url:'../AppleExchange?d='+Math.random()+"&openId="+openId, 
		  success:function(data){
		  	// formData=1说明已经领过了
		  	// 等于0说明没有领过
		  	if(data.formData == 1){
		  		$('.mask').fadeIn('fast');
		  	}
		  }
		});  
		$('button').on('click',function(){
			var formdata = $("form").serialize();
			$('.prompt input').on('click',function(){
				$('.prompt').css('display','none');
			});
			$.ajax({ 
					  type:'POST',
					  dataType:'json',
					  data:formdata,
					  url:'../AppleExchange?d='+Math.random(),
					  beforeSend:function(){
					  	// 验证姓名是否是空的
					  	if($('input').eq(0).val() == ''){
					  		$('.prompt span').html('请输入姓名');
					  		$('.prompt').fadeIn('fast');
					  		return false;
					  	}
					  	// 验证手机号码是否合理
					    else if(!(/^1[34578]\d{9}$/.test($('input').eq(1).val()))){ 
					        $('.prompt span').html('请输入正确的手机号码');
					  		$('.prompt').fadeIn('fast');  
					        return false; 
					    }
					    else if($('input').eq(2).val() == ''){
					    	$('.prompt span').html('请输入收件地址');
					  		$('.prompt').fadeIn('fast');
					     	return false;
					     }
					     else if(!(/^[0-9][0-9]{5}$/).test($('input').eq(3).val())){
					     	$('.prompt span').html('请输入正确的邮编');
					  		$('.prompt').fadeIn('fast');
					     	return false;
					     }
					     else{
					     	 $('.prompt span').html('正在提交请稍后。。。');
					     	 $('.prompt input').css('display','none');
					     	 $('.prompt').fadeIn('fast');
					     }
					    	
					  },
					  success: function(data) {
						
					  	if(data.ok == 1){
						  	$('.prompt span').html('提交成功<br />请耐心等待奖品配送');
						  	$('.prompt input').css('display','none');
						  	setTimeout(function(){
						  		window.location.href = './indexnext.jsp?c='+Math.random()+"&openId="+openId;
						  	},1200);
					  	}else{
					  		$('.prompt').css('display','none');	
					  		alert('提交失败，请刷新后重新提交');
					  	}
					  },
					  error:function(){
					  	alert('网络链接失败，请检查您的网络');
					  }
					    
				});
				// ajaxover	  
			$('body').on('touchmove',function(){
				return false;
			})	
		});
	})
	</script>
</body>
</html>