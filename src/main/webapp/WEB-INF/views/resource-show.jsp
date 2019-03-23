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
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title">资源信息</h3>
          </div>
          <div class="panel-body" style="font-size: 16px;">
            <h4>${resource.name}</h4>
            <p class="well">${resource.description}</p>
            <p>上传日期：<fmt:formatDate type="date"
              value="${resource.sysModifyLog.createDate}" />
            </p>
            <p>下载次数：${resource.downloadTimes}</p>
            <p>文件大小：<span id="fileSize">${resource.fileSize}</span></p>
            <p>所需积分：${resource.price}
              <c:choose>
                <c:when test="${hadBought == true}">
                  <button class="btn btn-success pull-right _download">已购买，点击下载</button>
                </c:when>
                <c:otherwise>
                  <a class="btn btn-primary pull-right _download">购买并下载</a>
                </c:otherwise>
              </c:choose>
            </p>
          </div>
        </div>
        <!-- 讨论区 -->
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title">资源评论</h3>
          </div>
          <div class="panel-body">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">发表评论</h3>
              </div>
              <div class="panel-body">
                <form action="${ctx}/resourceComment/save" method="post"
                  class="form-horizontal">
                  <input type="hidden" name="resourceId" value="${resource.id}" />
                  <textarea rows="5" class="form-control" name="content"
                    style="resize: none;"></textarea>
                  <button class="btn btn-success pull-right" type="submit">发送</button>
                </form>
              </div>
            </div>
            <%@include file="/common/show-message.jsp"%>
            <c:if test="${resource.comments != null}">
              <c:forEach items="${resource.comments}" var="comment"
                varStatus="st">
                <div class="panel panel-default">
                  <div class="panel-body row">
                    <div class="col-md-2 text-center">
                      <img src="${ctx}/static/img/touxiang.jpg">
                      <h4>${comment.user.name}</h4>
                    </div>
                    <div class="col-md-10">${comment.content}</div>
                    <div class="col-md-offset-2 col-md-10 btn-group">
                      <button type="button" class="btn btn-primary pull-right"
                        onclick="work('${comment.id}')">
                        <span class="glyphicon glyphicon-thumbs-up"></span>
                        &nbsp;${comment.good}
                      </button>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </c:if>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
</body>
<script>
function work(id) {
   $.ajax({
     async : false,
     type : 'get',
     url : "${ctx}/resourceComment/good?id=" + id
   });
   location.reload();
 }
$(function() {
	$("#fileSize").each(function() {
		var $this = $(this);
		var size = parseInt($this.text());
		var names = ["B", "KB", "MB", "GB"];
		var i = Math.floor(Math.log(size) / Math.log(1024));
		size = (size / Math.pow(1024, i)).toFixed(1);
		$this.text(size + " " + names[i]);
	});
	$("._download").click(function() {
		var url = "${ctx}/resource/download?id=${resource.id}";
		window.open(url);
		setTimeout(function(){location.reload()}, 1000);
	});
})
</script>
</html>