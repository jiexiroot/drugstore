<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/6/27
  Time: 20:15
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <title>用户管理</title>
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
        <li class="layui-nav-item"><a href="${path}/admin/getusers">用户管理</a></li>
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
              <dd class="layui-this">
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
              <legend>用户管理</legend>
            </fieldset>
          </div>
        </div>

        <div class="layui-row">
          <div class="layui-col-md1">&nbsp;</div>
          <div class="layui-col-md10">
            <fieldset class="layui-elem-field">
              <legend>查询用户</legend>
                <form action="${path}/admin/getusers" class="layui-form" style="padding: 20px 0px 10px 0px;">
                  <div class="layui-form-item layui-col-md5">
                    <label class="layui-form-label">查询条件</label>
                    <div class="layui-input-block">
                      <input type="text" name="userstr" placeholder="请输入查询条件（可以为用户名称/用户ID）"
                             autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <button type="submit" class="layui-btn layui-btn-normal" style="margin: 0px 10px"><i class="layui-icon layui-icon-search"></i>查询</button>
                </form>
                <div class="layui-field-box" style="padding: 10px 25px; margin-bottom: 10px">
                  <c:if test="${userstr == null}">
                    <p><i class="layui-icon layui-icon-down"></i> ${userstr} </p>
                  </c:if>
                  <c:if test="${userstr != null}">
                    <p><i class="layui-icon layui-icon-down"></i> ${userstr} </p>
                  </c:if>
                </div>
            </fieldset>
          </div>
        </div>

        <div class="layui-row">
          <div class="layui-col-md1">&nbsp;</div>
          <div class="layui-col-md10">
            <fieldset class="layui-elem-field">
              <legend>用户列表</legend>
              <c:if test="${list.size() == 0}">
                <div class="layui-field-box" style="padding: 10px 25px; margin-bottom: 10px">
                  没有搜索到用户信息
                </div>
              </c:if>
              <c:forEach items="${list}" var="user">
                <div style="margin-left: 20px;margin-right: 30px;margin-top: 20px;">
                </div>
                <fieldset class="layui-elem-field layui-field-title"
                          style="margin: 20px;margin-bottom: 5px;margin-top: 5px;">
                  <legend><a>${user.username}</a></legend>
                </fieldset>
                <div style="margin-left: 20px;margin-right: 30px;">
                  <c:if test="${user.stateId==1 }">
                    <span class="layui-badge layui-bg-blue">正常用户</span>
                  </c:if>
                  <c:if test="${user.stateId!=1 }">
                    <span class="layui-badge layui-bg-orange">被限制</span>
                  </c:if>
                  <span class="layui-badge layui-bg-gray">注册时间：<fmt:formatDate value="${user.addtime }" pattern=" yyyy-MM-dd HH:mm:ss" /></span>
                </div>
                <div style="margin-left: 30px;margin-right: 30px;margin-top: 10px;margin-bottom: 30px;">
                  <c:if test="${user.stateId==1 }">
                    <a href="${path}/admin/disabled?keys=${keys}&uid=${user.id }" class="layui-btn layui-btn-sm layui-btn-primary layui-btn-radius">限制该用户状态</a>
                  </c:if>
                  <c:if test="${user.stateId!=1 }">
                    <a href="${path}/admin/abled?keys=${keys}&uid=${user.id }" class="layui-btn layui-btn-sm layui-btn-primary layui-btn-radius">解除限制</a>
                  </c:if>
                  <a onclick="showDetail(${user.id })" class="layui-btn layui-btn-sm layui-btn-primary layui-btn-radius">用户信息</a>
                </div>

              </c:forEach>
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
  <c:if test="${!empty msg }">
    <script type="text/javascript">
      let icons = ${icon};
      layer.msg("${msg}",{ icon: icons,offset: "200px"});
    </script>
  </c:if>
  <script>
    function showDetail(uid){
      //iframe层
      layer.open({
        type: 2,
        title: '用户信息',
        shadeClose: true,
        shade: false,
        area: ['1000px', '650px'],
        content: '${path}/admin/getuser?uid='+uid
      });
    }
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
