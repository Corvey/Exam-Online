<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<div class="col-xs-10">
  <div class="panel panel-info">
    <div class="panel-heading">
      <h3 class="panel-title">
        <span class="glyphicon glyphicon-align-justify"></span>
        &nbsp;题目信息管理
      </h3>
    </div>
    <div class="panel-body">
	    <%@include file="/common/show-message.jsp" %>
	    <div>
	      <a class="btn btn-primary pull-left" href="${ctx}/question/input">新增</a>
	      <form action="${ctx}/question/search" method="post">
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
      	  <th>题目类型</th>
      	  <th>题干</th>
      	  <th>操作</th>
      	</tr>
		<c:forEach items="${entities}" var="question">
		  <tr>
			<td><c:out value="${question.type}" /></td>
			<td><c:out value="${question.content}" /></td>
			<td>
			  <a class="btn btn-info btn-sm" href="${ctx}/question/detail?id=${question.id}">查看</a>
			  <a class="btn btn-warning btn-sm" href="${ctx}/question/input?id=${question.id}">修改</a>
			  <a class="btn btn-danger btn-sm" href="${ctx}/question/delete?id=${question.id}">删除</a>
			</td>
		  </tr>
		</c:forEach>
	  </table>
    </div>
  </div>
</div>
