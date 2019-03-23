<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<div class="col-xs-10">
  <div class="panel panel-info">
    <div class="panel-heading">
      <h3 class="panel-title">
        <span class="glyphicon glyphicon-align-justify"></span>
        &nbsp;考试管理
      </h3>
    </div>
    <div class="panel-body">
	    <%@include file="/common/show-message.jsp" %>
	    <div>
	      <a class="btn btn-primary pull-left" href="${ctx}/exam/input">新增</a>
	      <form action="${ctx}/exam/adminSearch" method="post">
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
      	  <th>考试名称</th>
      	  <th>考试试卷</th>
      	  <th>发布者</th>
      	  <th>操作</th>
      	</tr>
		<c:forEach items="${entities}" var="exam">
		  <tr>
			<td><c:out value="${exam.name}" /></td>
			<td><c:out value="${exam.exampaper.name}" /></td>
			<td><c:out value="${exam.sysModifyLog.creator.name}"/></td>
			<td>
			  <a class="btn btn-info btn-sm" href="${ctx}/exam/detail?id=${exam.id}">查看</a>
			  <a class="btn btn-warning btn-sm" href="${ctx}/exam/input?id=${exam.id}">修改</a>
			  <a class="btn btn-danger btn-sm" href="${ctx}/exam/delete?id=${exam.id}">删除</a>
			</td>
		  </tr>
		</c:forEach>
	  </table>
    </div>
  </div>
</div>
