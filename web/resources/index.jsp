<%--
  Created by IntelliJ IDEA.
  User: GOU
  Date: 2020/4/3
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" scope="session" value="${pageContext.request.contextPath}"/>
<html>
  <head>
    <link rel="stylesheet" href="${path}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/css/index.css">
    <link rel="stylesheet" href="${path}/css/style.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.ico" type="image/ico" />
    <script src="${path}/js/jquery-3.4.1.js"></script>
    <script src="${path}/js/layer.js"></script>
    <script src="${path}/js/bootstrap.min.js"></script>
    <script src="${path}/js/index.js"></script>
    <title>JX商城</title>
  </head>
  <body>

  <%
    Object user2=request.getSession().getAttribute("userIF");
    if(null == user2){
  %>
  <script>
    console.log("未登录")
    $(function () {
      layer.msg("您还没有登陆，请先登录");
    })
  </script>
  <%
    }
  %>
  <jsp:include page="head.jsp"/>

  <div class="main" id="main">
    <div class="menu-box">
    </div>
    <!--内容-->
    <div class="sub-menu hide" id="sub-menu">
      <div class="inner-box">
        <div class="sub-inner-box">
          <div class="title">中西成药</div>
          <div class="sub-row">
            <span class="bold mr10">心脑血管：</span>
            <a href="">高血压</a>
            <span class="ml10 mr10">/</span>
            <a href="">糖尿病</a>
            <span class="ml10 mr10">/</span>
            <a href="">冠心病</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">男科疾病：</span>
            <a href="">阳痿早泄</a>
            <span class="ml10 mr10">/</span>
            <a href="">补肾壮阳</a>
            <span class="ml10 mr10">/</span>
            <a href="">男性不育</a>
            <span class="ml10 mr10">/</span>
            <a href="">前列腺炎</a>
            <span class="ml10 mr10">/</span>
            <a href="">男性脱发</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">肝胆用药：</span>
            <a href="">乙肝</a>
            <span class="ml10 mr10">/</span>
            <a href="">肝硬化</a>
            <span class="ml10 mr10">/</span>
            <a href="">胆结石</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">神经系统：</span>
            <a href="">癫痫</a>
            <span class="ml10 mr10">/</span>
            <a href="">痴呆</a>
            <span class="ml10 mr10">/</span>
            <a href="">帕金森</a>
            <span class="ml10 mr10">/</span>
            <a href="">抑郁症</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">风湿跌打：</span>
            <a href="">风湿病</a>
            <span class="ml10 mr10">/</span>
            <a href="">骨关节炎</a>
            <span class="ml10 mr10">/</span>
            <a href="">骨质疏松</a>
            <span class="ml10 mr10">/</span>
            <a href="">骨质增生</a>
          </div>
        </div>
      </div>
      <div class="inner-box">
        <div class="sub-inner-box">
          <div class="title">专科用药</div>
          <div class="sub-row">
            <span class="bold mr10">肝胆科：</span>
            <a href="">博路定</a>
            <span class="ml10 mr10">/</span>
            <a href="">润众</a>
            <span class="ml10 mr10">/</span>
            <a href="">贺普丁</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">肿瘤科：</span>
            <a href="">参一胶囊</a>
            <span class="ml10 mr10">/</span>
            <a href="">金克槐耳颗粒</a>
            <span class="ml10 mr10">/</span>
            <a href="">安康欣胶囊</a>
            <span class="ml10 mr10">/</span>
            <a href="">消癌平胶囊</a>
            <span class="ml10 mr10">/</span>
            <a href="">鸦胆子油软胶囊</a>
            <span class="ml10 mr10">/</span>
            <a href="">维康达</a>
            <span class="ml10 mr10">/</span>
            <a href="">易瑞沙</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">心血管：</span>
            <a href="">拜新同</a>
            <span class="ml10 mr10">/</span>
            <a href="">络活喜</a>
            <span class="ml10 mr10">/</span>
            <a href="">波依定</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">神经科：</span>
            <a href="">曲莱</a>
            <span class="ml10 mr10">/</span>
            <a href="">开浦兰</a>
            <span class="ml10 mr10">/</span>
            <a href="">安理申</a>
            <span class="ml10 mr10">/</span>
            <a href="">易倍申</a>
            <span class="ml10 mr10">/</span>
            <a href="">拉莫三嗪片</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">男科：</span>
            <a href="">金戈</a>
            <span class="ml10 mr10">/</span>
            <a href="">希爱力</a>
            <span class="ml10 mr10">/</span>
            <a href="">万艾可</a>
            <span class="ml10 mr10">/</span>
            <a href="">必利劲</a>
            <span class="ml10 mr10">/</span>
            <a href="">肾宝片</a>
            <span class="ml10 mr10">/</span>
            <a href="">左卡尼汀口服溶液</a>
          </div>
        </div>
      </div>
      <div class="inner-box">
        <div class="sub-inner-box">
          <div class="title">家庭常备</div>
          <div class="sub-row">
            <span class="bold mr10">家庭常用：</span>
            <a href="">咳嗽</a>
            <span class="ml10 mr10">/</span>
            <a href="">慢性咽炎</a>
            <span class="ml10 mr10">/</span>
            <a href="">扁桃体炎</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">感冒发烧：</span>
            <a href="">流行性感冒</a>
            <span class="ml10 mr10">/</span>
            <a href="">风寒感冒</a>
            <span class="ml10 mr10">/</span>
            <a href="">风热感冒</a>
            <span class="ml10 mr10">/</span>
            <a href="">暑湿感冒</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">消化系统：</span>
            <a href="">消化不良</a>
            <span class="ml10 mr10">/</span>
            <a href="">肠胃炎</a>
            <span class="ml10 mr10">/</span>
            <a href="">腹痛腹泻</a>
            <span class="ml10 mr10">/</span>
            <a href="">胃酸过多</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">洗衣机：</span>
            <a href="">滚筒式洗衣机</a>
            <span class="ml10 mr10">/</span>
            <a href="">迷你洗衣机</a>
            <span class="ml10 mr10">/</span>
            <a href="">洗烘一体机</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">呼吸系统：</span>
            <a href="">哮喘</a>
            <span class="ml10 mr10">/</span>
            <a href="">气管炎</a>
            <span class="ml10 mr10">/</span>
            <a href="">止咳化痰</a>
          </div>
        </div>
      </div>
      <div class="inner-box">
        <div class="sub-inner-box">
          <div class="title">营养保健</div>
          <div class="sub-row">
            <span class="bold mr10">基础营养：</span>
            <a href="">补钙</a>
            <span class="ml10 mr10">/</span>
            <a href="">维生素AD</a>
            <span class="ml10 mr10">/</span>
            <a href="">补铁</a>
            <span class="ml10 mr10">/</span>
            <a href="">补锌</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">海外购：</span>
            <a href="">旭福(Schiff)</a>
            <span class="ml10 mr10">/</span>
            <a href="">健安喜(GNC)</a>
            <span class="ml10 mr10">/</span>
            <a href="">诺澳（Now）</a>
            <span class="ml10 mr10">/</span>
            <a href="">swisse</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">关爱中老人：</span>
            <a href="">改善三高</a>
            <span class="ml10 mr10">/</span>
            <a href="">调节睡眠</a>
            <span class="ml10 mr10">/</span>
            <a href="">补钙补软骨</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">强壮男人：</span>
            <a href="">抗疲劳</a>
            <span class="ml10 mr10">/</span>
            <a href="">解酒护肝</a>
            <span class="ml10 mr10">/</span>
            <a href="">玛卡</a>
            <span class="ml10 mr10">/</span>
            <a href="">海王金樽片</a>
            <span class="ml10 mr10">/</span>
            <a href="">促睾酮素</a>
          </div>
          <div class="sub-row">
            <span class="bold mr10">美丽女人：</span>
            <a href="">补气补血</a>
            <span class="ml10 mr10">/</span>
            <a href="">排毒养颜</a>
            <span class="ml10 mr10">/</span>
            <a href="">抗衰老</a>
          </div>
        </div>
      </div>
    </div>
    <!-- 菜单 -->
    <div class="menu-content" id="menu-content">
      <div class="menu-item">
        <a href="">
          <span>中西成药</span>
          <i class="icon">&#xe665;</i>
        </a>
      </div>
      <div class="menu-item">
        <a href="">
          <span>专科用药</span>
          <i class="icon">&#xe665;</i>
        </a>
      </div>
      <div class="menu-item">
        <a href="">
          <span>家庭常备</span>
          <i class="icon">&#xe665;</i>
        </a>
      </div>
      <div class="menu-item">
        <a href="">
          <span>营养保健</span>
          <i class="icon">&#xe665;</i>
        </a>
      </div>
    </div>
    <div class="banner" id="banner">
      <a href="">
        <div class="banner-slide slide1 slide-active"></div>
      </a>
      <a href="">
        <div class="banner-slide slide2"></div>
      </a>
      <a href="">
        <div class="banner-slide slide3"></div>
      </a>
    </div>
    <a href="javascript:void(0)" class="button prev" id="prev"></a>
    <a href="javascript:void(0)" class="button next" id="next"></a>
    <div class="dots" id="dots">
      <span class="active"></span>
      <span></span>
      <span></span>
    </div>
  </div>
  <script src="${path}/js/script.js"></script>
  <div class="wrap2">
    <span class="js-title">全部商品</span>
    <c:if test="${isShow == true}">
      <div style="display: inline-block; margin-right: 20px;margin-left: 50px">
        <span>页面选择：</span>
      </div>
      <c:forEach begin="0" end="${dLength}" var="dL" varStatus="status">
        <c:if test="${isChoose == status.index+1}">
          <div class="choose_box choose">
            <a href="${path}/api/selectAllBypages?pages=${status.index+1}">${status.index+1}</a>
          </div>
        </c:if>
        <c:if test="${isChoose != status.index+1}">
          <div class="choose_box none_choose">
            <a href="${path}/api/selectAllBypages?pages=${status.index+1}">${status.index+1}</a>
          </div>
        </c:if>
      </c:forEach>
    </c:if>
    <c:if test="${isShow == false}">
      <span style="display: inline-block;margin-left:20px;line-height: 50px;height: 50px;font-family: 'Microsoft YaHei';font-size: 18px">${dMessage}</span>
    </c:if>
  </div>
  <div class="wrap">
    <div class="products">
      <c:if test="${dlist.size() == 0}">
        <div style="text-align: center;padding: 20px;color: #ccc;font-family: 'Microsoft YaHei'">
          <h3>没有找到类似的商品</h3>
        </div>

      </c:if>
      <c:forEach items="${dlist}" var="d">
        <div class="item">
          <a class="img" href="../api/showdetails?did=${d.id}">
            <img src="${path}${d.imgurl}" alt="${d.drugName}">
          </a>
          <div class="ewm">
            <a href="../api/showdetails?did=${d.id}" class="name" target="_blank">
                ${d.drugName}
            </a>
            <div class="st">${d.spec}</div>
            <div class="price" >
              <small>￥</small><label class="xsprice" >${d.price}</label>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
  <div style="margin: 0px auto;height: 30px;width: 300px;text-align: center">
    <c:if test="${isShow == true}">
      <div style="display: inline-block; margin-right: 20px">
        <span>页面选择：</span>
      </div>
      <c:forEach begin="0" end="${dLength}" var="dL" varStatus="status">
        <c:if test="${isChoose == status.index+1}">
          <div class="choose_box choose">
            <a href="${path}/api/selectAllBypages?pages=${status.index+1}">${status.index+1}</a>
          </div>
        </c:if>
        <c:if test="${isChoose != status.index+1}">
          <div class="choose_box none_choose">
            <a href="${path}/api/selectAllBypages?pages=${status.index+1}">${status.index+1}</a>
          </div>
        </c:if>
      </c:forEach>
    </c:if>
  </div>
  <jsp:include page="footer.jsp"/>
  </body>
  <c:if test="${!empty msg2 }">
    <script type="text/javascript">
      layer.msg("${msg2}",{ icon: 1,offset: "200px", time: 2000});
    </script>
  </c:if>
</html>
<!-- <div class="biger-box">
  <div class="listDrugs">
    <ul>
      <li class="op"><h4 style="font-weight: 800;">所有商品分类</h4></li>
      <li><a href="#"><i class="jiaonang"></i><h4>中西药品</h4></a></li>
      <li><a href="#"><i class="bao"></i><h4>营养保健</h4></a></li>
      <li><a href="#"><i class="hu"></i><h4>维生素钙</h4></a></li>
      <li><a href="#"><i class="yan"></i><h4>隐形眼镜</h4></a></li>
      <li><a href="#"><i class="yi"></i><h4>医疗器械、健康电器</h4></a></li>
      <li><a href="#"><i class="mu"></i><h4>美妆个护</h4></a></li>
      <li><a href="#"><i class="shen"></i><h4>参茸花茶、休闲零食</h4></a></li>
      <li><a href="#"><i class="ti"></i><h4>体检、口腔诊疗</h4></a></li>
    </ul>
  </div>
  <div class="slider">
    <div class="slider-img">
      <ul class="slider-img-ul">
        <li><a href="#"><img src="${path}/images/slider/1.jpg" ></a></li>
        <li><a href="#"><img src="${path}/images/slider/1.jpg" ></a></li>
        <li><a href="#"><img src="${path}/images/slider/2.jpg" ></a></li>
        <li><a href="#"><img src="${path}/images/slider/3.jpg" ></a></li>
        <li><a href="#"><img src="${path}/images/slider/4.jpg" ></a></li>
        <li><a href="#"><img src="${path}/images/slider/5.jpg" ></a></li>
        <li><a href="#"><img src="${path}/images/slider/6.jpg" ></a></li>
        <li><a href="#"><img src="${path}/images/slider/6.jpg" ></a></li>
      </ul>
    </div>
  </div>
</div> -->