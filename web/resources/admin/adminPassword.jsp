<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>

<head>
<meta charset="UTF-8">
<title>管理员安全设置</title>
<link rel="stylesheet" href="${path}/css/layui/css/layui.css">
	<c:if test="${empty nowadmin }">
		<script type="text/javascript">
			layer.alert("请先登录");
			setTimeout(()=>{
				window.location.href="${path}/resources/login.jsp";
			},1500);
		</script>
	</c:if>
	<c:if test="${!empty msg }">
		<script type="text/javascript">
			layer.msg("${msg}",{ icon: 2,offset: "200px"});
		</script>
	</c:if>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<a href="${path}/admin/index" class="layui-logo">JX商城后台管理平台</a>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="${path}/adminIndex.jsp">管理员中心</a></li>
				<li class="layui-nav-item"><a href="${path}/admin/getusers.do">用户管理</a></li>
				<li class="layui-nav-item"><a href="${path}/admin/getschools.do">商品管理</a></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;">
					${nowadmin.username} </a>
					<dl class="layui-nav-child">
						<dd>
							<a href="adminIndex.jsp">个人信息</a>
						</dd>
						<dd>
							<a href="adminPassword.jsp">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="${path}/admin/logout">退出登录</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">

					<li class="layui-nav-item layui-nav-itemed"><a href="javascript:;">商品管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="${path}/admin/getschools.do">商品管理</a>
							</dd>
							<dd>
								<a href="${path}/admin/gettasks.do">订单管理</a>
							</dd>
						</dl></li>

					<li class="layui-nav-item layui-nav-itemed"><a href="javascript:;">用户管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="${path}/admin/getusers">用户维护</a>
							</dd>
						</dl></li>

					<li class="layui-nav-item layui-nav-itemed"><a class=""
																												 href="javascript:;">管理员中心</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="${path}/resources/admin/adminIndex.jsp">个人信息</a>
							</dd>
							<dd  class="layui-this">
								<a href="${path}/resources/admin/adminPassword.jsp">安全设置</a>
							</dd>
							<dd>
								<a href="${path}/resources/admin/adminAddAdmin.jsp">添加管理员</a>
							</dd>
						</dl></li>

				</ul>
			</div>
		</div>
		<!-- 内容主体区域-->
		<div class="layui-body">

			<div style="padding: 30px;" class="layui-fluid">
				<div class="layui-row">
					<div class="layui-col-md12">
						<span class="layui-badge-dot"></span> <span
							class="layui-badge-dot layui-bg-orange"></span> <span
							class="layui-badge-dot layui-bg-green"></span> <span
							class="layui-badge-dot layui-bg-cyan"></span> <span
							class="layui-badge-dot layui-bg-blue"></span> <span
							class="layui-badge-dot layui-bg-black"></span> <span
							class="layui-badge-dot layui-bg-gray"></span>
						<fieldset class="layui-elem-field layui-field-title"
							style="margin-top: 30px;">
							<legend>安全设置</legend>
						</fieldset>
					</div>
				</div>

				<div class="layui-row">
					<div class="layui-col-md1">&nbsp;</div>
					<div class="layui-col-md9">
						<fieldset class="layui-elem-field">
							<legend>密码修改</legend>
							<form id="reform" class="layui-form layui-form-pane" style="padding: 30px;"
								action="${path}/admin/updatepwd" method="post">

								<input type="hidden" name="uid" lay-verify="uid"
									value="${nowadmin.id }">

								<div class="layui-form-item">
									<label class="layui-form-label">原密码</label>
									<div class="layui-input-inline">
										<input type="password" name="oldpassword" placeholder="请输入密码"
											lay-verify="oldpassword" autocomplete="off"
											class="layui-input">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label">新密码</label>
									<div class="layui-input-inline">
										<input type="password" name="password" placeholder="请输入密码"
											lay-verify="password" autocomplete="off" class="layui-input">
									</div>
								</div>

								<div class="layui-form-item">
									<button class="layui-btn" lay-submit="reform"
										lay-filter="reform">保存</button>
								</div>
							</form>
						</fieldset>

					</div>
					<div class="layui-col-md1">&nbsp;</div>
				</div>

			</div>

		</div>



		<div class="layui-footer">
			<!-- 底部固定区域 -->
			©  - JX商城后台管理平台
		</div>
	</div>
	<script src="${path}/css/layui/layui.all.js"></script>
	<script>
		layui.use([ 'form' ], function() {
			let form = layui.form,
				layer = layui.layer;
	
			//自定义验证规则
			form.verify({
				aid : function(value) {
					if (value.length < 1) {
						return '编号错误';
					}
				},
				oldpassword : [ /(.+){3,12}$/, '密码都是3到12位的哦' ],
				password : [ /(.+){3,12}$/, '新密码必须3到12位' ]
			});
	
			//监听提交
			form.on('submit(reform)', function(data) {
			// 	layer.alert(JSON.stringify(data.field), {
			// 		title : '最终的提交信息'
			// 	})
			// return false;
			});
	
	
		});
	</script>
</body>
</html>
