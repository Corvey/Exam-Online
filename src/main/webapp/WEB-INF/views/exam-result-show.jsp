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
              <span class="glyphicon glyphicon-th-list"></span>&nbsp;我的成绩
            </h3>
          </div>
          <div class="panel-body">
            <%@include file="/common/show-message.jsp"%>
            <!-- <div>
        <div class="input-group pull-right" style="width: 200px;">
            <input type="text" class="form-control" placeholder="Search">
            <div class="input-group-btn">
              <button class="btn btn-default" type="submit">搜索</button>
            </div>
          </div>
      </div> -->
            <table class="table table-bordered">
              <tr>
                <th>考试名称</th>
                <th>考试试卷</th>
                <th>考试日期</th>
                <th>成绩</th>
              </tr>
              <c:forEach items="${entities}" var="result">
                <tr>
                  <td><c:out value="${result.exam.name}" /></td>
                  <td><c:out value="${result.exam.exampaper.name}" /></td>
                  <td><c:out value="${result.sysModifyLog.createDate}" /></td>
                  <td><c:out value="${result.grade}" /></td>
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