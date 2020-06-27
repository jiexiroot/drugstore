<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/6/21
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <title>订单</title>
  <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
  <script src="${path}/js/jquery-3.4.1.js"></script>
  <script src="${path}/js/layer.js"></script>
  <script src="${path}/js/bootstrap.min.js"></script>
  <script src="${path}/js/Okorder.js"></script>
  <link rel="stylesheet" href="${path}/css/order.css">
</head>
<body>
  <jsp:include page="head.jsp"></jsp:include>
  <div id="wrap">
    <div class="tabnav clearfix">
      <ul class="navul">
        <li><a class="cur" href="javascript:void(0);">商品列表</a></li>
      </ul>
    </div>
    <table class="table01">
      <tbody>
      <tr>
        <td class="w1"></td>
        <td class="w2"><span id="checkAlltxt"></span></td>
        <td class="w3">商品信息</td>
        <td class="w8">支付状态</td>
        <td class="w4">单价（元）</td>
        <td class="w5">数量</td>
        <td class="w6">小计（元）</td>
        <td class="w7">操作</td>
      </tr>
      </tbody>
    </table>
    <table class="table02">
      <tbody>
      <tr class="head">
        <td class="w1">
        </td>
        <td colspan="7">
          <a target="_blank" href="" class="">已完成的订单</a>
        </td>
      </tr>
      </tbody>
    </table>
      </tr>
      </tbody>
    </table>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
