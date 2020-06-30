<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/6/27
  Time: 21:48
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <link rel="stylesheet" href="${path}/css/layui/css/layui.css">
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="image/ico" />
  <title>用户详情信息</title>
</head>
<c:if test="${empty nowadmin }">
  <script type="text/javascript">
    alert("请先登录");
    window.location.href="${path}/resources/login.jsp";
  </script>
</c:if>

<body>
  <!-- 内容主体区域-->
  <div class="layui-container">
    <div class="layui-row">
      <div class="layui-col-md12">
        <fieldset class="layui-elem-field layui-field-title"
                  style="margin-top: 30px;">
          <legend>用户详情信息</legend>
        </fieldset>
      </div>
    </div>

    <div class="layui-row">
      <div class="layui-col-md12">
        <fieldset class="layui-elem-field">
          <legend>信息</legend>
          <div class="layui-field-box">
            <table class="layui-table"  lay-skin="line"
                   style="margin-bottom: 0px;">
              <colgroup>
                <col width="150">
                <col width="200">
                <col>
              </colgroup>
              <tbody>
              <tr>
                <td>用户编号</td>
                <td>${userInfo.user.id}</td>
              </tr>
              <tr>
                <td>用户姓名</td>
                <td>${userInfo.user.username}</td>
              </tr>
              <tr>
                <td>用户昵称</td>
                <td>${userInfo.user.nickName}</td>
              </tr>
              <tr>
                <td>用户电话</td>
                <td>${userInfo.user.telphone}</td>
              </tr>
              <tr>
                <td>用户身份</td>
                <td>
                  <c:if test="${userInfo.user.userRoleId==1}">
                    普通用户
                  </c:if>
                  <c:if test="${userInfo.user.userRoleId==2}">
                    VIP用户
                  </c:if>
                  <c:if test="${userInfo.user.userRoleId==3}">
                    管理员用户
                  </c:if>
                </td>
              </tr>
              <tr>
                <td>注册时间</td>
                <td><fmt:formatDate value="${userInfo.user.addtime }"
                                    pattern=" yyyy-MM-dd HH:mm:ss" /></td>
              </tr>
              <tr>
                <td>用户状态</td>
                <td><c:if test="${userInfo.user.stateId==1}">
                  正常
                </c:if> <c:if test="${userInfo.user.stateId==2 }">
                  被限制
                </c:if></td>
              </tr>
              </tbody>
            </table>
          </div>
        </fieldset>

      </div>
    </div>
  </div>
  <script src="${path}/css/layui/layui.all.js"></script>
</body>
</html>
