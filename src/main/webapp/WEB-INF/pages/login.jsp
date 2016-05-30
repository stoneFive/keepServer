<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
	<%@include file="/WEB-INF/pages/common/taglib.jsp"%>

<link href="${ctx}resources/css/login2.css" rel="stylesheet" type="text/css" /> 

<script type="text/javascript">

var $winLogin;
var $regWin;
$(function (){
	
	
	$winLogin = $('#loginW').window({
	    title: '作业综合管理系统',
	    width: 380,
	    height: 350,
	    top: ($(window).height() -350) * 0.5,
	    left: ($(window).width() - 380) * 0.5,
	    shadow: true,
	    modal: true,
	    minimizable: false,
	    maximizable: false,
	    collapsible: false,
	    closed:false,
	    closable:false
	});
	$regWin = $('#regWin').window({
	    title: '欢迎注册',
	    width: 380,
	    height: 350,
	    top: ($(window).height() -350) * 0.5,
	    left: ($(window).width() - 380) * 0.5,
	    shadow: true,
	    modal: true,
	    minimizable: false,
	    maximizable: false,
	    collapsible: false,
	    closed:true,
	    onClose:function(){
	    	window.location.href= window.location.href;
	    
	    }
	});
	
	var msg = "${msg}";
	if(msg!=''){
		show("",msg);
	}

})	
	
function showRegist(){
	$winLogin.window('close');
	$regWin.window('open');
	
}

</script>


<script type="text/javascript">if (top.location != self.location) {top.location = self.location;}</script>
     <script type="text/javascript">
     function check_f(){
         var name=$("#username").val();
         var pwd=$("#pwd").val();
         var code=$("#authcode").val();
         if(name==""||pwd==""||code==""){alertMsg('请如入完整信息！',"info");return false;}
            $("#loginForm").submit();
     }
     function check_r(){
         var name=$("#rusername").val();
         var pwd=$("#rpwd").val();
         var pwd1=$("#compwd").val();
         if(name==""||pwd==""||pwd1==""){
        	 	alertMsg('请如入完整信息！',"info");
        	 	return false;
       	 	}
         //alert($("#regForm").attr('action'));
            $("#regForm").submit();
     }
          
          function reflashAuthCode(){
        	  var verify=document.getElementById('safecode');
        	    verify.setAttribute('src','${ctx}authcode.html?'+Math.random());
          }
          
    
     </script>

</head>
<body>


<div id="loginW" class="easyui-window" title="Login" style="width: 300px; height: 180px;">
   <form action="${ctx}login.html" method="post" style="padding:10px 20px 10px 40px;" id="loginForm" name="login_f">
                    <table width="100%">
                    <tr><td style="text-align: right; width: 25%"></td>
                    	<td style="color: red;"><c:if test="${empty error}"><div style="margin:10px 0;"></div></c:if>
                    	<c:if test="${!empty error}">${error}</c:if></td>
                    <tr height="35px;">
                    	<td style="text-align: right; width: 25%">用户名: </td>
                    	<td><input class="easyui-textbox" type="text" id="username" name="username" style="width:155px" value=""  /></td>
                    </tr>
                    <tr height="">
                    	<td style="text-align: right; width: 25%">&nbsp;</td>
                    	<td><span style="color: #b3b3b3" >* 请输入学号或者教师工号</span></td>
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
                    <tr height="35px;">
                    	<td style="text-align: right; width: 25%">&nbsp;</td>
                    	<td >
                    		&nbsp;&nbsp;<a href="javaScritp:void(0);" onclick="showRegist();" style="font-size: 14px" >我要注册</a>
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
<div id="regWin" class="easyui-window" title="Login" style="width: 300px; height: 180px;">
   <form action="${ctx}register.html" method="post" style="padding:10px 20px 10px 40px;" id="regForm" name="reg_f">
                    <table width="100%">
                    <tr><td style="text-align: right; width: 25%"></td>
                    	<td style="color: red;"><c:if test="${empty regError}"><div style="margin:10px 0;"></div></c:if>
                    	<c:if test="${!empty regError}">${regError}</c:if></td>
                    <tr height="35px;">
                    	<td style="text-align: right; width: 25%">学号: </td>
                    	<td><input class="easyui-textbox" type="text" id="rusername" name="username" style="width:155px"/></td>
                    </tr>
                    <tr height="35px;">
                    	<td style="text-align: right; width: 25%">密&nbsp;&nbsp;码: </td>
                    	<td><input class="easyui-textbox"  id="rpwd" type="password" name="password" style="width:155px"></td>
                    </tr>
                    <tr height="35px;">
                    	<td style="text-align: right; width: 25%">确认密码: </td>
                    	<td><input class="easyui-textbox"  id="compwd" type="password" name="" style="width:155px"></td>
                    </tr>
                    
                    
                    <tr height="45px;">
                    	<td colspan="2">
                    		<div style="padding:5px;text-align:center;">
		                        <a href="#" class="easyui-linkbutton" style="margin-right: 25px;" icon="icon-ok" onclick="check_r()">注册</a>
		                        <a href="#" class="easyui-linkbutton" icon="icon-cancel" onclick="document.login_f.reset()">重置</a>
	                    	</div>
                    	</td>
                    </tr>
                   
                    </table>
                </form>
</div>

</body>
</html>