<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<%
	Map<Integer, Character> int2char = new HashMap<>();
	for (int i=0; i<26; ++i) {
		int2char.put(i, (char)('A' + i));
	}
	request.setAttribute("int2char", int2char);
%>
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
            <h3 class="panel-title">题目信息</h3>
          </div>
          <div class="panel-body _chooseDiv" style="font-size: 18px;">
            <h4>${question.content}
              <span class="text-danger">（${question.type}题）</span>
            </h4>
            <c:forEach items="${question.choices}" var="choice" varStatus="innerSt">
              <div class="checkbox">
                <label>
                  <span class="_choiceNo" id="choice-${choice.id}" 
	                data-isanswer="${choice.answer}">${int2char[innerSt.index]}</span>
	              .&nbsp;${choice.content}
                </label>
              </div>
            </c:forEach>
            <p>正确答案：<span class="_answer"></span>
          </div>
        </div>
        <!-- 讨论区 -->
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title">讨论区</h3>
          </div>
          <div class="panel-body">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">发表见解</h3>
              </div>
              <div class="panel-body">
                <form action="${ctx}/questionComment/save" method="post"
                  class="form-horizontal">
                  <input type="hidden" name="questionId" value="${question.id}" />
                  <textarea rows="5" class="form-control" name="content"
                    style="resize: none;"></textarea>
                  <button class="btn btn-success pull-right" type="submit">发送</button>
                </form>
              </div>
            </div>
            <%@include file="/common/show-message.jsp"%>
            <c:if test="${question.comments != null}">
              <c:forEach items="${question.comments}" var="comment"
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
      url : "${ctx}/questionComment/good?id=" + id
    });
    location.reload();
  }
$(function() {
	$("._answer").each(function() {
		var $div = $(this).parents("._chooseDiv");
		var answer = "";
		$div.find("._choiceNo").each(function() {
			var $this = $(this);
			if ($this.attr("data-isanswer") === "true") {
				answer += $this.text();
			}
		});
		$div.find("._answer").text(answer);
	});
})
</script>
</html>