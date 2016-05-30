<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>作业提交系统</title>
    <%@include file="/WEB-INF/pages/common/taglib.jsp"%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

     <script type="text/javascript" src="${ctx}resources/js/system.js"> </script>
  <script type="text/javascript">if (top.location != self.location) {top.location = self.location;}</script>
  </head>
  	<body class="easyui-layout" style="overflow-y: hidden"  fit="true"   scroll="no">
		<noscript>
			<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
			    <img src="${ctx}resources/images/noscript.gif" alt='抱歉，请开启脚本支持！' />
			</div>
		</noscript>
		<div id="loading-mask" style="position:absolute;top:0px; left:0px; width:100%; height:100%; background:#D2E0F2; z-index:20000">
		<div id="pageloading" style="position:absolute; top:50%; left:50%; margin:-120px 0px 0px -120px; text-align:center;  border:2px solid #8DB2E3; width:200px; height:40px;  font-size:14px;padding:10px; font-weight:bold; background:#fff; color:#15428B;"> 
		    <img src="${ctx}resources/images/loading.gif" align="absmiddle" /> 正在加载中,请稍候...</div>
		</div>
		<!--顶部信息-->
	    <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
	        background: url(${ctx}resources/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
	        line-height: 20px;color: #fff; font-family: Verdana,微软雅黑,黑体">
	        <span style="float:right; padding-right:20px;" class="head">欢迎  <%=request.getSession().getAttribute("user_name") %> &nbsp; <a href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a></span>
	        <span style="padding-left:10px; font-size: 16px; "><img src="${ctx}resources/images/blocks.gif" width="20" height="20" align="absmiddle" /> 作业提交系统</span>
	    </div>

		<!--底部信息-->
	    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
	        <div class="footer">版权所有</div>
	    </div>

	    <!--左侧菜单状态结构-->
	    <div region="west" split="true"  title="导航菜单" style="width:180px;" id="west">
            <%@include file="/WEB-INF/pages/common/menu.jsp"%>
	    </div>

	    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
	        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
				<div title="首页" style="padding:20px;overflow:hidden; color:red;" >
					<img alt="" src="${ctx}resources/images/index.png"  style="width: 100% ;height: 100%" />
				</div>
			</div>
	    </div>
	    
	    <!--修改密码窗口-->
	    <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false" maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;background: #fafafa;">
	        <div class="easyui-layout" fit="true">
	           <form id="inputForm" action="${ctx}user/resetpwd.html" method="post">
	           		<div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
	                <table cellpadding=3>
	                    <tr>
	                        <td>新&nbsp;密&nbsp;码：</td>
	                        <td><input id="newpwd" type="Password" name="newpwd" class="easyui-textbox easyui-validatebox" style="width:150px;" data-options="required:true,validType:'length[6,16]'" invalidMessage="请输入6至16位的新密码！"/></td>
	                    </tr>
	                    <tr>
	                        <td>确认密码：</td>
	                        <td><input id="renewpwd" type="Password" name="renewpwd" class="easyui-textbox easyui-validatebox" style="width:150px;" data-options="required:true,validType:'equalTo[#newpwd]'"  invalidMessage="两次输入密码不匹配！"/></td>
	                    </tr>
	                </table>
		            </div>
		            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
		                <a id="btnEp" class="easyui-linkbutton" onclick="resetPwd()" icon="icon-ok" href="javascript:void(0)" >确定</a>
		                 <a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
		            </div>
	           </form>
	        </div>
	    </div>

		<div id="mm" class="easyui-menu" style="width:150px;">
			<div id="tabupdate">刷新</div>
			<div class="menu-sep"></div>
			<div id="close">关闭</div>
			<div id="closeall">全部关闭</div>
			<div id="closeother">除此之外全部关闭</div>
			<div class="menu-sep"></div>
			<div id="closeright">当前页右侧全部关闭</div>
			<div id="closeleft">当前页左侧全部关闭</div>
			<!--<div class="menu-sep"></div>
			<div id="exit">退出</div>-->
		</div>
  </body>
  
  <script type="text/javascript">
  		function resetPwd(){
  			$('#inputForm').submit();
  		}
	    $(function(){
	    	var msg = "${msg}";
	    	if(msg!=''){
	    		show("",msg);
	    	}
	   });
  </script>
</html>
