<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/5/13
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/head.css">
    <script>
        let t = 3;
        $(function(){
            $('#exit').bind("click",function(){
                let flag = layer.confirm("确认退出登录吗？",{btn : ['退出','取消'],offset : '200px'},function () {
                    $.ajax({
                        url:"${pageContext.request.contextPath}/api/logout",
                        type:"post",
                        async:false,
                        data:{},
                        success:function(data){
                            if (data.resultId==1){
                                layer.msg("还有"+ t +"秒退出",{time: 3000,success:function (layero,index) {
                                        let i = t;
                                        let timer = null;
                                        let fn = function (){
                                            layero.find(".layui-layer-content").text("还有"+ i +"秒退出");
                                            if(!i) {
                                                layer.close(index);
                                                clearInterval(timer);
                                                location.href = "${pageContext.request.contextPath}/resources/index.jsp";
                                            }
                                            i--;
                                        }
                                        timer = setInterval(fn, 1000);
                                    }});
                            }
                        }
                    })
                },function () {
                    layer.msg('取消退出',{time : 2000});
                });

            });
        })
    </script>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">杰希商城</a>
        </div>
        <div>
            <p class="navbar-text" style="color: #ff3300">好货八方供,好货天天销</p>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <%
                Object user2=request.getSession().getAttribute("userIF");
                if(null == user2){
            %>

            <li><a href="${pageContext.request.contextPath}/resources/register.jsp"><span class="glyphicon glyphicon-user"></span>
                注册</a></li>
            <li><a href="${pageContext.request.contextPath}/resources/login.jsp"><span class="glyphicon glyphicon-log-in"></span>
                登录</a></li>
            <%
            }else{
            %>
            <script>
                $(function(){
                    $('nav ul').addClass("nav-width");
                })
            </script>
            <div>
                <p class="navbar-text" >你好， ${userIF.username}用户</p>
                <%--                  <p style="display:none" id='aid'>${userIF.userid}</p>--%>
            </div>
            <li><a id='cart' href="cart.jsp" ><span class="glyphicon glyphicon-shopping-cart"></span>
                我的购物车</a></li>
            <li><a href="order.jsp"><span class="glyphicon glyphicon-th-list"></span>
                我的订单</a></li>
            <li><a href="Me.jsp"><span class="glyphicon glyphicon-user"></span>
                我的信息</a></li>
            <li><a id='exit' href="javascript:void(0);"><span class="glyphicon glyphicon-log-in"></span>
                退出登录</a></li>

            <% } %>
        </ul>
    </div>
</nav>
<div class="header-box">
    <div class="logo-box"><img src="${pageContext.request.contextPath}/images/logo.png" width="96px" alt="logo"></div>

    </div>
</div>
</body>
</html>
