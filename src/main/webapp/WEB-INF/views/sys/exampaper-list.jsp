<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<div class="col-xs-10">
  <div class="panel panel-info">
    <div class="panel-heading">
      <h3 class="panel-title">
        <span class="glyphicon glyphicon-align-justify"></span>
        &nbsp;试卷信息管理
      </h3>
    </div>
    <div class="panel-body">
	    <%@include file="/common/show-message.jsp" %>
	    <div>
	      <a class="btn btn-primary pull-left" href="${ctx}/exampaper/input">新增</a>
	      <!-- 暂时装饰用 -->
	      <div class="input-group pull-right" style="width: 200px;">
            <input type="text" class="form-control" placeholder="Search">
            <div class="input-group-btn">
              <button class="btn btn-default" type="submit">搜索</button>
            </div>
          </div>
	    </div>
		<table class="table table-bordered">
      	<tr>
      	  <th>试卷名称</th>
      	  <th>试卷描述</th>
      	  <th>出题人</th>
      	  <th>操作</th>
      	</tr>
		<c:forEach items="${entities}" var="exampaper">
		  <tr>
			<td><c:out value="${exampaper.name}" /></td>
			<td><c:out value="${exampaper.description}" /></td>
			<td><c:out value="${exampaper.sysModifyLog.creator.name}"/></td>
			<td>
			  <a class="btn btn-info btn-sm" href="${ctx}/exampaper/detail?id=${exampaper.id}">查看</a>
			  <a class="btn btn-warning btn-sm" href="${ctx}/exampaper/input?id=${exampaper.id}">修改</a>
			  <a class="btn btn-danger btn-sm" href="${ctx}/exampaper/delete?id=${exampaper.id}">删除</a>
			</td>
		  </tr>
		</c:forEach>
	  </table>
    </div>
  </div>
</div>
