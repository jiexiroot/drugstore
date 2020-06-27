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
			width:80%;
			max-width:80%
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
			<th>价格</th>
			<th>备注</th>
			<th>库存</th>
			<th>图片</th>
			<th>操作</th>
		</tr>
			<c:forEach items="${products}" var="list" varStatus="vs">
				<tr id="del">
					<td>${vs.count}</td>
					<td>${list.value.pname}</td>
					<td>$${list.value.price}</td>
					<td>${list.value.notes}</td>
					<td>${list.value.amount}</td>
					<td><img src="/${list.value.imgurl}" alt="加载失败"></td>
					<td><input name='del' type='button' value='删除'
						class='inputbtn'
						onclick="deleteArticle('${list.value.pid}')">
						<input name='del' type='button' value='修改' style="background-color:#0099FF"
						class='inputbtn'
						onclick="alertArticle(this,'${list.value.pid}')"></td>
				</tr>
		</c:forEach>
	</table>
	<div style="text-align: center">
		<a class="aa" href='resources/admin/shopadd.jsp'>增加商品</a>
		<a class="aa" href='resources/admin/alluser.jsp'>查询所有用户</a>
		<a class="aa" href='AllorderServlet'>查询所有订单</a>
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
			
			function alertArticle(e,id){
				if ($(e).val()=="修改"){
					var all = $(e).parents('tr').children();
					var $pname = $(all[1]).text();
					var $price = $(all[2]).text().replace('$','');
					var $notes = $(all[3]).text();
					var $amount = $(all[4]).text();
					$(all[1]).html("<input type='text' value='"+ $pname +"' width='186px' height='40px' Style='line-height:40px'>" );
					$(all[2]).html("<input type='text' value='"+ $price +"' width='118px' height='40px' Style='line-height:40px'>");
					$(all[3]).html("<input type='text' value='"+ $notes +"' width='186px' height='40px' Style='line-height:40px'>");
					$(all[4]).html("<input type='text' value='"+ $amount +"'width='86px' height='40px' Style='line-height:40px'>");
					
					$(e).val('确定');
				}else{
					var all = $(e).parents('tr').children();
					var pname = $(all[1]).children();
					var $pname = $(pname[0]).val();
					var price = $(all[2]).children();
					var $price = $(price[0]).val();
					var notes = $(all[3]).children();
					var $notes = $(notes[0]).val();
					var amount = $(all[4]).children();
					var $amount = $(amount[0]).val();
					$(all[1]).text($pname);
					$(all[2]).text($price);
					$(all[3]).text($notes);
					$(all[4]).text($amount);
					$(e).val('确定');
					$.ajax({
						url:"AlterServlet",
						type:"post",
						async:false,
						data:{'pid':id,'pname':$pname,'price':$price,'notes':$notes,'amount':$amount},
						success:function(data){
							 var json = $.parseJSON(data);
		                        if(json.result=='1'){
		                           	layer.msg("修改成功");
		                            window.location.reload(); //刷新页面
		                        }else{
		                        	layer.msg("修改失败");     
		                        }
						}
	  				})
				}
			}
	</script>
</body>
</html>