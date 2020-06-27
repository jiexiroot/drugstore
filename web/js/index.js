(function($){

    var xSlider = function(el, userConfig) {
  
      var _this = this
      this.el = el
  
      // 参数配置
      this.userConfig = userConfig
      this.config = {
        w: this.el.width(),
        current: 0,
        speed: 500,
        intervalTime: 5000
      }
      if(userConfig != null) {
        $.extend(this.config,this.userConfig);
      }
  
      // 保存查找dom元素
      var slider_img = this.el.children('.slider-img')
      var slider_img_ul = slider_img.children('ul')
      var slider_img_ul_li = slider_img_ul.children('li')
  
      // 初始化左右按钮
      this.el.append('<a href="javascript:" class="slider-btn slider-btn-left">&lt;</a>')
      this.el.append('<a href="javascript:" class="slider-btn slider-btn-right">&gt;</a>')
      var slider_btn_left = this.el.children('.slider-btn-left')
      var slider_btn_right = this.el.children('.slider-btn-right')
  
      // 初始化圆点
      this.el.append('<div class="slider-dot"><ul></ul></div>')
      var slider_dot = this.el.children('.slider-dot')
      var slider_dot_ul = slider_dot.children('ul')
      var slider_img_length = slider_img_ul_li.length
      for (var i = 0; i < slider_img_length - 2; i++) {
        if(i === this.config.current){
          slider_dot_ul.append('<li class="active"></li>')
        } else {
          slider_dot_ul.append('<li></li>')
        }
      }
      var slider_dot_ul_li = slider_dot_ul.children('li')
  
      // 初始化默认显示图片位置
      slider_img_ul.css('left', - this.config.w * this.config.current - this.config.w)
  
      // 圆点切换点亮
      var active = function(i) {
        slider_dot_ul_li.removeClass('active')
        slider_dot_ul_li.eq(i).addClass('active')
      }
  
      // 右点击事件
      slider_btn_right.on('click', function(event) {
        event.preventDefault()
        if(_this.config.current < slider_img_length - 2){
          toggleInterval ()
          _this.config.current ++
          if(_this.config.current != slider_img_length - 2) {
            slider_img_ul.stop(true, false).animate({left: - _this.config.w * _this.config.current - _this.config.w}, _this.config.speed, function () {
              active(_this.config.current)
            })
          }
          if (_this.config.current === slider_img_length - 2) {
            slider_img_ul.stop(true, false).animate({left: - _this.config.w * _this.config.current - _this.config.w}, _this.config.speed, function() {
              slider_img_ul.css('left', - _this.config.w)
              _this.config.current = 0
              active(_this.config.current)
            })
          }
        }
      })
  
      // 左点击事件
      slider_btn_left.on('click', function(event) {
        event.preventDefault()
        if(_this.config.current > -1){
          toggleInterval ()
          _this.config.current --
          if(_this.config.current != -1){
            slider_img_ul.stop(true, false).animate({left: - _this.config.w * _this.config.current - _this.config.w}, _this.config.speed, function() {
              active(_this.config.current)
            })
          }
          if(_this.config.current === -1){
            slider_img_ul.stop(true, false).animate({left: 0}, _this.config.speed, function() {
              slider_img_ul.css('left', - _this.config.w * (slider_img_length - 2))
              _this.config.current = slider_img_length - 3
              active(_this.config.current)
            })
          }
        }
      })
  
      // dot点击事件
      slider_dot_ul_li.on('click', function(event) {
        event.preventDefault()
        toggleInterval ()
        var index = $(this).index()
        active(index)
        slider_img_ul.stop(true, false).animate({left: - _this.config.w * index - _this.config.w}, _this.config.speed, function() {
          _this.config.current = index
        })
      })
  
      // 自动切换
      var sliderInt = setInterval(sliderInterval, _this.config.intervalTime)
      // 判断图片切换
      function sliderInterval() {
        if (_this.config.current < slider_img_length - 2) {
          _this.config.current ++
          slider_img_ul.stop(true, false).animate({left: - _this.config.w * _this.config.current - _this.config.w}, _this.config.speed, function() {
            active(_this.config.current)
            if (_this.config.current === slider_img_length - 2) {
              slider_img_ul.css('left', - _this.config.w)
              _this.config.current = 0
              active(_this.config.current)
            }
          })
        }
      }
      // 重置计时器
      function toggleInterval () {
        clearInterval(sliderInt)
        sliderInt = setInterval(sliderInterval, _this.config.intervalTime)
      }
  
    } // --end-- xSlider
  
    $.fn.extend({
      xSlider: function() {
        new xSlider($(this))
      }
    })
  
  })(jQuery)
  
  var config = {
    current: 0,
    speed: 500,
    intervalTime: 2000
  }
  $(function(){
    $('.slider').xSlider(config);
  })
  function select(pid){
    $.ajax({
      url:"../SelectServlet",
      type:"post",
      async:false,
      data:{chooseID:'1','pid':pid},
      success:function(data){
          var json = $.parseJSON(data);
          if(json.result=='11'){
              window.location.href="shop.jsp"
          }else{
              layer.alert('未查询到该商品的详细信息');
          }
      }
  
  })
}
function cartadd(id){
	  var userid= $('#aid').text();
	  if (userid==""){
        layer.confirm("未登录是否跳转登录", {btn: ['跳转','取消']},function(index){
        window.location.href="Login.html";
        layer.close(index);
      },function(index){
        layer.close(index);
      });
	   
	  }else{
	    $.ajax({
	      url:"../CartServlet",
	      type:"post",
	      async:false,
	      data:{chooseID:'2','pid':id,'userid':userid},
	      success:function(data){
	          var json = $.parseJSON(data);
	          if(json.result=='21'){
                layer.confirm("增加购物车成功，是否跳转到购物车？", {btn: ['跳转','取消']},function(index){
                  window.location.href="cart.jsp";
                  layer.close(index);
                },function(index){
                  layer.close(index);
                });
	          }else{
	              layer.alert('加入购物车失败');
	          }
	      }
	  
	    })
	  }
	}
function showpages(pages){
  $.ajax({
    url:"/drugstore/api/selectAll",
    type:"post",
    async:false,
    data:{pages: pages},
    success: (data) => {
      var json = $.parseJSON(data);
      console.log(json.message)
    }
  })
}

$(function(){
  $(".listDrugs li").mouseover(function(){
    let beforeClass = $(this).find("i").attr("class");
    $(this).find("i").removeClass(beforeClass);
    $(this).find("i").addClass(beforeClass+"_hover");
  })
  $(".listDrugs li").mouseout(function(){
    let beforeClass = $(this).find("i").attr("class")+"";
    let afterClass = beforeClass.split("_");
    $(this).find("i").removeClass(beforeClass);
    $(this).find("i").addClass(afterClass[0]);
  })

})
  