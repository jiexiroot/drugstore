<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/4/4
  Time: 9:31
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <title>注册界面</title>
  <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
  <link rel="stylesheet" href="${path}/css/register.css">
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="image/ico" />
  <script src="${path}/js/jquery-3.4.1.js"></script>
  <script src="${path}/js/layer.js"></script>
  <script src="${path}/js/bootstrap.min.js"></script>
  <script src="${path}/js/register.js"></script>
</head>
<body>
  <div id="repeat" class="message">
  </div>
  <nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="index.jsp">杰希书城</a>
      </div>
      <div>
        <p class="navbar-text" style="color: #ff3300">好货八方供,好货天天销</p>
      </div>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span>
          注册</a></li>
        <li><a href="${path}/resources/login.jsp"><span class="glyphicon glyphicon-log-in"></span>
          登录</a></li>
      </ul>
    </div>
  </nav>
  <form class="from-width" role="form" method="post">
    <div class="display-table">
      <label for="user" class="float2 control-label"><b>*</b>用户名</label>
      <div class="float">
        <input type="text" id="user" class="form-control"
               placeholder="请输入用户名">
      </div>
    </div>
    <div class="display-table">
      <label  class="float2 control-label"><b>*</b>密码</label>
      <div class="float">
        <input type="password" id="pass1" class="float form-control"
               placeholder="请输入密码">
      </div>
    </div>
    <div class="display-table">
      <label for="pass2" class="float2 control-label"><b>*</b>重复输入密码</label>
      <div class="float">
        <input type="password" id="pass2" class="float form-control"
               placeholder="请重复输入密码">
      </div>
    </div>
    <div class="display-table">
      <label for="num" class="float2 control-label"><b>*</b>手机号码</label>
      <div class="float">
        <input type="text" id="num"  class="form-control"
               placeholder="请输入手机号码" >
      </div>
    </div>
    <div class="display-table">
      <label for="nickname" class="float2 control-label">昵称</label>
      <div class="float">
        <input type="text" id="nickname"  class="form-control"
               placeholder="请输入你的昵称(可选)" >
      </div>
    </div>
    <div class="display-table">
      <label for="address" class="float2 control-label">收货地址</label>
      <div class="float">
        <input type="text" id="address"  class="form-control"
               placeholder="请输入你的收货地址(可选)" >
      </div>
    </div>


    <input type="button" id='sub_register' style="width: 120px;margin-right: 20px;float: left;margin-left: 120px;" class="btn btn-primary btn-lg " value=" 注册"/>


    <button type="button" style="width: 120px;float: left;" class="btn btn-primary btn-lg " onclick="javascript:window.location.href='login.jsp'" >
      返回登录
    </button>
  </form>
  <div style="height: 131px"></div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
