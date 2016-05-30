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
系统管理--><a href="${ctx}user/index.html">用户管理</a>-->给用户[${entity.realName}]授权
<div class="easyui-panel" title="用户授权" style="width:100%">
    <div style="text-align: center;">
        <form id="inputForm" action="${ctx}user/auth.html" method="post">
        <input name="id" type="hidden" value="${entity.id}">
            <table cellpadding="5" style="width: 100%">
                <tr>
                    <td style="width:30%;text-align: right;padding-right: 10px;">角色名称:</td>
                    <td style="text-align: left;padding-left: 10px;">
                    	<c:forEach items="${roles}" var="role">
						<input type="checkbox" name="rids" value="${role.id}" <c:forEach var="ur" items="${entity.roles}"><c:if test="${role.id==ur.id}">checked</c:if></c:forEach>>${role.name}
					</c:forEach>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                      <div style="text-align:center;padding:5px">
				            <input type="submit" class="button" value="保存">
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
			name: {
				required: true
			},
			roleCode: {
				required: true,
				 remote:{
					 url:'${ctx}role/checkRoleCode.html',
					 type:"post",
					 dataType:"json", 
					 data: {                    
						 userName: function(){return $("#roleCode").val()},
						 id:$("#rid").val()}
				 }
			}
		},
		messages:{
			name: {
				required:"*请输入角色名称！"
			},
			roleCode: {
				required:"*请输入角色代码！",
				remote:"*角色代码已存在！"
			}
		}
	});
	
});
</script>
</html>
