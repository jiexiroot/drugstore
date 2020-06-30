<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/6/22
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/vip.css">
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="image/ico" />
  <script src="../js/jquery-3.4.1.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/layer.js"></script>
  <script src="../js/vip.js"></script>
  <title>Title</title>
</head>
<body>

  <jsp:include page="head.jsp"></jsp:include>

  <div class="message-box">
    <h1>我的信息</h1>
    <%
      Object user2=request.getSession().getAttribute("userIF");
      if(null != user2){
    %>
    <div class="group">
      <label class="label" >vip等级：</label>
      <div class="text">
        <p class="form-control-static"><span id="w1"></span></p>
      </div>
    </div>
    <div class="group">
      <label class="label">vip积分：</label>
      <div class="text" id="choose1">
        <p class="form-control-static"><span id="w2"></span></p>
      </div>
    </div>
    <div class="group">
      <label class="label">vip有效性：</label>
      <div class="text" id="choose2">
        <p class="form-control-static"><span id="w3"></span></p>
      </div>
    </div>
    <div class="group">
      <label class="label">所有商品一律打：</label>
      <div class="text" id="choose3">
        <p class="form-control-static"><span id="w4"></span></p>
      </div>
    </div>
    <div>
      <button class="btn btn-primary btn-lg" type="button" id="editmessage" onclick="updateVip()">升级成vip</button>
    </div>
    <%
    }else{
    %>
    <script type="text/javascript">
      $(function(){
        $('.message-box').addClass('error1');
      })
    </script>
    <div class="margin-top">
      <h3>您还未登录，请先登录！</h3>
      <button class="btn btn-primary btn-lg" type="button" id="href">跳转登录</button>
    </div>
    <%
      }
    %>
  </div>

  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
