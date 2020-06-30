
function computed(e,num){
  let price = $(e).parents("tr").find(".w4").children().html().split("￥");
  let sum = parseFloat(price[1]) * parseInt(num);
  return sum;
}
function computedSum(){
  let all = $('.table02 .ischoose .w6');
  let all_length = $('.table02 .ischoose .w6').length;
  let total_price = 0;
  for (let i = 0; i < all_length ; i++) {
    let price = $(all[i]).children().text().split("￥");
    total_price += parseFloat(price[1])
  }
  $(".js-total").html("￥" + total_price.toFixed(2));
  $(".js-cart-total").html(total_price.toFixed(2));
}
function choose(e){
  let class_1 = $(e).children();
  let clasName = $(e).children().attr("class")
  if (clasName == "checked"){
    $(e).children().removeClass("checked")
    $(e).parents("tr").removeClass("ischoose")
    $(".js-checkAll").children().removeClass("checked")
    $(".js-shop-ck").children().removeClass("checked")
  }else{
    $(e).children().addClass("checked")
    $(e).parents("tr").addClass("ischoose")
  }
  computedSum();
}
function selectAll(e) {
  let this_class = $(e).children().attr("class");
  if (this_class == "checked"){
    $(".ck").children().removeClass("checked")
    $(".table02 tr").removeClass("ischoose");
    computedSum();
  }else{
    $(".ck").children().removeClass("checked");
    $(".ck").children().addClass("checked");
    $(".table02 tr").addClass("ischoose");
    $(".table02 .head").addClass("ischoose");
    computedSum();
  }
}
function delthis(e) {
  let cid = $(e).parents("tr").attr("id").split("-");
  $(e).parents("tr").remove();
  $.ajax({
    url:"../api/delCart",
    type:"post",
    async:false,
    data:{ids: parseInt(cid[0])},
    success:((data)=>{
      let json = $.parseJSON(data);
      if(json.result == "1"){
        layer.msg("删除成功", {icon: 1,offset: '200px'})
      }else{
        layer.msg("该购物车订单不存在", {icon: 2,offset: '200px'})
      }
    })
  })
}
function subductionNum(e){
  let $text =parseInt($(e).next().val());
  if($text==1){
    layer.msg("已到最小值！")
  }else{
    $text-=1;
    $(e).parents("tr").find(".w6").children().html("￥" + computed(e,$text));
    $(e).next().val($text);
    computedSum();
  }

}
function addNum(e,Max){

  let $text =parseInt($(e).prev().val());

  if($text==Max){
    layer.msg("已到最大值！")
  }else{
    $text+=1;
    $(e).parents("tr").find(".w6").children().html("￥" + computed(e,$text));
    $(e).prev().val($text);
    computedSum();
  }
}

$(function(){
  let $userid = $('#aid').html();
  if($userid == null){
    layer.msg("当前未登录，请先登录，1秒后跳转")
    window.location.href = "login.jsp"
  }else{
    $.ajax({
      url:"../api/showCart",
      type:"post",
      async:false,
      data:{uid: $userid},
      success: ((data)=>{
        let json = $.parseJSON(data);
        if(json.result  == '2'){
          $("#wrap").empty();
          $("#wrap").append(
              `<div class="blankcart clearfix">
                  <div class="container">
                      <span class="icons carttip"></span>
                      <p>您的购物车还是空的，杰希商城恭喜您身体健康！</p>
                      <p>如果您有时间，可以随便逛逛！</p>
                      <a class="ibtn1 one-pan-link-mark" href="index.jsp">去逛一下</a>
                  </div>
              </div>`
          )
        }else{
          let allPrice = 0;
          for(let i=0; i < json.cart.length; i++){
            let cartList = json.cart[i];
            allPrice += cartList.cartAmount * cartList.price;
            $(".table02 .head").after(
              `
              <tr class="ischoose" id="${cartList.cartid}-${cartList.did}" >
                <td class="w1">
                  <div class="ck js-ck js-ck-medicine" onclick="choose(this)"><i class="checked"></i></div>
                </td>
                <td class="w2">
                  <a target="_blank" href="../api/showdetails?did=${cartList.did}" class="">
                    <img src="/drugstore/${cartList.imgurl}" alt="${cartList.shopName}  ${cartList.drugName}">
                  </a>
                </td>
                <td class="w3" style="width: 470px">
                  <p class="drug_link">
                    <a target="_blank" class="clearfix" href="../api/showdetails?did=${cartList.did}">
                      <i class="icon_otc fl"></i>
                      <strong class="drug_str">${cartList.shopName}  ${cartList.drugName}</strong>
                    </a>
                  </p>
                  <p>规格：${cartList.spec}</p>
                  <p>厂家：${cartList.name}</p>
                </td>
                <td class="w4">
                  <span class="money2">￥${cartList.price}</span>
                </td>
                <td class="w5">
                                  <span class="quantity">
                                      <a class="sub jian js-sub " href="javascript:void(0);" onclick="subductionNum(this)"></a>
                                      <input type="text" class="num js-num" value="${cartList.cartAmount}">
                                      <a class="add jia js-add " href="javascript:void(0);" onclick="addNum(this,${cartList.amount})"></a>
                                  </span>
                </td>
                <td class="w6" style="text-align: center">
                  <span class="money js-money">￥${cartList.cartAmount* cartList.price}</span>
                </td>
                <td class="w7" style="text-align: center">
                  <a href="javascript:void(0);" class="js-delete " onclick="delthis(this)"> 删除</a>
                </td>
              </tr>
              `
            );
            $('.js-total').html("￥" + allPrice);
            $('.js-cart-total').html(allPrice);
          }
        }
      })
    })
  }

})



function shopOrder(){
    let userid = $('#aid').text();
    let h = $('.table02 .js-ck-medicine .checked');
    let h_length = $('.table02 .js-ck-medicine .checked').length;
    if(h_length==0) {
      layer.msg("当前未选择任何商品",{icon:2,offset:"200px"})
    }else{
      let orders = new Array();
      for(let i = 0; i < h_length; i++){
        let order = new Object();
        order.uid = parseInt(userid);
        order.amount = parseInt($(h[i]).parents("tr").find("input").val());
        let id_2 = $(h[i]).parents("tr").attr("id").split("-");
        order.did = parseInt(id_2[1]);
        order.cid = parseInt(id_2[0])
        orders.push(order);
      }
      console.log(JSON.stringify(orders))
      $.ajax({
        url:"../api/addorder",
        type:"post",
        async:false,
        contentType: "application/json;charset=UTF-8",
        dataType:"json",
        // traditional:true, //传list对象
        data:JSON.stringify({'orders': orders}),
        success: ((data)=>{
          if(data.result=="1"){
            layer.confirm('生成订单成功，是否订单页面',{
              btn:['跳转','取消'],offset:'100px',icon: 1
            },function () {
              window.location.href="../resources/order.jsp";
            },function (index) {
              layer.close(index);
              window.location.reload();
            })
          }
        })
      })
    }


}