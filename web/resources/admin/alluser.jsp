<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" 
    import="java.util.ArrayList,java.util.List,com.JXshop.system.Pojo.User,com.JXshop.system.service.ShopService,com.JXshop.system.service.imp.ShopServiceImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/admin.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/admin-btn.css" type="text/css" />
<title>后台管理</title>
<style>
		.tablecss{
			width:80%;
			max-width:80%
		}
	</style>
</head>
<body>
	<jsp:include page="top-admin.jsp" />
	<jsp:include page="left-admin.jsp" />
	<div style="margin:0px auto" class="content">
		<table border="1" class="tablecss" id="order">
		<tr>
			<th>用户名</th>
			<th>电话号码</th>
			<th>操作</th>
		</tr>
		<%
			response.setContentType("text/html;charset=utf-8");
			ShopService shopService = new ShopServiceImpl();  
			List<User> user = shopService.selectuser();
			for (User us : user) {
		%>

		<tr id="del<%=us.getUserid()%>">
			<td><%=us.getUsername()%></td>
			<td><%=us.getTelphone()%></td>
			<td><input name='del' type='button' value='删除'
				class='inputbtn'
				onclick="deleteArticle(<%=us.getUserid()%>)"></td>
		</tr>
		<%
			}
		%>
	</table>
	<div style="text-align: center">
		<a class="aa" href='flowerselect.jsp'>查询鲜花种类</a>
		<a class="aa" href='flowerpeihuo.jsp'>查询订单</a>
		<a class="aa" href='flowercreate.jsp'>增加鲜花种类</a>
		<a class="aa" href='Loginadmin.jsp'>返回上一级</a>
	</div>
	</div>
	<script src="js/jquery-3.4.1.js"></script>
	<script>
			function deleteArticle(id){
		  		var flag = confirm("你确定要删除吗？");
		  		if (flag){
		  			$.ajax({
							url:"../../DeleteArticle",
							type:"post",
							async:false,
							data:{chooseID:'1',"userid":id},
							success:function(data){
								window.location.reload(); //刷新页面
							}
		  				})
	  			}
			}
	</script>
</body>
</html>