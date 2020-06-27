<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/admin.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/btn.css" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="top-admin.jsp" />
	<jsp:include page="left-admin.jsp" />
	<div style="margin:0px auto" class="content">
		<h1>管理员用户，欢迎你</h1>
		<button class='btn btn-primary btn-block btn-large' name="selectflower" onclick="window.location.href='/com.JXshop.system/ShowProducts'">查询商品库存</button>
		<button class='btn btn-primary btn-block btn-large' name="selectuser" onclick="window.location.href='/com.JXshop.system/resources/admin/alluser.jsp'">查询用户</button>
		<button class='btn btn-primary btn-block btn-large' name="selectpeihuo" onclick="window.location.href='/com.JXshop.system/AllorderServlet'">查询订单</button>
		<button class='btn btn-primary btn-block btn-large' name="create" onclick="window.location.href='/com.JXshop.system/resources/admin/shopadd.jsp'">增加商品</button>

	</div>
	
</body>
</html>