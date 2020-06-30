<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/4/3
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>登录界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="image/ico" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/layer.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
</head>
<body>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.jsp">杰希书城</a>
            </div>
            <div>
                <p class="navbar-text" style="color: #ff3300">好货八方供,好货天天销</p>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${path}/resources/register.jsp"><span class="glyphicon glyphicon-user"></span>
                    注册</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
                    登录</a></li>
            </ul>
        </div>
    </nav>
    <div class="login-newbg">
        <div class="login-newbg">
            <div class="loginbox">
                <div class="login-title">
                    密码登录
                </div>
                <div class="input-group ">
                    <span class="input-group-addon"><img class="img-rounded" src="../images/user.png" width="16px"></span>
                    <input type="text" id="username" class="form-control" placeholder="请输入账户/手机号">
                </div>
                <div class="input-group ">
                    <span class="input-group-addon"><img class="img-rounded" src="../images/pass.png" width="16px"></span>
                    <input type="password" id='password' class="form-control " placeholder="请输入密码">
                </div>
                <button type="button" id='sumbit' class="btn btn-primary btn-lg center-block " style="text-shadow: black 5px 3px 3px;">
                    登录
                </button>
                <div class="right-a">
                    <a href="./register.jsp" >免费注册</a>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>

    <c:if test="${!empty msg }">
        <script type="text/javascript">
            layer.alert("${msg}",{ icon: 1,offset: "200px"});
        </script>
    </c:if>
</body>
</html>
