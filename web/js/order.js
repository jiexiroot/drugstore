
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
    let oid = $(e).parents("tr").attr("id").split("-");
    $(e).parents("tr").remove();
    $.ajax({
        url:"../api/deleteOrder",
        type:"post",
        async:false,
        data:{ids: parseInt(oid[0])},
        success:((data)=>{
            let json = $.parseJSON(data);
            if(json.result == "1"){
                layer.msg("删除成功", {icon: 1,offset: '200px'})
            }else{
                layer.msg("该订单不存在", {icon: 2,offset: '200px'})
            }
        })
    })
}

$(function(){
    let $userid = $('#aid').html();
    if($userid == null){
        layer.msg("当前未登录，请先登录，1秒后跳转")
        window.location.href = "login.jsp"
    }else{
        $.ajax({
            url:"../api/showorder",
            type:"post",
            async:false,
            data:{},
            success: ((data)=>{
                let json = $.parseJSON(data);
                if(json.result  == '2'){
                    $("#wrap").empty();
                    $("#wrap").append(
                        `<div class="blankcart clearfix">
                  <div class="container">
                      <span class="icons carttip"></span>
                      <p>您的订单还是空的，杰希商城恭喜您身体健康！</p>
                      <p>如果您有时间，可以随便逛逛！</p>
                      <a class="ibtn1 one-pan-link-mark" href="index.jsp">去逛一下</a>
                  </div>
              </div>`
                    )
                }else{
                    let allPrice = 0;
                    for(let i=0; i < json.message.length; i++){
                        let orderList = json.message[i];
                        allPrice += orderList.buyAmount * orderList.price;
                        $(".table02 .head").after(
                            `
              <tr class="ischoose" id="${orderList.orderid}-${orderList.did}" >
                <td class="w1">
                  <div class="ck js-ck js-ck-medicine" onclick="choose(this)"><i class="checked"></i></div>
                </td>
                <td class="w2">
                  <a target="_blank" href="../api/showdetails?did=${orderList.did}" class="">
                    <img src="/drugstore/${orderList.imgurl}" alt="${orderList.shopName}  ${orderList.drugName}">
                  </a>
                </td>
                <td class="w3" style="width: 470px">
                  <p class="drug_link">
                    <a target="_blank" class="clearfix" href="../api/showdetails?did=${orderList.did}">
                      <i class="icon_otc fl"></i>
                      <strong class="drug_str">${orderList.shopName}  ${orderList.drugName}</strong>
                    </a>
                  </p>
                  <p>规格：${orderList.spec}</p>
                  <p>厂家：${orderList.name}</p>
                </td>
                <td class="w8">
                  未支付
                </td>
                <td class="w4">
                  <span class="money2">￥${orderList.price}</span>
                </td>
                <td class="w5">
                 <span class="num js-num">${orderList.buyAmount}</span>
                </td>
                <td class="w6" style="text-align: center">
                  <span class="money js-money">￥${orderList.buyAmount* orderList.price}</span>
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
    let price =parseFloat($('.js-cart-total').html());
    if(h_length==0) {
        layer.msg("当前未选择任何商品",{icon:2,offset:"200px"})
    }else{
        let ids = "";
        for(let i = 0; i < h_length; i++){
            let id_2 = $(h[i]).parents("tr").attr("id").split("-");
            if (i==h_length-1){
                ids = ids + id_2[0] ;
            }else{
                ids = ids + id_2[0] +"_";
            }

        }
        // console.log(ids);
        window.location.href = "../api/alipay?ids=" + ids + "&price=" + price;
    }


}