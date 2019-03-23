<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<div class="col-xs-10">
  <div class="panel panel-info">
    <div class="panel-heading">
      <h3 class="panel-title">
        <span class="glyphicon glyphicon-align-justify"></span> &nbsp;成绩管理
      </h3>
    </div>
    <div class="panel-body">
      <form:form action="${ctx}/examresult/save" method="post"
        cssClass="form-horizontal" modelAttribute="entity">
        <form:hidden path="id" />
        <div class="form-group">
          <label for="name" class="col-sm-2 control-label">考试</label>
          <div class="col-sm-4">
            <form:select cssClass="form-control" path="examId" 
              items="${exams}" itemLabel="name" itemValue="id"/>
          </div>
        </div>
        <div class="form-group">
          <label for="description" class="col-sm-2 control-label">考试用户</label>
          <div class="col-sm-4">
            <form:select cssClass="form-control" path="userId" 
              items="${users}" itemLabel="name" itemValue="id"/>
          </div>
        </div>
        <div class="form-group">
          <label for="description" class="col-sm-2 control-label">成绩</label>
          <div class="col-sm-4">
            <form:input cssClass="form-control" path="grade" type="number" step="1"/>
          </div>
        </div>
        <div class="col-md-8 text-center">
          <button class="btn btn-primary" type="submit">提交</button>
          &emsp;&emsp;&emsp;&emsp;
          <a class="btn btn-warning" href="${ctx}/examresult/list">返回</a>
        </div>
      </form:form>
    </div>
  </div>
</div>