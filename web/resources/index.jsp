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
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="image/ico" />
    <script src="${path}/js/jquery-3.4.1.js"></script>
    <script src="${path}/js/layer.js"></script>
    <script src="${path}/js/bootstrap.min.js"></script>
    <script src="${path}/js/index.js"></script>
    <title>JX商城</title>
  </head>
  <body>

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
      <c:if test="${isShow == true}">
        <div style="display: inline-block; margin-right: 20px;margin-left: 50px">
          <span>页面选择：</span>
        </div>
        <c:forEach begin="0" end="${dLength}" var="dL" varStatus="status">
          <c:if test="${isChoose == status.index+1}">
            <div class="choose_box choose">
              <a href="${path}/api/selectAllBypages?pages=${status.index+1}">${status.index+1}</a>
            </div>
          </c:if>
          <c:if test="${isChoose != status.index+1}">
            <div class="choose_box none_choose">
              <a href="${path}/api/selectAllBypages?pages=${status.index+1}">${status.index+1}</a>
            </div>
          </c:if>
        </c:forEach>
      </c:if>
      <c:if test="${isShow == false}">
        <span style="display: inline-block;margin-left:20px;line-height: 50px;height: 50px;font-family: 'Microsoft YaHei';font-size: 18px">${dMessage}</span>
      </c:if>
    </div>
    <div class="wrap">
      <div class="products">
        <c:if test="${dlist.size() == 0}">
          <div style="text-align: center;padding: 20px;color: #ccc;font-family: 'Microsoft YaHei'">
            <h3>没有找到类似的商品</h3>
          </div>

        </c:if>
        <c:forEach items="${dlist}" var="d">
          <div class="item">
            <a class="img" href="../api/showdetails?did=${d.id}">
              <img src="${path}${d.imgurl}" alt="${d.drugName}">
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
    <div style="margin: 0px auto;height: 30px;width: 300px;text-align: center">
      <c:if test="${isShow == true}">
        <div style="display: inline-block; margin-right: 20px">
          <span>页面选择：</span>
        </div>
        <c:forEach begin="0" end="${dLength}" var="dL" varStatus="status">
          <c:if test="${isChoose == status.index+1}">
            <div class="choose_box choose">
              <a href="${path}/api/selectAllBypages?pages=${status.index+1}">${status.index+1}</a>
            </div>
          </c:if>
          <c:if test="${isChoose != status.index+1}">
            <div class="choose_box none_choose">
              <a href="${path}/api/selectAllBypages?pages=${status.index+1}">${status.index+1}</a>
            </div>
          </c:if>
        </c:forEach>
      </c:if>
    </div>
  </div>
  <jsp:include page="footer.jsp"/>
  </body>
  <c:if test="${!empty msg2 }">
    <script type="text/javascript">
      layer.msg("${msg2}",{ icon: 1,offset: "200px", time: 2000});
    </script>
  </c:if>
</html>
