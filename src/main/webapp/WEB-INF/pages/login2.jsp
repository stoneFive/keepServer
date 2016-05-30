<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>北京联通校园网运营后台管理系统</title>
  	<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  	 <style type="text/css">
      	a{text-decoration:none;color:black;}
      	body{background-color:#DDD;}
  	 </style>
  	 <script type="text/javascript">if (top.location != self.location) {top.location = self.location;}</script>
     <script type="text/javascript">
     function check_f(){
         var name=$("#username").val();
         var pwd=$("#pwd").val();
         var code=$("#authcode").val();
         if(name==""||pwd==""||code==""){alertMsg('请如入完整信息！',"info");return false;}
            $("#loginForm").submit();
     }
          
          function reflashAuthCode(){
        	  var verify=document.getElementById('safecode');
        	    verify.setAttribute('src','${ctx}authcode.html?'+Math.random());
          }
          
          $(function(){
              $('input').bind('keypress',function(event){
                  if(event.keyCode == "13")    
                  {
                	  check_f();
                  }
              });
              
              
              
          });
     </script>
  <body>
    <div style="margin:0 auto;width:900px;">
            <div id="mywin" class="easyui-window" minimizable="false" closable="false" maximizable="false"  collapsible="false"  title="北京联通校园网运营管理平台" style="width:380px;height:250px;">
                <form action="${ctx}login.html" method="post" style="padding:10px 20px 10px 40px;" id="loginForm" name="login_f">
                    <table width="100%">
                    <tr><td style="text-align: right; width: 25%"></td>
                    	<td style="color: red;"><c:if test="${empty error}"><div style="margin:10px 0;"></div></c:if>
                    	<c:if test="${!empty error}">${error}</c:if></td>
                    <tr height="35px;">
                    	<td style="text-align: right; width: 25%">用户名: </td>
                    	<td><input class="easyui-textbox" type="text" id="username" name="username" style="width:155px"/></td>
                    </tr>
                    <tr height="35px;">
                    	<td style="text-align: right; width: 25%">密&nbsp;&nbsp;码: </td>
                    	<td><input class="easyui-textbox"  id="pwd" type="password" name="password" style="width:155px"></td>
                    </tr>
                    <tr height="35px;">
                    	<td style="text-align: right; width: 25%">验证码:</td>
                    	<td>
                    		<input class="easyui-textbox" type="text" id="authcode" name="authCode" style="width:80px;"/>
                    		<img src="${ctx}authcode.html" id="safecode" onclick="reflashAuthCode()" style="top:7px;position:relative; cursor: pointer;" title="看不清点击换一张！" width="70" height="20"/>
                    	</td>
                    </tr>
                    <tr height="45px;">
                    	<td colspan="2">
                    		<div style="padding:5px;text-align:center;">
		                        <a href="#" class="easyui-linkbutton" style="margin-right: 25px;" icon="icon-ok" onclick="check_f()">登录</a>
		                        <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="document.login_f.reset()">重置</a>
	                    	</div>
                    	</td>
                    </tr>
                   
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
