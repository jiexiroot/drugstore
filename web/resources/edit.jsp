<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="../css/me.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/jquery-3.4.1.js"></script>
<script src="../js/bootstrap.min.js"></script>
	<script src="../js/layer.js"></script>
<script src="../js/edit.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="message-box">
		<h1>修改密码</h1>
		<%
			Object user2=request.getSession().getAttribute("userIF");
			if(null != user2){
		%>
		<div class="group">
			<label class="label" style="margin-left:-180px;width:280px">用户名：</label>
			<div class="text"  id="choose1">
			<p class="form-control-static">${userIF.username}</p>
			</div>
		</div>
		<div class="group">
			<label class="label pass_width" style="margin-left:-180px;width:280px">新密码：</label>
			<div class="text" id="choose2"  style="font-size:16px">
			<p class="form-control-static"><input class="form-control" width="210px" type="password" placeholder="请输入新密码"></p>
			</div>
		</div>
		<div class="group">
			<label class="label pass_width"  style="margin-left:-180px;width:280px">重复输入新密码：</label>
			<div class="text" id="choose3" style="font-size:16px" >
			<p class="form-control-static"><input class="form-control" type="password" placeholder="重复输入新密码"></p>
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