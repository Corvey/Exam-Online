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
      <form:form action="${ctx}/resource/save" method="post" 
        cssClass="form-horizontal" modelAttribute="entity" enctype="multipart/form-data">
        <form:hidden path="id"/>
        <div class="form-group">
          <label for="type" class="col-md-2 control-label">资源名称</label>
          <div class="col-md-5">
            <form:input cssClass="form-control" path="name"/>
          </div>
        </div>
        <div class="form-group">
          <label for="content" class="col-md-2 control-label">所需积分</label>
          <div class="col-md-5">
            <form:input path="price" type="number" min="0" step="1"/>
          </div>
        </div>
        <div class="form-group">
          <label for="content" class="col-md-2 control-label">上传文件</label>
          <div class="col-md-5">
            <input name="file" type="file" accept="text/plain, application/msword, application/vnd.ms-excel, application/pdf"/>
          </div>
        </div>
        <div class="form-group">
          <label for="content" class="col-md-2 control-label">资源描述</label>
          <div class="col-md-5">
            <form:textarea path="description" cssStyle="width: 100%;"/>
          </div>
        </div>
        <div class="col-md-9 text-center"><hr/>
	      <button class="btn btn-primary" type="submit">提交</button>
	      &emsp;&emsp;&emsp;&emsp;
	      <a class="btn btn-warning" href="${ctx}/resource/list">返回</a>
        </div>
      </form:form>
    </div>
  </div>
</div>
