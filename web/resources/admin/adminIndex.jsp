<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/6/27
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<c:if test="${empty nowadmin }">
  <script type="text/javascript">
    alert("请先登录");
    window.location.href="${path}/resources/login.jsp";
  </script>
</c:if>
<head>
  <link rel="stylesheet" href="${path}/css/layui/css/layui.css">
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="image/ico" />
  <title>管理员中心</title>
</head>
<body class="layui-layout-body">
  <div class="layui-layout layui-layout-admin">
    <div class="layui-header">
      <a href="${path}/admin/index" class="layui-logo">JX商城后台管理平台</a>
      <!-- 头部区域（可配合layui已有的水平导航） -->
      <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item"><a href="adminIndex.jsp">管理员中心</a></li>
        <li class="layui-nav-item"><a href="${path}/resources/admin/adminUser.jsp">用户管理</a></li>
        <li class="layui-nav-item"><a href="${path}/resources/admin/adminDrug.jsp">商品管理</a></li>
        <li class="layui-nav-item"><a href="${path}/resources/main.jsp">返回商城页面</a></li>
      </ul>
      <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item"><a href="javascript:;">
          ${nowadmin.username} </a>
          <dl class="layui-nav-child">
            <dd>
              <a href="adminIndex.jsp">个人信息</a>
            </dd>
            <dd>
              <a href="adminPassword.jsp">安全设置</a>
            </dd>
          </dl></li>
        <li class="layui-nav-item"><a href="javascript:void(0)" onclick="logout('${path}')">退出登录</a></li>
      </ul>
    </div>

    <div class="layui-side layui-bg-black">
      <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">

          <li class="layui-nav-item layui-nav-itemed"><a href="javascript:;">商品管理</a>
            <dl class="layui-nav-child">
              <dd>
                <a href="${path}/resources/admin/adminDrug.jsp">药品管理</a>
              </dd>
              <dd>
                <a href="${path}/resources/admin/adminAddDrug.jsp">药品添加</a>
              </dd>
              <dd>
                <a href="${path}/resources/admin/adminOrder.jsp">订单管理</a>
              </dd>
            </dl></li>

          <li class="layui-nav-item layui-nav-itemed"><a href="javascript:;">用户管理</a>
            <dl class="layui-nav-child">
              <dd>
                <a href="${path}/admin/getusers">用户维护</a>
              </dd>
            </dl></li>

          <li class="layui-nav-item layui-nav-itemed"><a class=""
                                                         href="javascript:;">管理员中心</a>
            <dl class="layui-nav-child">
              <dd class="layui-this">
                <a href="${path}/resources/admin/adminIndex.jsp">个人信息</a>
              </dd>
              <dd>
                <a href="${path}/resources/admin/adminPassword.jsp">安全设置</a>
              </dd>
              <dd>
                <a href="${path}/resources/admin/adminAddAdmin.jsp">添加管理员</a>
              </dd>
            </dl></li>

        </ul>
      </div>
    </div>
    <!-- 内容主体区域-->
    <div class="layui-body">
      <div style="padding: 30px;" class="layui-fluid">
        <div class="layui-row">
          <div class="layui-col-md12">
            <span class="layui-badge-dot"></span> <span
              class="layui-badge-dot layui-bg-orange"></span> <span
              class="layui-badge-dot layui-bg-green"></span> <span
              class="layui-badge-dot layui-bg-cyan"></span> <span
              class="layui-badge-dot layui-bg-blue"></span> <span
              class="layui-badge-dot layui-bg-black"></span> <span
              class="layui-badge-dot layui-bg-gray"></span>
            <fieldset class="layui-elem-field layui-field-title"
                      style="margin-top: 30px;">
              <legend>个人信息</legend>
            </fieldset>
          </div>
        </div>

        <div class="layui-row">
          <div class="layui-col-md1">&nbsp;</div>
          <div class="layui-col-md10">
            <fieldset class="layui-elem-field">
              <legend>信息</legend>
              <!--  <div class="layui-field-box">-->
              <table class="layui-table" lay-size="lg" lay-skin="line" style="margin-bottom: 0px;">
                <colgroup>
                  <col width="150">
                  <col width="200">
                  <col>
                </colgroup>
                <thead>
                <tr>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>编号</td>
                  <td>${nowadmin.id }</td>
                </tr>
                <tr>
                  <td>登录账号</td>
                  <td>${nowadmin.username }</td>
                </tr>
                <tr>
                  <td>昵称名字</td>
                  <td>${nowadmin.nickName }</td>
                </tr>
                <tr>
                  <td>注册时间</td>
                  <td><fmt:formatDate value="${nowadmin.addtime }"
                                      pattern=" yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                <tr>
                  <td>状态</td>
                  <td><c:if test="${nowadmin.stateId==1 }">
                    正常
                  </c:if> <c:if test="${nowadmin.stateId!=1 }">
                    被限制
                  </c:if></td>
                </tr>
                </tbody>
              </table>
              <!--</div>-->
            </fieldset>

          </div>
          <div class="layui-col-md1">&nbsp;</div>
        </div>

      </div>

    </div>


    <div class="layui-footer">
      <!-- 底部固定区域 -->
      ©  - JX商城后台管理平台
    </div>
  </div>
  <script src="${path}/css/layui/layui.all.js"></script>
  <c:if test="${empty userIF }">
    <script type="text/javascript">
      layer.alert("请先登录");
      setTimeout(()=>{
        window.location.href="${path}/resources/login.jsp";
      },1500);
    </script>
  </c:if>
  <script>
    //JavaScript代码区域
    layui.use('element', function() {
      var element = layui.element;
      //监听导航点击
      element.on('nav(test)', function(elem) {
        //console.log(elem)
        layer.msg(elem.text());
      });
    });
  </script>
  <script>
    function logout(path) {
      layer.confirm("是否完全退出本系统",{btn: ['退出','取消'],title: "提示"},()=>{
        window.location.href = path + "/admin/logout";
      },(index)=>{
        layer.close(index)
      })
    }
  </script>
</body>
</html>
