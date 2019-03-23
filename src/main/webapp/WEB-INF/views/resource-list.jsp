<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<div class="col-xs-10">
  <div class="panel panel-info">
    <div class="panel-heading">
      <h3 class="panel-title">
        <span class="glyphicon glyphicon-align-justify"></span>
        &nbsp;资源信息管理
      </h3>
    </div>
    <div class="panel-body">
	    <%@include file="/common/show-message.jsp" %>
	    <div>
	      <a class="btn btn-primary pull-left" href="${ctx}/resource/input">新增</a>
	      <form action="${ctx}/resource/adminSearch" method="post">
	        <div class="input-group pull-right" style="width: 200px;">
              <input type="text" class="form-control" placeholder="Search" name="keyword">
              <div class="input-group-btn">
                <button class="btn btn-default" type="submit">搜索</button>
              </div>
          </div>
          </form>
	    </div>
		<table class="table table-bordered">
      	<tr>
      	  <th>资源名称</th>
      	  <th>原文件名</th>
      	  <th>资源大小（字节）</th>
      	  <th>所需积分</th>
      	  <th>操作</th>
      	</tr>
		<c:forEach items="${entities}" var="resource">
		  <tr>
			<td><c:out value="${resource.name}" /></td>
			<td><c:out value="${resource.fileName}"/></td>
			<td><c:out value="${resource.fileSize}" /></td>
			<td><c:out value="${resource.price}" /></td>
			<td>
			  <a class="btn btn-info btn-sm" href="${ctx}/resource/detail?id=${resource.id}">查看</a>
			  <a class="btn btn-warning btn-sm" href="${ctx}/resource/input?id=${resource.id}">修改</a>
			  <a class="btn btn-danger btn-sm" href="${ctx}/resource/delete?id=${resource.id}">删除</a>
			</td>
		  </tr>
		</c:forEach>
	  </table>
    </div>
  </div>
</div>
