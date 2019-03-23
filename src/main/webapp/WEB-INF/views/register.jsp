<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>

<head>
  <%@include file="/common/head.jsp" %>
  <style type="text/css">
    .input-font-size {
      font-size: 14px;
    }
    .center {
      margin-top: 80px;
      position: relative;
      left: 50%;
      width: 360px;
      text-align: center;
      transform: translateX(-50%);
      border-radius: 20px;
      background-color: white;
      padding: 10px 15px 30px 15px;
    }
    form {
   	  margin-top: 30px;
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="row panel panel-default center">
      <h3><b>注册用户</b></h3>
      <form class="form-horizontal" action="${ctx}/sys/user/save" method="post">
        <div class="col-xs-offset-1 col-xs-10 input-group">
          <span class="input-group-addon">
            <span class="glyphicon glyphicon-user"></span>
          </span>
          <input type="text" class="input-lg form-control input-font-size" 
          	name="username" placeholder="账号" required="required">
        </div><br />
        <div class="col-xs-offset-1 col-xs-10 input-group">
          <span class="input-group-addon">
            <span class="glyphicon glyphicon-lock"></span>
          </span>
          <input type="password" class="input-lg form-control input-font-size" 
          	name="password" placeholder="密码" required="required">
        </div><br />
        <div class="col-xs-offset-1 col-xs-10 input-group">
          <span class="input-group-addon">
            <span class="glyphicon glyphicon-user"></span>
          </span>
          <input type="text" class="input-lg form-control input-font-size" 
          	name="name" placeholder="昵称" required="required">
        </div><br />
        <%-- <div class="col-xs-offset-1 col-xs-10 input-group">
          <input type="text" class="input-lg form-control input-font-size" 
          	name="captcha" placeholder="验证码" required="required">
          <span class="input-group-btn" title="点击刷新验证码" onclick="updateCaptcha()" 
          	style="cursor:pointer;">
            <img id="captchaImg" src="${ctx}/captcha" alt="验证码图片">
          </span>
        </div><br />
        <div class="col-xs-offset-1 col-xs-10 input-group">
          <input type="checkbox" class="pull-left" name="remeberMe" />
          <label for="remeberMe" class="pull-left">记住我的登录状态</label>
          <a href="#" class="pull-right">忘记密码</a>
        </div> --%>
        <div style="margin: 20px 0 20px 0;">
          <p id="message" class="text-danger">
          	<c:out value="${'Bad credentials'.equals(msg) ? '账号或密码错误！请重试！' : msg}"/>
          </p>
        </div>
        <div class="col-xs-offset-1 col-xs-10 input-group">
          <button type="submit" class="pull-left col-xs-5 btn btn-primary">
                   注册
          </button>
          <a href="login" class="pull-right col-xs-5 btn btn-warning">
                                  返回
          </a>
        </div>
      </form>
    </div>
  </div>
</body>

</html>