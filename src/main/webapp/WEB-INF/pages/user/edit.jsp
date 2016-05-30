<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/WEB-INF/pages/common/taglib.jsp"%>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
</head>
<body>
<div style="margin:5px 0;"></div>
系统管理--><a href="${ctx}user/index.html">用户管理</a>-->${empty entity?"添加":"修改"}用户信息
<div class="easyui-panel" title="${empty entity?"添加":"修改"}用户信息" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}user/save.html" method="post">
        <input name="id" id="uid" type="hidden" value="${entity.id}">
            <table cellpadding="5" align="center" style="width: 100%">
                <tr>
                    <td style="width:47%;text-align: right;padding-right: 10px;">账号:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" id="userName"  name="account" value="${entity.account}" /></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">姓名:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" name="realeName"  value="${entity.realeName}"/></td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">联系电话:</td>
                    <td style="text-align: left;padding-left: 10px;"><input type="text" name="phone"  value="${entity.phone}"/></td>
                </tr>

                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">用户类型:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="uType">
                        <option value="0" selected="selected">------请选择------</option>
                        <option value="2" ${entity.uType eq 2?"selected":""}>老师</option>
                        <option value="3" ${entity.uType eq 3?"selected":""}>管理员</option>
 
                       </select>
                    </td>
                </tr>
                <tr>
                    <td  style="width:47%;text-align: right;padding-right: 10px;">状态:</td>
                    <td style="text-align: left;padding-left: 10px;">
                        <select class="easyui-combobox" data-options="panelHeight:'auto'" name="status">
                        <option value="1" ${entity.status eq 1?"selected":""}>正常</option>
                        <option value="2"  ${entity.status eq 2?"selected":""}>禁用</option>
                       </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
				            <input type="submit" class="button" value="保存">&nbsp;&nbsp;&nbsp;
				            <input type="reset" class="button" value="取消">
				        </div>
                    </td>
                </tr>
            </table>
        </form>
        
    </div>
</div>
</body>
	<script lang="text/javascript">   
	    $(function(){
	    	var msg = "${msg}";
	    	if(msg!=''){
	    		show("",msg);
	    	}
	   	$("#inputForm").validate({
			rules: {
				userName: {
					required: true,
					 remote:{
						 url:'${ctx}user/checkUserName.html',
						 type:"post",
						 dataType:"json", 
						 data: {                    
							 userName: function(){return $("#userName").val()},
							 id:$("#uid").val()}
					 }
				},
				realName: {
					required: true
				},
				phone: {
					required: true
				},
				email:{
					required:true
				}
			},
			messages:{
				userName: {
					required:"*请输入用户名！",
					remote:"*用户名已存在！"
				},
				realName: {
					required:"*请输入姓名！"
				},
				phone: {
					required:"*请输入真实的联系电话！"
				},
				email:{
					required:"*请输入email！"
				}
			}
		});
	   	
	   });
	</script>
</html>
