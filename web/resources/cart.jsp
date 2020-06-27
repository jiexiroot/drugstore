<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/6/20
  Time: 0:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <title>购物车</title>
  <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
  <script src="${path}/js/jquery-3.4.1.js"></script>
  <script src="${path}/js/layer.js"></script>
  <script src="${path}/js/bootstrap.min.js"></script>
  <script src="${path}/js/cart.js"></script>
  <link rel="stylesheet" href="${path}/css/cart.css">
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
        <td class="w1"><div class="ck js-checkAll js-ck" onclick="selectAll(this)"><i class="checked"></i></div></td>
        <td class="w2"><span id="checkAlltxt">全选</span></td>
        <td class="w3">商品信息</td>
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
          <div class="ck js-ck js-shop-ck" onclick="selectAll(this)"><i class="checked"></i></div>
        </td>
        <td colspan="3">
          <a target="_blank" href="" class="one-pan-link-mark">杰希商城测试药城有限公司</a>
        </td>
        <td colspan="3" class="w8 cart-tip-area" style="z-index: 1">
          <span class="cart-tip-post"></span>
          <span class="js-freepostage-price-349009 cart-tip-txt">已满9.9元，已包邮</span>
        </td>
      </tr>

      <tr>
        <td colspan="5"></td>
        <td class="w7" colspan="2">商品金额合计：<span class="money js-total">￥00.00</span></td>
      </tr>
      </tbody>
    </table>
    <table class="table03 fixedTar">
      <tbody>
      <tr>
        <td class="w1 bat-opt clearfix">
          <label class="clearfix bat-opt-ck fl">
            <div class="ck js-checkAll js-ck fl" onclick="selectAll(this)"><i class="checked"></i></div>
            <span class="ck-txt fl">全选</span>
          </label>
          <span class="bat-opt-txt fl js-xz-delete">删除</span>
          <a class="nonexta " href="index.jsp">&lt;&lt;我再逛逛</a>
        </td>
        <td class="w2">
          商品金额总计（不含运费及包装费）
          <span class="money fsize22">￥<span class="num js-cart-total" id="ordertotal">0.00</span></span>
        </td>
        <td class="w3">
          <a class="btn b2 fyahei fsize22 js-buy one-pan-link-mark" onclick="shopOrder()" href="javascript:void(0);">去结算</a>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
