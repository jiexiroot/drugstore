<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/6/18
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <title>${detail.drugs.shopName} ${detail.drugs.drugName}</title>
  <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
  <link rel="stylesheet" href="${path}/css/detail.css">
  <script src="${path}/js/jquery-3.4.1.js"></script>
  <script src="${path}/js/layer.js"></script>
  <script src="${path}/js/bootstrap.min.js"></script>
  <script src="${path}/js/detail.js"></script>
  <link rel="stylesheet" href="${path}/css/detail.css">
</head>
<body>
  <jsp:include page="head.jsp"></jsp:include>
  <div style="margin-left: 150px ;">
    <div class="wrap">
      <div class="breadcrumbs clearfix">
        <a href="">JX商城</a>
        <i></i>
        <a href="">${detail.drugs.cList[0].name}</a>
        <i></i>
        <strong>${detail.drugs.shopName} &nbsp;&nbsp;${detail.drugs.drugName}</strong>
      </div>
      <div class="mainInfo">
        <div class="left">
          <a href="" class="bigpic">
            <div class=zoomPad">
              <img class="imgzoom" src="${path}/${detail.drugs.imgurl}" alt="">
            </div>
            <span class="imgTip">温馨提醒：商品包装因厂家更换频繁，如有不符请以实物为准。</span>
          </a>
          <div class="piccontainer">
            <div class="pic_list">
              <a href="" title="" class="p">
                <img src="${path}/${detail.drugs.imgurl}" alt="">
              </a>
              <a href="" title="" class="p">
                <img src="${path}/${detail.drugs.imgurl}" alt="">
              </a>
              <a href="" title="" class="p">
                <img src="${path}/${detail.drugs.imgurl}" alt="">
              </a>
              <a href="" title="" class="p">
                <img src="${path}/${detail.drugs.imgurl}" alt="">
              </a>
              <a href="" title="" class="p">
                <img src="${path}/${detail.drugs.imgurl}" alt="">
              </a>
              <a href="" title="" class="p">
                <img src="${path}/${detail.drugs.imgurl}" alt="">
              </a>
            </div>
            <a id="arrow_L" class="icons arrow left"></a>
            <a id="arrow_R" class="icons arrow right"></a>
          </div>
          <div class="share">
            <div class="ids">商品编号：${53373 + detail.drugs.id}<p id="did" style="display: none">${detail.drugs.id}</p></div>
            <a class="item f" id="aFavorite"><b class="icons"></b><em>收藏该商品</em></a>
          </div>
        </div>
        <div class="center">
          <h1>
            <strong class="short-width">
              <span>${detail.drugs.shopName} ${detail.drugs.drugName}</span>
              <i class="icon_otc fl"></i>
            </strong>
          </h1>
          <div class="appad">
            <p class="AppDown">新客APP下单领20元券</p><p class="AppDownTwo"><a target="_blank" href="">立即去领</a></p>

          </div>
          <div class="info">
            <dl>
              <dt class="l">通&nbsp;&nbsp;用&nbsp;&nbsp;名</dt>
              <dd class="w2 l"><strong>${detail.drugs.drugName}</strong></dd>
              <dt class="l">商品名</dt>
              <dd class="w3 l">
                ${detail.drugs.shopName}
              </dd>
              <dt class="l">包装规格</dt>
              <dd class="w2n l">${detail.drugs.spec}</dd>
              <dt class="l">剂型/型号</dt>
              <dd class="w3 l">${detail.drugs.model}</dd>
              <dt class="l">生产企业</dt>
              <dd class="w2 l">拜耳医药保健有限公司</dd>
              <dt class="l">批准文号</dt>
              <dd class="w3 l">
                <div class="f2">
                  ${detail.drugs.approval}
                </div>
              </dd>
            </dl>
            <dl class="price h2s" id="pricedl">
              <dt>零售价格</dt>
              <dd class="w1">
                <div class="money fsize18">
                  ¥<span class="num v-mid">${detail.drugs.price}</span>
                </div>
              </dd>
            </dl>
            <dl class="h2s">
              <dt>需求数量</dt>
              <dd class="w1">
              <span class="quantity">
                  <a class="sub one-pan-link-mark dis" href="javascript:void(0);" onclick="subductionNum(this)" id="buyminus"></a>
                  <input type="text" class="num" value="1" id="quantity">
                  <a class="add one-pan-link-mark" href="javascript:void(0);" onclick="addNum(this,${detail.drugs.amount})" id="buyplus"></a>
              </span>
                <span class="">
                  &nbsp;&nbsp;&nbsp;库存：<label id="reserve">${detail.drugs.amount}</label>${detail.standard}，近15天限购20${detail.standard}
              </span>
              </dd>
            </dl>
          </div>
          <div class="mainop clearfix">
            <button class="ibtn2"  id="buy">立即购买</button>
            <button class="ibtn1" onclick="addcart()" id="addcart">加入购物车</button>
          </div>
          <div class="sinfo clearfix">
            <p class="hui">该报价由：JX商城测试有限公司发布，商家承诺：</p>
            <div class="spec clearfix">
              <span><i class="icons fahuo2"></i>24小时内发货</span>
              <span><i class="icons zheng2"></i>正品保障</span>
              <span><i class="icons piao2"></i>提供发票</span>
              <span title="依据《药品经营质量管理规范》第三章第八节相关规定：药品一经售出、无质量问题、不退不换。"><i class="icons tui">退</i>退货款规则&nbsp;<img class="v-mid"></span>
            </div>
          </div>
        </div>
        <div class="rightBox">
          <img src="${path}/images/details/dianpu.png" alt="">
        </div>
      </div>
    </div>
  </div>

  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
