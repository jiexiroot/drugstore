<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/6/27
  Time: 19:14
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <title>添加管理员</title>
  <link rel="stylesheet" href="${path}/css/layui/css/layui.css">
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="image/ico" />
</head>
<c:if test="${empty nowadmin }">
  <script type="text/javascript">
    alert("请先登录");
    window.location.href="${path}/resources/login.jsp";
  </script>
</c:if>
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
              <dd>
                <a href="${path}/resources/admin/adminIndex.jsp">个人信息</a>
              </dd>
              <dd>
                <a href="${path}/resources/admin/adminPassword.jsp">安全设置</a>
              </dd>
              <dd class="layui-this">
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
              <legend>添加新管理员</legend>
            </fieldset>
          </div>
        </div>

        <div class="layui-row">
          <div class="layui-col-md1">&nbsp;</div>
          <div class="layui-col-md9">
            <fieldset class="layui-elem-field">
              <legend>填入信息</legend>
              <div class="layui-field-box">
                <form id="reform" class="layui-form layui-form-pane"
                      lay-filter="formFilter" action="${path}/admin/addadmin" method="post">

                  <div class="layui-form-item">
                    <label class="layui-form-label">账号</label>
                    <div class="layui-input-inline">
                      <input type="text" name="account" lay-verify="account"
                             placeholder="请输入" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">注册成功后可以用此账号登录</div>
                  </div>


                  <div class="layui-form-item">
                    <button class="layui-btn" lay-submit="reform"
                            lay-filter="reform">提交</button>
                  </div>
                </form>
              </div>
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
  <script>
    function logout(path) {
      layer.confirm("是否完全退出本系统",{btn: ['退出','取消'],title: "提示"},()=>{
        window.location.href = path + "/admin/logout";
      },(index)=>{
        layer.close(index)
      })
    }
  </script>
  <c:if test="${!empty msg }">
    <script type="text/javascript">
      layer.msg("${msg}",{ icon: ${icon},offset: "200px"});
    </script>
  </c:if>
</body>
</html>
