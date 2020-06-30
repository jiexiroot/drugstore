<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/6/29
  Time: 19:03
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <title>添加药品</title>
  <link rel="stylesheet" href="${path}/css/layui/css/layui.css">
  <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="image/ico" />
  <style>
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
            <dd>
              <a href="${path}/resources/admin/adminDrug.jsp">药品管理</a>
            </dd>
            <dd class="layui-this">
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
            <legend>添加新药品</legend>
          </fieldset>
        </div>
      </div>

      <div class="layui-row">
        <div class="layui-col-md1">&nbsp;</div>
        <div class="layui-col-md9">
          <fieldset class="layui-elem-field">
            <legend>填入信息</legend>
            <div class="layui-field-box">
              <form id="reform" class="layui-form layui-form-pane"
                    lay-filter="formFilter" action="${path}/admin/addDrug" method="post">

                <div class="layui-form-item">
                  <label class="layui-form-label">通用名</label>
                  <div class="layui-input-block">
                    <input type="text" name="drugName"  lay-verify="required" lay-reqtext="通用名是必填项，岂能为空？"
                           placeholder="请输入通用名字" autocomplete="off" class="layui-input">
                  </div>
                </div>

                <div class="layui-form-item">
                  <label class="layui-form-label">商品名</label>
                  <div class="layui-input-block">
                    <input type="text" name="shopName"
                           placeholder="请输入商品名字（可为空）" autocomplete="off" class="layui-input">
                  </div>
                </div>

                <div class="layui-form-item">
                  <label class="layui-form-label">批准编号</label>
                  <div class="layui-input-inline" style="width: 250px">
                    <input type="text" name="approval" maxlength="13" lay-verify="required" lay-reqtext="批准编号是必填项，岂能为空？"
                           placeholder="H510216XX" autocomplete="off" class="layui-input">
                  </div>
                  <div class="layui-form-mid layui-word-aux">请填写10位或者13位的配置编号</div>
                </div>

                <div class="layui-form-item">
                  <div class="layui-inline">
                    <label class="layui-form-label">生产厂商</label>
                    <div class="layui-input-inline" style="width: 250px">
                      <select name="publisherId" lay-verify="required" lay-reqtext="生产厂商是必填项，岂能为空？" lay-search="">
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
                    <label class="layui-form-label">类别</label>
                    <div class="layui-input-inline">
                      <select name="categoryId" lay-verify="required" lay-reqtext="类别是必填项，岂能为空？"  lay-search="">
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
                </div>

                <div class="layui-form-item">
                  <div class="layui-inline">
                    <label class="layui-form-label">商品规格</label>
                    <div class="layui-input-inline" style="width: 250px;">
                      <input type="text" name="spec_1" maxlength="13" lay-verify="required" lay-reqtext="商品规格是必填项，岂能为空？"
                             placeholder="" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-inline">
                    <label class="layui-form-label">包装规格</label>
                    <div class="layui-input-inline">
                      <select name="spec_2" lay-verify="required" lay-reqtext="包装规格是必填项，岂能为空？" lay-search="">
                        <option value="">--请选择--</option>
                        <option value="盒">盒</option>
                        <option value="支">支</option>
                        <option value="瓶">瓶</option>
                        <option value="罐">罐</option>
                        <option value="个">个</option>
                        <option value="袋">袋</option>
                        <option value="粒">粒</option>
                      </select>
                    </div>
                  </div>
                </div>

                <div class="layui-form-item">
                  <label class="layui-form-label">剂型</label>
                  <div class="layui-input-inline" style="width: 250px">
                    <input type="text" name="model" lay-verify="required" lay-reqtext="剂型是必填项，岂能为空？"
                           placeholder="请输入剂型" autocomplete="off" class="layui-input">
                  </div>
                  <div class="layui-form-mid layui-word-aux">剂型指方剂组成以后，根据病情与药物的特点制成一定的形态。</div>
                </div>

                <div class="layui-form-item">
                  <div class="layui-inline">
                    <label class="layui-form-label">价格</label>
                    <div class="layui-input-inline" style="width: 250px;">
                      <input type="text" name="price" lay-verify="required|number" lay-reqtext="价格不能为空"
                             placeholder="￥" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                  <div class="layui-inline">
                    <label class="layui-form-label">库存数量</label>
                    <div class="layui-input-inline">
                      <input type="text" name="amount" lay-verify="required|number" lay-reqtext="库存数量不能为空"
                             placeholder="请输入库存数量" autocomplete="off" class="layui-input">
                    </div>
                  </div>
                </div>

                <div class="layui-form-item">
                  <label class="layui-form-label ">图片:</label>
                  <div class="layui-upload">
                    <button type="button" class="layui-btn" id="test1"><i class="layui-icon layui-icon-upload"></i>上传图片</button>
                    <div class="layui-upload-list">
                      <img class="layui-upload-img" width="300px" id="demo1">
                      <p id="demoText"></p>
                    </div>
                  </div>
                </div>

                <div class="layui-form-item" >
                  <label class="layui-form-label">图片路径</label>
                  <div class="layui-input-inline" style="width: 500px">
                    <input type="text" disabled name="url_img" lay-verify="required" lay-reqtext="图片未上传，请点击上传按钮"
                           placeholder="禁止手动输入" autocomplete="off" class="layui-input image">
                  </div>
                  <div class="layui-form-mid layui-word-aux">上传后会自动填入</div>
                </div>
                <input type="hidden" name="imgurl" class="image">
                <div style="text-align: center">
                  <div class="layui-form-item">
                    <button class="layui-btn" lay-submit="reform"
                            lay-filter="reform">提交</button>
                  </div>
                </div>
              </form>
            </div>
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
<c:if test="${!empty msg }">
  <script type="text/javascript">
    layer.msg("${addMsg}",{ icon: ${addMsgId},offset: "200px"});
  </script>
</c:if>
<script>
  layui.use('upload', function(){
    let $j = layui.jquery
        ,upload = layui.upload;

    //普通图片上传
    let uploadInst = upload.render({
      elem: '#test1'
      ,url: '${path}/admin/upload/'
      ,accept:'images'
      ,size:50000
      ,before: function(obj){

        obj.preview(function(index, file, result){

          $j('#demo1').attr('src', result);
        });
      }
      ,done: function(res){
        //如果上传失败
        if(res.code > 0){
          return layer.msg('上传失败');
        }
        //上传成功
        let demoText = $j('#demoText');
        demoText.html('<span style="color: #4cae4c;">上传成功</span>');

        let fileupload = $j(".image");
        fileupload.attr("value",res.data.src);
        console.log(fileupload.attr("value"));
      }
      ,error: function(){
        //演示失败状态，并实现重传
        let demoText = $j('#demoText');
        demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
        demoText.find('.demo-reload').on('click', function(){
          uploadInst.upload();
        });
      }
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
