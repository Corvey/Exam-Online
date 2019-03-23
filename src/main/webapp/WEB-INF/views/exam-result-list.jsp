<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<div class="col-xs-10">
  <div class="panel panel-info">
    <div class="panel-heading">
      <h3 class="panel-title">
        <span class="glyphicon glyphicon-align-justify"></span>
        &nbsp;成绩管理
      </h3>
    </div>
    <div class="panel-body">
	    <%@include file="/common/show-message.jsp" %>
	    <div>
	      <a class="btn btn-primary pull-left" href="${ctx}/examresult/input">新增</a>
	      <!-- 暂时装饰用 -->
	      <!-- <div class="input-group pull-right" style="width: 200px;">
            <input type="text" class="form-control" placeholder="Search">
            <div class="input-group-btn">
              <button class="btn btn-default" type="submit">搜索</button>
            </div>
          </div> -->
	    </div>
		<table class="table table-bordered">
      	<tr>
      	  <th>考试名称</th>
      	  <th>考试用户</th>
      	  <th>成绩</th>
      	  <th>操作</th>
      	</tr>
		<c:forEach items="${entities}" var="result">
		  <tr>
			<td><c:out value="${result.exam.name}" /></td>
			<td><c:out value="${result.user.name}" /></td>
			<td><c:out value="${result.grade}"/></td>
			<td>
			  <a class="btn btn-info btn-sm" href="${ctx}/examresult/detail?id=${result.id}">查看</a>
			  <a class="btn btn-warning btn-sm" href="${ctx}/examresult/input?id=${result.id}">修改</a>
			  <a class="btn btn-danger btn-sm" href="${ctx}/examresult/delete?id=${result.id}">删除</a>
			</td>
		  </tr>
		</c:forEach>
	  </table>
    </div>
  </div>
</div>
