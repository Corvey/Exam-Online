<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/taglibs.jsp"%>

<div class="col-xs-10">
  <div class="panel panel-info">
    <div class="panel-heading">
      <h3 class="panel-title">
        <span class="glyphicon glyphicon-align-justify"></span>
        &nbsp;题目信息管理
      </h3>
    </div>
    <div class="panel-body">
      <form:form action="${ctx}/question/save" method="post" 
        cssClass="form-horizontal" modelAttribute="entity">
        <form:hidden path="id"/>
        <div class="form-group">
          <label for="type" class="col-md-2 control-label">题目类型</label>
          <div class="col-md-5">
            <form:select cssClass="form-control" path="type">
              <form:option value="判断"/>
              <form:option value="单选"/>
              <form:option value="多选"/>
            </form:select>
          </div>
        </div>
        <div class="form-group">
          <label for="content" class="col-md-2 control-label">题干</label>
          <div class="col-md-5">
            <form:textarea cssClass="form-control" path="content"/>
          </div>
        </div>
        <c:forEach items="${entity.choices}" var="choice" varStatus="st">
          <div class="form-group _oldChoice">
          	<input type="hidden" name="choices[${st.index}].id" value="${choice.id}"/>
	        <label class="col-md-2 control-label">选项</label>
	        <div class="col-md-5">
	          <textarea name="choices[${st.index}].content"
	        	class="form-control"><c:out value="${choice.content}"/>
	          </textarea>
	        </div>
	        <div class="col-md-2">
	          <label class="control-label">是否为正确选项</label>
  	          <input type="checkbox" name="choices[${st.index}].answer" 
  	            ${choice.answer == true ? 'checked="checked"' : ''} />
	        </div>
	        <button class="btn btn-danger" type="button" 
	          onclick='deleteOldChoice("${choice.id}", this)'>删除</button>
	      </div>
        </c:forEach>
        <div id="newChoiceDiv"></div>
        <div id="choiceAnswerDiv"></div>
        <p class="text-center">
          <button class="btn btn-default" onclick="addNewChoice()" type="button">添加选项</button>
        </p>
        <div class="form-group">
          <label for="content" class="col-md-2 control-label">所属试卷</label>
          <div class="col-md-5">
            <form:checkboxes path="exampaperIds" delimiter="<br/>"
              items="${exampapers}" itemLabel="name" itemValue="id"/>
          </div>
        </div>
        <div class="col-md-9 text-center"><hr/>
	      <button class="btn btn-primary" type="submit">提交</button>
	      &emsp;&emsp;&emsp;&emsp;
	      <a class="btn btn-warning" href="${ctx}/question/list">返回</a>
        </div>
      </form:form>
    </div>
  </div>
</div>
<script>
$(function() {
	$("#entity").submit(function() {
		$("#choiceAnswerDiv").html("");
		$("input[name$='.answer']").each(function() {
			var $this = $(this);
			if ($this.prop("checked") === false) {
				var name = $this.prop("name");
				var htmlText = '<input type="hidden" name="' + name + '" value="0"/>';
				$("#choiceAnswerDiv").append(htmlText);
			}
		});
	});
});
function deleteOldChoice(id, obj) {
	$("#entity").append('<input type="hidden" name="deleteChoiceIds" value="'
			+ id + '"/>');
	$(obj).parents("._oldChoice").remove();
}
function deleteNewChoice(obj) {
	$(obj).parents("._newChoice").remove();
}
const getNewChoiceSize = function(){var i=0;return (function(){return i++})}();
function addNewChoice() {
	var index = getNewChoiceSize();
	var htmlText =  
		'<div class="form-group _newChoice">'
  	    + '<label class="col-md-2 control-label">选项</label>'
  	    + '<div class="col-md-5">'
  	      + '<textarea name="newChoices[' + index + '].content" class="form-control">'
  	      + '</textarea>'
  	    + '</div>'
  	    + '<div class="col-md-2">'
  	      + '<label class="control-label">是否为正确选项</label>'
  		  + '<input type="checkbox" name="newChoices[' + index + '].answer"/>'
  	    + '</div>'
  	    + '<button class="btn btn-danger" type="button" onclick="deleteNewChoice(this)">删除</button>'
      + '</div>';
    $("#newChoiceDiv").append(htmlText);
}
</script>