<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<div class="col-xs-10">
  <div class="panel panel-info">
    <div class="panel-heading">
      <h3 class="panel-title">
        <span class="glyphicon glyphicon-align-justify"></span> &nbsp;试卷信息管理
      </h3>
    </div>
    <div class="panel-body">
      <form:form action="${ctx}/exampaper/save" method="post" cssClass="form-horizontal"
        enctype="multipart/form-data" modelAttribute="entity">
        <form:hidden path="id" />
        <div class="form-group">
          <label for="name" class="col-sm-2 control-label"> 试卷名 </label>
          <div class="col-sm-4">
            <form:input cssClass="form-control" path="name" />
          </div>
        </div>
        <div class="form-group">
          <label for="description" class="col-sm-2 control-label">描述</label>
          <div class="col-sm-4">
            <form:textarea cssClass="form-control" path="description" />
          </div>
        </div>
        <div class="form-group">
          <label for="content" class="col-md-2 control-label">题目文件</label>
          <div class="col-md-5">
            <input name="file" type="file" accept="application/vnd.ms-excel,
              application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"/>
          </div>
        </div>
        <div class="col-md-8 text-center">
          <button class="btn btn-primary" type="submit">提交</button>
          &emsp;&emsp;&emsp;&emsp;
          <a class="btn btn-warning" href="${ctx}/exampaper/list">返回</a>
        </div>
      </form:form>
    </div>
  </div>
</div>