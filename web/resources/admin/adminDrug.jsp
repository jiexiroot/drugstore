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
  <title>药品管理</title>
  <style>
    .layui-table-cell{
      height: 55px;
      line-height: 55px;
    }
  </style>
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
            <dd class="layui-this">
              <a href="${path}/resources/admin/adminDrug.jsp">药品管理</a>
            </dd>
            <dd>
              <a href="${path}/resources/admin/adminAddDrug.jsp">药品添加</a>
            </dd>
            <dd>
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
            <legend>药品管理</legend>
          </fieldset>
        </div>
      </div>

      <div class="layui-row">
        <div class="layui-col-md12">
          <fieldset class="layui-elem-field">
            <legend>药品查询</legend>
              <form class="layui-form">
                <div class="layui-form-item">
                  <div class="layui-inline">
                    <label class="layui-form-label">查询条件</label>
                    <div class="layui-input-block" style="width: 290px">
                      <input type="text" name="userstr" placeholder="请输入查询条件（可以为通用名/药品名）"
                               autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-inline">
                    <label class="layui-form-label" style="width: 80px;">生产厂商</label>
                    <div class="layui-input-inline" style="width: 250px">
                      <select name="publisherId" lay-search="">
                        <option value="">--请选择--</option>
                        <option value="1">JX商城测试有限公司</option>
                        <option value="2">四川济生堂药业有限公司</option>
                        <option value="3">江西川奇药业有限公司</option>
                        <option value="4">广州市龙力贸易发展有限公司</option>
                        <option value="5">LifeScan Europe</option>
                        <option value="6">南京白敬宇制药有限责任公司</option>
                        <option value="7">青岛伦敦杜蕾斯有限公司</option>
                        <option value="8">东阿阿胶股份有限公司</option>
                      </select>
                    </div>
                  </div>
                  <div class="layui-inline">
                    <label class="layui-form-label" style="width: 50px;">类别</label>
                    <div class="layui-input-inline">
                      <select name="categoryId" lay-search="">
                        <option value="">--请选择--</option>
                        <option value="1">中西药品</option>
                        <option value="2">养生保健</option>
                        <option value="3">医疗器械</option>
                        <option value="4">计生用品</option>
                        <option value="5">中药饮片</option>
                        <option value="6">美容护肤</option>
                        <option value="7">其他</option>
                      </select>
                    </div>
                  </div>
                  <div class="layui-inline">
                    <button  type="button" class="layui-btn layui-btn-normal" style="margin: 0px 10px"><i class="layui-icon layui-icon-search"></i>查询</button>
                  </div>
                </div>
              </form>
          </fieldset>
        </div>
      </div>

      <div class="layui-row">
        <div class="layui-col-md12">
          <fieldset class="layui-elem-field">
            <legend>药品结果</legend>
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
<script>
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
</script>
<script type="text/html" id="buttonBar">
  <a class="layui-btn layui-btn-xs" lay-event="drugDetail">修改/查看商品信息</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbar">
  <p>通过点击每行的操作按钮获得详情信息</p>
</script>
<%-- 支付字段替换 --%>
<script type="text/html" id="cBox">
  {{# if (d.categoryId==1) { }}
 		  <span>中西药品</span>
  {{# } else if(d.categoryId=== 2) { }}
      <span>养生保健</span>
  {{# } else if(d.categoryId=== 3) { }}
      <span>医疗器械</span>
  {{# } else if(d.categoryId=== 4) { }}
      <span>计生用品</span>
  {{# } else if(d.categoryId=== 5) { }}
      <span>中药饮片</span>
  {{# } else if(d.categoryId=== 6) { }}
      <span>美容护肤</span>
  {{# } else if(d.categoryId=== 7) { }}
      <span>其他</span>
  {{# }}} 
</script>
<script type="text/html" id="imgBox">
  <img width="50px" src="${path}/{{d.imgurl}}" alt="图片加载失败">
</script>
<script type="text/html" id="pBox">
  {{# if (d.publisherId==1) { }}
 		  <span>JX商城测试有限公司</span>
  {{# } else if(d.publisherId=== 2) { }}
      <span>四川济生堂药业有限公司</span>
  {{# } else if(d.publisherId=== 3) { }}
      <span>江西川奇药业有限公司</span>
  {{# } else if(d.publisherId=== 4) { }}
      <span>广州市龙力贸易发展有限公司</span>
  {{# } else if(d.publisherId=== 5) { }}
      <span>LifeScan Europe</span>
  {{# } else if(d.publisherId=== 6) { }}
      <span>南京白敬宇制药有限责任公司</span>
  {{# } else if(d.publisherId=== 7) { }}
      <span>青岛伦敦杜蕾斯有限公司</span>
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

  layui.use('table', function(){
    let table = layui.table;

    //第一个实例
    table.render({
      elem: '#table'
      ,id: 'orderT'
      ,height: 470
      ,url: '${path}/admin/getDrugs' //数据接口
      ,title: '订单'
      ,toolbar: '#toolbar'
      ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
        title: '提示'
        ,layEvent: 'LAYTABLE_TIPS'
        ,icon: 'layui-icon-tips'
      }]
      ,page: true //开启分页
      ,cols: [[ //表头
        {field: 'id', title: '药品ID', width:80, sort: true, align: 'center' , fixed: 'left'}
        ,{field: 'imgurl', title: '图片', align: 'center' , width:80, templet: '#imgBox'}
        ,{field: 'drugName', title: '通用名', align: 'center' , width:120, sort: true}
        ,{field: 'publisherId', title: '厂商名',align: 'center' , width: 177, templet: '#pBox'}
        ,{field: 'categoryId', title: '种类', align: 'center' , width: 90, templet: '#cBox'}
        ,{field: 'model', title: '剂型', align: 'center' , width: 108 }
        ,{field: 'price', title: '价格', align: 'center', width: 80, sort: true}
        ,{field: 'amount', title: '库存数量', align: 'center', width: 95}
        ,{field: 'publishDate', title: '上架时间', align: 'center', width: 180, sort: true}
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
      if (obj.event === 'drugDetail'){
        selectDid(data.id)
      }else if (obj.event === 'del'){
        layer.confirm('是否删除该商品', {btn: ["是","否"], icon: 5, title: '删除'}, function (index) {
          layer.confirm('确定删除么',{btn: ["确定删除","还是算了"],icon: 2, title: '确定删除'}, function(index){
            $.ajax({
              url:"${path}/admin/deleteDrugs",
              type:"post",
              async:false,
              data:{'did':data.id},
              success:function(data){
                let json = $.parseJSON(data);
                if (json.result == "1"){
                  obj.del();
                  layer.msg("删除成功",{icon: 1});
                }else{
                  layer.msg("删除失败，商品id不存在",{icon: 2});
                }
              }
            })
            layer.close(index);
          }, function (index) {
            layer.close(index);
          })
        }, function (index) {
          layer.close(index);
        });
      }
    })
    $('.layui-btn').click(function () {
      let inputVal = $('.layui-input').val();
      let categoryId = $("[name='categoryId']").val();
      let publisherId = $("[name='publisherId']").val();
      let longStr = "";
      if (inputVal.length !=0) {
        longStr += "'" + inputVal + "'，";
      }
      if( categoryId.length !=0) {
        longStr += " '" + $("[name='categoryId'] option[value= '" + categoryId + "']").html() + "'，";
      }
      if( publisherId.length !=0){
        longStr += " '" + $("[name='publisherId'] option[value= '" + publisherId + "']").html() + "'";
      }
      if (longStr.length ==0){
        layer.msg("未填入搜索值，遍历输出所有药品数据")
      }else{
        layer.msg("搜索的是包含{" + longStr + "}的结果")
      }

      table.reload('orderT', {
        where: {
          'searchStr' : inputVal,
          'cStr': categoryId,
          'pStr': publisherId
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
</body>
</html>
