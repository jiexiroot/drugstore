<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/admin.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/admin-btn.css" type="text/css" />
<title>后台管理</title>
<style>
	td{
		padding:8px
	}
	.btn{
		width:100px;
	}
	</style>
</head>
<body>
	<jsp:include page="top-admin.jsp" />
	<jsp:include page="left-admin.jsp" />
	<div style="margin:0px auto" class="content">
	<div style="margin:20px auto;width:800px;text-align:center;">
		<form action="../../FileUpload" enctype="multipart/form-data" method="post" > 
			<table border="1" class="tablecss" id="order">
				<tr>
					<td>请输入商品名字：</td>
					<td><input type="text" name="shopname" class="textview"></td>
				</tr>
				<tr>
					<td>请输入价格：（单位：元）：</td>
					<td><input type="text" name="price" class="textview"></td>
				</tr>
				<tr>
					<td>请输入库存数量：</td>
					<td><input type="text" name="amount" class="textview"></td>
				</tr>			 
				<tr>
					<td>请上传商品图片：</td>
					<td><input type="file" name="shopimg" class="textview">
					  </td>
				</tr>
				<tr>
					<td>请输入备注：</td>
					<td ><textarea  name="notes" class="textview"></textarea></td>
				</tr>
			</table>
		
			<input name="create" style="margin-top:25px"  class='btn' type="submit" value="上传"/> 
			</form>
			<div style="margin:0px auto;">
				<a class="aa" href='/com.JXshop.system/ShowProducts'>查询商品</a>
				<a class="aa" href='alluser.jsp'>查询用户</a>
				<a class="aa" href='Loginadmin.jsp'>返回上一级</a>
			</div>
		</div>
		
		<script src="js/jquery-3.4.1.js"></script>
		<script>
		  		function createArticle(){
		  			
		  			var $name = $("input[name='shopname']");
		  			var $price = $("input[name='price']");
		  			var $amount = $("input[name='amount']");
		  			var $img = $("input[name=shopimg]");
			  		var $notes = $('textarea');
		  			if ($name.val() == "" ||$price.val() == "" || $amount.val() == "" || $img.val() == ""  || $notes.val() ==""){
		  				alert("有空值，请检查后重新输入！");
		  				return flase;
		  			}
			  		var reg1=/(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;<!-- 判断该输入值是否为整数或者保留两位小数类型/!-->
			  		if ($price.val().match(reg1) == null){
			  			alert("请输入正确的产品价格:整数或者保留两位小数!");
			  			$price.val('');
			  			$price.focus();
			  			return false;
			  		}else{
			  			var price=$price.val();
			  		}
			  		var reg2= /^[1-9]\d*$/;
			  		if ($amount.val().match(reg2) == null){
			  			alert("请输入正确的数量！");
			  			$amount.val('');
			  			$amount.focus();
			  			return false;
			  		}else{
			  			var amount=$amount.val();
			  		}
			  		var flag = confirm("要创建商品为"+$name.val()+"的商品吗？");
			  		if (flag){
			  			$.ajax({
							url:"CreateArticle",
							type:"post",
							async:false,
							data:{chooseid:'1',name:$name.val(),'price':price,'amount':amount,'notes':$notes.val(),'img':$img.val()},
							success:function(data){
								alert('增加成功，即将跳转查询界面！');
								window.location='flowerselect.jsp'
							}
		  				})
	  				}
			}
		</script>
	</div>
</body>
</html>