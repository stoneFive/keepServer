<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>后台管理系统</title>
    <%@include file="/WEB-INF/pages/common/taglib.jsp"%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  	<body>
    <div>
    <form id="inputForm" action="${ctx}user/index.html" method="post">
        <input type="hidden" name="page" id="page" value="${param['page']}">
        <input type="hidden" name="pageSize" id="pageSize" value="${param['pageSize']}">
        用户名:<input name="search_LIKES_account" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_account']}">
        姓名:<input name="search_LIKES_realeName" style="width: 100px;" class="easyui-textbox" value="${param['search_LIKES_realeName']}">
        状态： <select class="easyui-combobox" style="width: 100px;" data-options="panelHeight:'auto'" name="search_EQI_status">
                    <option value="">全部</option>
                    <option value="1" ${param['search_EQI_status'] eq 1?"selected":""}>正常</option>
                    <option value="2" ${param['search_EQI_status'] eq 2?"selected":""}>禁用</option>
             </select>
        创建时间:<input name="search_GTED_createTime" class="easyui-datetimebox" value="${param['search_GTED_createTime']}" style="width:155px">
        至<input name="search_LTD_createTime" class="easyui-datetimebox" value="${param[search_LTD_createTime]}" style="width:155px">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="submitForm()" style="width:80px">Search</a>
    </form>
        <a href="${ctx}user/edit.html" class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:80px">添加</a>
    </div>
    <table id="tt" class="easyui-datagrid" style="width:100%;height:auto;">
        <thead>
        <tr>
            <th field="name1" width="15%">账户</th>
            <th field="name2" width="15%">姓名</th>
            <th field="name3" width="15%">联系电话</th>
            <th field="name4" width="15%">用户类型</th>

            <th field="name5" width="20%">创建时间</th>
            <th field="name6" width="10%">状态</th>
            <th field="name7" width="20%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${page.content}" var="entity">
            <tr>
                <td>${entity.account}</td>
                <td>${entity.realeName}</td>
                <td>${entity.phone}</td>
                <td>
                
                	<c:choose>
                		<c:when test=" ${entity.uType eq 1 }"> 学生</c:when>
                		<c:when test="${entity.uType eq 2 }">教师</c:when>
                		<c:otherwise>
                			管理员
                		</c:otherwise>
                	</c:choose>
                </td>
                
                <td><fmt:formatDate value="${entity.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${entity.status eq 1?"正常":"禁用"}</td>
                <td>
                	<c:choose>
                		<c:when test="${ entity.account  eq 'admin'}"></c:when>
     					<c:otherwise>
     						<a href="${ctx}user/edit.html?id=${entity.id}">修改</a>&nbsp;
     					</c:otherwise>
     	           	</c:choose>
                	
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="margin:20px 0;"></div>
    <div class="easyui-panel" style="width:100%">
        <div id="pagination" class="easyui-pagination" data-options="
					total: ${page.totalElements},
					pageSize:${page.size},
					pageNumber:${page.number+1},
					showPageList: true,
					pageList:[10,20,30],
					showRefresh: false,
					onSelectPage:selectPage,
					beforePageText:'第',
					afterPageText:'页，共{pages}页',
					displayMsg: '显示{from} - {to} 条数据，共{total}条'"></div>
    </div>
  </body>
  
  <script type="text/javascript">
  	
  </script>
</html>
