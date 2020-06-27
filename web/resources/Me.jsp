<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/me.css">
<script src="../js/jquery-3.4.1.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/layer.js"></script>
<script src="../js/me.js"></script>
<title>Insert title here</title>
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
			<label class="label" >用户名：</label>
			<div class="text">
			<p class="form-control-static"><span id="w1"></span></p>
			</div>
		</div>
		<div class="group">
			<label class="label">昵称：</label>
			<div class="text" id="choose1">
			<p class="form-control-static"><span id="w2"></span></p>
			</div>
		</div>
		<div class="group">
			<label class="label">电话号码：</label>
			<div class="text" id="choose2">
			<p class="form-control-static"><span id="w3"></span></p>
			</div>
		</div>
		<div class="group">
			<label class="label">地址：</label>
			<div class="text" id="choose3">
			<p class="form-control-static"><span id="w4"></span></p>
			</div>
		</div>
		<div>
			<button class="btn btn-primary btn-lg" type="button" id="editmessage">修改信息</button>
			<button class="btn btn-primary btn-lg" type="button" id="editpassword">修改密码</button>
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