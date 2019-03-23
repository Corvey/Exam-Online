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
<%@include file="/common/head.jsp" %>
</head>

<body>
<%@include file="/common/header.jsp" %>
<div class="container">
  <div class="row">
  	<!-- 题目导航 -->
    <div class="col-md-3" id="question-nav">
	  <div class="panel panel-info">
	    <div class="panel-heading">
	      <h3 class="panel-title">
	        <span class="glyphicon glyphicon-th-list"></span>&nbsp;题目导航
	      </h3>
	    </div>
	    <div class="panel-body row">
	      <c:forEach items="${entity.exampaper.questions}" var="question" varStatus="st">
	      	<div class="col-md-3 text-center" style="margin-bottom: 10px;">
	          <a class="btn btn-default btn-xs" href="#question-${question.id}">${st.count}</a>
	      	</div>
	      </c:forEach>
	      <div class="row">
	      	<div class="col-md-12 text-center">
		      <h4>剩余时间</h4>
		      <h4 id="left_time">${entity.time}分钟0秒</h4>
	      	</div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 题目 -->
	<div class="col-md-9">
	  <div class="panel panel-info">
	    <div class="panel-heading">
	      <h3 class="panel-title">
	        <span class="glyphicon glyphicon-th-list"></span>&nbsp;${entity.name}
	      </h3>
	    </div>
	    <!-- 答题div -->
	    <div class="panel-body" style="font-size:18px;">
	      <form action="${ctx}/exam/handin" method="post">
	      	<input type="hidden" name="examId" value="${entity.id}"/>
		    <c:forEach items="${entity.exampaper.questions}" var="question" varStatus="st">
		      <input type="hidden" name="questionIds[${st.index}]"
		        value="${question.id}"/>
		      <div class="panel panel-default" id="question-${question.id}">
		        <div class="panel-heading">
			      <h3 class="panel-title">${question.type}题</h3>
			    </div>
		        <div class="panel-body _chooseDiv" 
		          data-question-type="${question.type == '多选' ? 'checkbox' : 'radio'}">
		          <p>${st.count}.&nbsp;${question.content}</p>
		          <c:forEach items="${question.choices}" var="choice" varStatus="innerSt">
		            <div class="checkbox">
				      <label>
				        <input type="checkbox" value="${choice.id}"
	                      name="chooses[${st.index}][${innerSt.index}]" />
	                    ${int2char[innerSt.index]}.&nbsp;${choice.content}
				      </label>
				    </div>
		          </c:forEach>
		        </div>
		      </div>
		    </c:forEach>
	        <div class="col-md-9 text-center"><hr/>
		      <button class="btn btn-primary" type="submit">提交</button>
		        &emsp;&emsp;&emsp;&emsp;
		      <a class="btn btn-warning" href="${ctx}/exam/show">返回</a>
	        </div>
	      </form>
	    </div>
	  </div>
    </div>
  </div>
</body>
<script>
$(function() {
 	var $questionNav = $("#question-nav");
	var $window = $(window);
	var initTop = $questionNav.offset().top - 30;
	$window.scroll(function() {
		var offsetTop = initTop + $window.scrollTop() + "px";
		$questionNav.animate({top: offsetTop}, {queue: false});
	});
	$("input[type='checkbox']").click(function() {
		var $this = $(this);
		var $parent = $this.parents("._chooseDiv");
		if ($parent.attr("data-question-type") === "radio") {
			$parent.find("input[type='checkbox']").each(function() {
				$(this).prop("checked", false);			
			});
			$this.prop("checked", true);
		}
		var questionId = $parent.parents("[id^='question-']").prop("id");
		$("a[href='#" + questionId + "']").removeClass("btn-default")
			.addClass("btn-primary");
	});
	var minutes = ${entity.time};
	var seconds = 0;
	setInterval(function () {
		if (seconds == 0) {
	    	--minutes;
	    	seconds = 60;
	    }
	    --seconds;
	    $('#left_time').html("<span id='leftM'>" + minutes + "</span>" + "分钟" 
	    		+ "<span id='leftS'>" + seconds + "</span>" + "秒");
		/* if (minutes > 0 && seconds > 0) {
		    if (seconds == 0) {
		    	--minutes;
		    	seconds = 60;
		    }
		    --seconds;
		    $('#left_time').html("<span id='leftM'>" + minutes + "</span>" + "分钟" 
		    		+ "<span id='leftS'>" + seconds + "</span>" + "秒");
		} else {
			//$("form").submit();
		} */
	  }, 1000);
});
</script>
</html>