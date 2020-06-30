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
          <legend>药品详细信息</legend>
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
                <td>药品编号</td>
                <td>${drugsInfo.drugs.id}</td>
              </tr>
              <tr>
                <td>通用名</td>
                <td>${drugsInfo.drugs.drugName}</td>
              </tr>
              <tr>
                <td>商品名</td>
                <td>${drugsInfo.drugs.shopName}</td>
              </tr>
              <tr>
                <td>批准编号</td>
                <td>${drugsInfo.drugs.approval}</td>
              </tr>
              <tr>
                <input type="hidden" class="publish" value="${drugsInfo.drugs.publisherId}">
                <td>生产厂商</td>
                <td>${drugsInfo.pName}</td>
              </tr>
              <tr>
                <td>上架时间</td>
                <td><fmt:formatDate value="${drugsInfo.drugs.publishDate }"
                                    pattern=" yyyy-MM-dd HH:mm:ss" /></td>
              </tr>
              <tr>
                <input type="hidden" class="category" value="${drugsInfo.drugs.categoryId}">
                <td>种类</td>
                <td>${drugsInfo.cName}</td>
              </tr>
              <tr>
                <td>商品规格</td>
                <td>${drugsInfo.drugs.spec}</td>
              </tr>
              <tr>
                <td>剂型</td>
                <td>${drugsInfo.drugs.model}</td>
              </tr>
              <tr>
                <td>价格</td>
                <td>${drugsInfo.drugs.price}</td>
              </tr>
              <tr>
                <td>数量</td>
                <td>${drugsInfo.drugs.amount}</td>
              </tr>
              <tr>
                <td>图片</td>
                <td><img src="${path}/${drugsInfo.drugs.imgurl}" width="250px" alt="图片加载失败"></td>
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
