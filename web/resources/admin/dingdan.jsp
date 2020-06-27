<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/admin.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/admin-btn.css" type="text/css" />
<script src="js/jquery-3.4.1.js"></script>
<script src="js/layer.js"></script>
<title>后台管理</title>
<style>
		.tablecss{
			width:90%;
			max-width:90%
		}
		img{
			width:120px;
			padding:8px;
		}
</style>
</head>
<body>
	<jsp:include page="top-admin.jsp" />
	<jsp:include page="left-admin.jsp" />
	<div style="margin:0px auto" class="content">
		<table border="1" class="tablecss" id="order">
		<tr>
			<th>编号</th>
			<th>商品名称</th>
			<th>购买用户</th>
			<th>用户名称</th>
			<th>是否支付</th>
			<th>订单创建时间</th>
			<th>图片</th>
			<th>操作</th>
		</tr>
			<c:forEach items="${dingdan}" var="list" varStatus="vs">
				<tr id="del">
					<td>${vs.count}</td>
					<td>${list.value.pname}</td>
					<td>${list.value.username}</td>
					<td>${list.value.nickname}</td>
					<td><c:set var="type" value="未支付"/>
						<c:set var="type_value" value="${list.value.type}"/>
						<c:if test="${type_value==1}">
							<c:set var="type" value="已支付"/>
						</c:if>
						<c:out value="${type}"/>
					</td>
					<td>${list.value.date}</td>
					<td><img src="/${list.value.imgurl}" alt="加载失败"></td>
					<td><input name='del' type='button' value='删除'
						class='inputbtn'
						onclick="deleteArticle('${list.value.orderid}')">
						</td>
				</tr>
		</c:forEach>
	</table>
	<div style="text-align: center">
		<a class="aa" href='resources/admin/shopadd.jsp'>增加商品</a>
		<a class="aa" href='resources/admin/alluser.jsp'>查询所有用户</a>
		<a class="aa" href='ShowProducts'>查询所有商品</a>
		<a class="aa" href='resources/admin/Loginadmin.jsp'>返回上一级</a>
	</div>
	</div>

	<script>
			function deleteArticle(id){
		  		var flag = confirm("你确定要删除吗？");
		  		if (flag){
		  			$.ajax({
							url:"DeleteArticle",
							type:"post",
							async:false,
							data:{chooseID:'2',"pid":id},
							success:function(data){
								 var json = $.parseJSON(data);
			                        if(json.result=='21'){
			                           	layer.msg("删除成功");
			                            window.location.reload(); //刷新页面
			                        }else{
			                        	layer.msg("删除失败");     
			                        }
							}
		  				})
	  			}
			}
	</script>
</body>
</html>