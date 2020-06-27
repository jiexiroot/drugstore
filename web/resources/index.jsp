<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/4/3
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>
  <head>
    <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/css/index.css">
    <script src="${path}/js/jquery-3.4.1.js"></script>
    <script src="${path}/js/layer.js"></script>
    <script src="${path}/js/bootstrap.min.js"></script>
    <script src="${path}/js/index.js"></script>
    <title>JX商城</title>
  </head>
  <body>
  <c:if test="${!empty msg2 }">
    <script type="text/javascript">
      layer.msg("${msg2}",{ icon: 1,offset: "200px"});
    </script>
  </c:if>
  <%
    Object user2=request.getSession().getAttribute("userIF");
    if(null == user2){
  %>
  <script>
    console.log("未登录")
    $(function () {
      layer.msg("您还没有登陆，请先登录");
    })
  </script>
  <%
    }
  %>
  <jsp:include page="head.jsp"/>
  <div class="tou-bg">
    <div class="biger-box">
      <div class="listDrugs">
        <ul>
          <li class="op"><h4 style="font-weight: 800;">所有商品分类</h4></li>
          <li><a href="#"><i class="jiaonang"></i><h4>中西药品</h4></a></li>
          <li><a href="#"><i class="bao"></i><h4>营养保健</h4></a></li>
          <li><a href="#"><i class="hu"></i><h4>维生素钙</h4></a></li>
          <li><a href="#"><i class="yan"></i><h4>隐形眼镜</h4></a></li>
          <li><a href="#"><i class="yi"></i><h4>医疗器械、健康电器</h4></a></li>
          <li><a href="#"><i class="mu"></i><h4>美妆个护</h4></a></li>
          <li><a href="#"><i class="shen"></i><h4>参茸花茶、休闲零食</h4></a></li>
          <li><a href="#"><i class="ti"></i><h4>体检、口腔诊疗</h4></a></li>
        </ul>
      </div>
      <div class="slider">
        <div class="slider-img">
          <ul class="slider-img-ul">
            <li><a href="#"><img src="${path}/images/slider/1.jpg" ></a></li>
            <li><a href="#"><img src="${path}/images/slider/1.jpg" ></a></li>
            <li><a href="#"><img src="${path}/images/slider/2.jpg" ></a></li>
            <li><a href="#"><img src="${path}/images/slider/3.jpg" ></a></li>
            <li><a href="#"><img src="${path}/images/slider/4.jpg" ></a></li>
            <li><a href="#"><img src="${path}/images/slider/5.jpg" ></a></li>
            <li><a href="#"><img src="${path}/images/slider/6.jpg" ></a></li>
            <li><a href="#"><img src="${path}/images/slider/6.jpg" ></a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="wrap2">
      <span class="js-title">全部商品</span>
    </div>
    <div class="wrap">
      <div class="products">
        <c:forEach items="${dlist}" var="d">
          <div class="item">
            <a class="img" href="../api/showdetails?did=${d.id}">
              <img src="${path}/images/products/${d.imgurl}-2.jpg" alt="${d.drugName}">
            </a>
            <div class="ewm">
              <a href="../api/showdetails?did=${d.id}" class="name" target="_blank">
                  ${d.drugName}
              </a>
              <div class="st">${d.spec}</div>
              <div class="price" >
                <small>￥</small><label class="xsprice" >${d.price}</label>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
  <jsp:include page="footer.jsp"/>
  </body>
</html>
