<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script src="/weixin_pintu/QRCODE/js/jquery.min.js"></script>
  <script type="text/javascript">
  function clickme(){
 // alert("come on!")
  }
  
  $(function($) {
 /*  alert("we are ready!!");   */
     var u = navigator.userAgent;
     var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1;
 //android终端

     var isiOS =  !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
/*      alert("iaandrio"+isAndroid);
     alert("isiOS"+isiOS); */
     if(isiOS){
       document.getElementById("clickmeaios").click();
     }else if (isAndroid){
       document.getElementById("clickmea").click();
     }else{
       alert("无法判断您的系统类型,请手动编辑短信,谢谢!")
     }
  });
  </script>
  
  <body>
   <a href="sms:10010?body=content" id="clickmea" style="display:none" ></a>
   <a href="sms:10010&body=content" id="clickmeaios" style="display:none" ></a>
  </body>
</html>
