<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<c:if test="${message != null}">
  <div class="alert alert-dismissable ${message.cssClass}">
    <button type="button" class="close" data-dismiss="alert"aria-hidden="true">
      &times;
    </button>
    <c:out value="${message.text}" />
  </div>
</c:if>
<%session.removeAttribute("message");%>