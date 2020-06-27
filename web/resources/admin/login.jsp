<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>JX商城</title>
<link rel="stylesheet" href="css/Untitled-2.css">
<script src="../../js/jquery-3.4.1.js"></script>
<script src="../../js/layer.js"></script>
<script src="../admin/js/login.js"></script>
</head>

<body>
	<div class="all">
		<div class="ted">
				<a  href="../index.jsp">
					<img width="107px"  src="img/logo.png" alt="logo" />
				</a>		
		</div>
		<div class="container" id="sub_form">
			
				<div class="input_row clearfix mb20">
					<input type="text" class="input_list"  id="username" required="required" value="${user.username}" placeholder="输入用户名登录" />
				</div>
				<div class="input_row clearfix">
					<input type="password" class="input_list"  id="password" required="required" value="${user.password}" placeholder="输入密码" />
				</div>
				<div class="sub_list_b">
					<input type="checkbox" id="save_pwd" name="pwd" value="" />
					<label for="save_pwd">记住密码</label>
					<a class="right" style="color:#fff;" href="../register.html">注册用户</a>
				</div>
				<div class="input_row">
					<input type="button" id="sub_btn" class="input_list sub_btn" name="" value="登录" />
				</div>
		</div>
	</div>



</body>
</html>
