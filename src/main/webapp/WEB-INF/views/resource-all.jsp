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
            <span class="glyphicon glyphicon-th-list"></span>&nbsp;所有资源
          </h3>
        </div>
        <div class="panel-body">
          <%@include file="/common/show-message.jsp"%>
          <div class="panel">
            <div class="panel-body">
              <button class="btn btn-primary pull-left" data-toggle="modal"
                data-target="#addResourceModal">我要上传资源</button>

              <form action="${ctx}/resource/search" method="post">
                <div class="input-group pull-right" style="width: 200px;">
                  <input type="text" class="form-control" placeholder="Search"
                    name="keyword">
                  <div class="input-group-btn">
                    <button class="btn btn-default" type="submit">搜索</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <!-- 资源 -->
          <c:forEach items="${entities}" var="resource">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">
                  <a href="${ctx}/resource/${resource.id}">${resource.name}</a>
                </h3>
              </div>
              <div class="panel-body">
                <p>${resource.description}</p>
                <p style="text-align: right">
                  <span>上传日期：<fmt:formatDate type="date"
                    value="${resource.sysModifyLog.createDate}" />
                  </span>&emsp;
                  <span>下载次数：${resource.downloadTimes}</span>
                </p>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="addResourceModal" tabindex="-1"
  role="dialog" aria-labelledby="addResourceModalLabel"
  aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
          aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="addResourceModalLabel">标题</h4>
      </div>
      <form action="${ctx}/resource/upload" method="post"
        class="form-horizontal" enctype="multipart/form-data">
        <div class="modal-body">
          <div class="form-group">
            <label for="type" class="col-md-2 control-label">资源名称</label>
            <div class="col-md-5">
              <input type="text" class="form-control" name="name" />
            </div>
          </div>
          <div class="form-group">
            <label for="content" class="col-md-2 control-label">所需积分</label>
            <div class="col-md-5">
              <input name="price" type="number" min="0" step="1"
                class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label for="content" class="col-md-2 control-label">上传文件</label>
            <div class="col-md-5">
              <input name="file" type="file" accept="text/plain, application/msword, 
                application/vnd.ms-excel, application/pdf" />
            </div>
          </div>
          <div class="form-group">
            <label for="content" class="col-md-2 control-label">资源描述</label>
            <div class="col-md-5">
              <textarea name="description" style="width: 100%;"></textarea>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <div class="col-md-9 text-center">
            <button class="btn btn-primary" type="submit">提交</button>
            &emsp;&emsp;&emsp;&emsp;
            <button type="button" class="btn btn-warning"
              data-dismiss="modal">取消</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
<script>
  function work(id) {
    /* var href = "${ctx}/resource/download?id=" + id;
    location.href = href; */
    window.open("download?id=" + id);
    setTimeout("location.reload()", 500);
  }
</script>
</html>