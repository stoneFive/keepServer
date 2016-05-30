
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav" class="easyui-accordion"  border="false">
<c:choose>
	<c:when test="${sessionScope.userType == 1 }">
		 <div title="学生中心" iconCls="icon-light" selected="true" style="overflow:auto;padding:6px;">
	                <ul class="easyui-tree navlist">
	                        <li>
	                            <span><a link="${ctx}student/info.html">个人基本信息</a></span>
	                        </li>
	                        <li>
	                            <span><a link="${ctx}task/personal.html">作业任务</a></span>
	                        </li>
	                </ul>
           </div>
	</c:when>
	<c:when test="${sessionScope.userType == 2 }">
	
		<div title="教师中心" iconCls="icon-light" selected="true" style="overflow:auto;padding:6px;">
	                <ul class="easyui-tree navlist">
	                        <li>
	                            <span><a link="${ctx}student/index.html">学生信息</a></span>
	                          
	                        </li>
	                        <li>
	                            <span><a link="${ctx}course/index.html">课程信息</a></span>
	                          
	                        </li>
	                        <li>
	                              <span><a link="${ctx}organ/index.html">组织机构</a></span>
	                          
	                        </li>
	                        <li>
	                              <span><a link="${ctx}task/index.html">课程任务</a></span>
	                          
	                        </li>
	                       
	                </ul>
	            </div>
	</c:when>
	<c:otherwise>
		<div title="系统管理" iconCls="icon-light" selected="true" style="overflow:auto;padding:6px;">
               <ul class="easyui-tree navlist">
                     <li>
                        <span><a link="${ctx}user/index.html">用户管理</a></span>
                    </li>
               </ul>
          </div>
	       
	       <div title="学生中心" iconCls="icon-light" selected="true" style="overflow:auto;padding:6px;">
	                <ul class="easyui-tree navlist">
	                        <li>
	                            <span><a link="${ctx}student/info.html">个人基本信息</a></span>
	                        </li>
	                        <li>
	                            <span><a link="${ctx}task/personal.html">作业任务</a></span>
	                        </li>
	                </ul>
           </div>
	          
          <div title="教师中心" iconCls="icon-light" selected="true" style="overflow:auto;padding:6px;">
               <ul class="easyui-tree navlist">
                       <li>
                           <span><a link="${ctx}student/index.html">学生信息</a></span>
                         
                       </li>
                       <li>
                           <span><a link="${ctx}course/index.html">课程信息</a></span>
                         
                       </li>
                       <li>
                             <span><a link="${ctx}organ/index.html">组织机构</a></span>
                         
                       </li>
                       <li>
                             <span><a link="${ctx}task/index.html">课程任务</a></span>
                         
                       </li>
                      
               </ul>
           </div>
	</c:otherwise>
</c:choose>


           
</div>