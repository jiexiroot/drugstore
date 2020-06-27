<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>后台管理</title>
	</head>
	<body>
		<div class="nav">
			<div class="navleft" >
				<h3>后台管理界面</h3>
			</div>      
			<div class="navright">	
				<div class="img-box">
					<img class='nomargin' src="img/img_user3.jpg" />
				</div>
				<a class='float' href="javascript:exit();"> <span class="glyphicon glyphicon-off" aria-hidden="true"></span> 注销</a>	
				<a class='float' href="flowerpeihuo.jsp"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>消息</a>
			</div>		
		</div>	
	</body>
	<script type="text/javascript">
		function exit(){
			var flag = confirm("是否退出登录？");
			if(flag){
				<%
					request.getSession().removeAttribute("userIF");
				%>
				window.location.href='login.jsp';
			}
		}
	</script>
</html>
