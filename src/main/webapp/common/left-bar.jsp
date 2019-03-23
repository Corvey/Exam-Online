<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div class="col-xs-2 my-nav-bar">
  <div class="panel panel-info">
    <div class="panel-heading">
      <h3 class="panel-title">
        <span class="glyphicon glyphicon-th-list"></span>&nbsp;信息管理
      </h3>
    </div>
    <div class="list-group">
      <a class="list-group-item" href="${ctx}/sys/user/list">用户管理</a>
      <a class="list-group-item" href="${ctx}/exampaper/list">试卷管理</a>
      <a class="list-group-item" href="${ctx}/question/list">题目管理</a>
      <a class="list-group-item" href="${ctx}/resource/list">资源管理</a>
      <a class="list-group-item" href="${ctx}/exam/list">考试管理</a>
      <a class="list-group-item" href="${ctx}/examresult/list">成绩管理</a>
    </div>
  </div>
</div>
