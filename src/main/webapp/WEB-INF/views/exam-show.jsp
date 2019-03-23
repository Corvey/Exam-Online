<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>

<head>
<%@include file="/common/head.jsp"%>
</head>

<body>
  <%@include file="/common/header.jsp"%>
  <div class="container">
    <div class="row">
      <div class="col-md-offset-1 col-md-10">
        <div class="panel panel-info">
          <div class="panel-heading">
            <h3 class="panel-title">
              <span class="glyphicon glyphicon-th-list"></span>&nbsp;所有考试
            </h3>
          </div>
          <div class="panel-body">
            <%@include file="/common/show-message.jsp"%>
            <div>
              <form action="${ctx}/exam/search" method="post">
                <div class="input-group pull-right" style="width: 200px;">
                  <input type="text" class="form-control" placeholder="Search"
                    name="keyword">
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
                <th>考试时间（分钟）</th>
                <th>操作</th>
              </tr>
              <c:forEach items="${entities}" var="exam">
                <tr>
                  <td><c:out value="${exam.name}" /></td>
                  <td><c:out value="${exam.exampaper.name}" /></td>
                  <td><c:out value="${exam.time}" /></td>
                  <td><a class="btn btn-primary btn-sm"
                    href="${ctx}/exam/start?id=${exam.id}">参加考试</a></td>
                </tr>
              </c:forEach>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
<script>
</script>
</html>