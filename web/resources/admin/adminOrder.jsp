<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/6/28
  Time: 21:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <link rel="stylesheet" href="${path}/css/layui/css/layui.css">
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="image/ico" />
  <script src="${path}/js/jquery-3.4.1.js"></script>
  <title>订单管理</title>
</head>
<c:if test="${empty nowadmin }">
  <script type="text/javascript">
    alert("请先登录");
    window.location.href="${path}/resources/login.jsp";
  </script>
</c:if>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <a href="${path}/admin/index" class="layui-logo">JX商城后台管理平台</a>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="adminIndex.jsp">管理员中心</a></li>
      <li class="layui-nav-item"><a href="${path}/admin/getusers">用户管理</a></li>
      <li class="layui-nav-item"><a href="${path}/resources/admin/adminDrug.jsp">商品管理</a></li>
      <li class="layui-nav-item"><a href="${path}/resources/main.jsp">返回商城页面</a></li>
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
      <li class="layui-nav-item"><a href="javascript:void(0)" onclick="logout('${path}')">退出登录</a></li>
    </ul>
  </div>

  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" lay-filter="test">

        <li class="layui-nav-item layui-nav-itemed"><a href="javascript:;">商品管理</a>
          <dl class="layui-nav-child">
            <dd>
              <a href="${path}/resources/admin/adminDrug.jsp">药品管理</a>
            </dd>
            <dd>
              <a href="${path}/resources/admin/adminAddDrug.jsp">药品添加</a>
            </dd>
            <dd class="layui-this">
              <a href="${path}/resources/admin/adminOrder.jsp">订单管理</a>
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
            <dd>
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
            <legend>订单管理</legend>
          </fieldset>
        </div>
      </div>

      <div class="layui-row">
        <div class="layui-col-md1">&nbsp;</div>
        <div class="layui-col-md10">
          <fieldset class="layui-elem-field">
            <legend>订单查询</legend>
              <div class="layui-form-item layui-col-md5">
                <label class="layui-form-label">查询条件</label>
                <div class="layui-input-block">
                  <input type="text" name="userstr" placeholder="请输入查询条件（可以为订单ID/用户ID）"
                         autocomplete="off" class="layui-input">
                </div>
              </div>
              <button  type="button"   class="layui-btn layui-btn-normal" style="margin: 0px 10px"><i class="layui-icon layui-icon-search"></i>查询</button>
          </fieldset>
        </div>
      </div>

      <div class="layui-row">
        <div class="layui-col-md1">&nbsp;</div>
        <div class="layui-col-md10">
          <fieldset class="layui-elem-field">
            <legend>订单结果</legend>
            <table class="layui-hide" id="table" lay-filter="orderTable"></table>
          </fieldset>
        </div>
      </div>

    </div>

  </div>


  <div class="layui-footer">
    <!-- 底部固定区域 -->
    ©  - JX商城后台管理平台
  </div>
</div>
<script src="${path}/css/layui/layui.all.js"></script>
<script type="text/html" id="buttonBar">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="userDetail">查看用户信息</a>
  <a class="layui-btn layui-btn-xs" lay-event="drugDetail">查看商品信息</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbar">
  <p>通过点击每行的操作按钮获得详情信息</p>
</script>
<%-- 支付字段替换 --%>
<script type="text/html" id="payInfo">
  {{# if (d.type==1) { }}
 		  <span style="color: #009688">已支付</span>
  {{# } else{ }}  
      <span style="color: #FF5722">未支付</span>
  {{# }}} 
</script>
<script>
  //JavaScript代码区域
  layui.use('element', function() {
    let element = layui.element;
    //监听导航点击
    element.on('nav(test)', function(elem) {
      //console.log(elem)
      layer.msg(elem.text());
    });
  });

  function selectDid(did){
    //iframe层
    layer.open({
      type: 2,
      title: '药品信息',
      shadeClose: true,
      shade: false,
      area: ['1000px', '650px'],
      content: '${path}/admin/getDrug?did='+did
    });
  }

  function selectUid(uid){
    //iframe层
    layer.open({
      type: 2,
      title: '用户信息',
      shadeClose: true,
      shade: false,
      area: ['1000px', '650px'],
      content: '${path}/admin/getuser?uid='+uid
    });
  }

  layui.use('table', function(){
    let table = layui.table;

    //第一个实例
    table.render({
      elem: '#table'
      ,id: 'orderT'
      ,height: 470
      ,url: '${path}/admin/getOrders' //数据接口
      ,title: '订单'
      ,toolbar: '#toolbar'
      ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
        title: '提示'
        ,layEvent: 'LAYTABLE_TIPS'
        ,icon: 'layui-icon-tips'
      }]
      ,page: true //开启分页
      ,cols: [[ //表头
        {field: 'orderid', title: '订单ID', width:80, sort: true, align: 'center' , fixed: 'left'}
        ,{field: 'uid', title: '用户ID', align: 'center' , width:80, templet: '#uidTel'}
        ,{field: 'amount', title: '购买数量', align: 'center' , width:120, sort: true}
        ,{field: 'type', title: '是否支付', align: 'center' , width:120 ,templet: '#payInfo'}
        ,{field: 'shopdate', title: '购买时间',align: 'center' , width: 180}
        ,{field: 'did', title: '商品ID', align: 'center' , width: 80, sort: true}
        ,{field: 'cid', title: '购物车ID', align: 'center' , width: 110, sort: true}
        ,{fixed: 'right', title: '操作' ,align: 'center' , toolbar: '#buttonBar'}
      ]]
    });
    table.on('toolbar(orderTable)',obj=>{
      if (obj.event === 'LAYTABLE_TIPS'){
        layer.alert('版权所有© - 杰希商城测试系统');
      }
    })
    table.on('tool(orderTable)',obj=>{
      let data = obj.data;
      if (obj.event === 'userDetail'){
        selectUid(data.uid)
      }else if (obj.event === 'drugDetail'){
        selectDid(data.did)
      }else if (obj.event === 'del'){
        layer.confirm('真的删除该行么', function(index){
          $.ajax({
            url:"${path}/api/deleteOrder",
            type:"post",
            async:false,
            data:{'oid':data.oid},
            success:function(data){
              let json = $.parseJSON(data);
              if (data.result == "1"){
                obj.del();
                layer.msg("删除成功",{icon: 1});
              }else{
                layer.msg("删除失败，订单id不存在",{icon: 2});
              }
            }
          })
          layer.close(index);
        });
      }
    })
    $('.layui-btn').click(function () {
      let inputVal = $('.layui-input').val()
      layer.msg("搜索的是包含'" + inputVal + "的结果")
      table.reload('orderT', {
        where: {
          'searchStr' : inputVal
        }
        ,page: {
          curr: 1
        }
      });
    });
  });

</script>
<script>
  function logout(path) {
    layer.confirm("是否完全退出本系统",{btn: ['退出','取消'],title: "提示"},()=>{
      window.location.href = path + "/admin/logout";
    },(index)=>{
      layer.close(index)
    })
  }
</script>
<script type="text/html" id="uidTel">
  <a href="javascript:void(0)" class="layui-table-link" onclick="selectUid('{{d.uid}}')">{{ d.uid }}</a>
</script>
</body>
</html>
