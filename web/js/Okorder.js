
$(function(){
    let $userid = $('#aid').html();
    if($userid == null){
        layer.msg("当前未登录，请先登录，1秒后跳转")
        window.location.href = "login.jsp"
    }else{
        $.ajax({
            url:"/drugstore/api/showOkorder",
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
                      <p>没有完成支付的订单，杰希商城恭喜您身体健康！</p>
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
                 
                </td>
                <td class="w2">
                  <a target="_blank" href="/drugstore/api/showdetails?did=${orderList.did}" class="">
                    <img src="/drugstore/${orderList.imgurl}" alt="${orderList.shopName}  ${orderList.drugName}">
                  </a>
                </td>
                <td class="w3" style="width: 470px">
                  <p class="drug_link">
                    <a target="_blank" class="clearfix" href="/drugstore/api/showdetails?did=${orderList.did}">
                      <i class="icon_otc fl"></i>
                      <strong class="drug_str">${orderList.shopName}  ${orderList.drugName}</strong>
                    </a>
                  </p>
                  <p>规格：${orderList.spec}</p>
                  <p>厂家：${orderList.name}</p>
                </td>
                <td class="w8">
                  已支付
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
                  <a href="javascript:void(0);" class="js-delete ">无</a>
                </td>
              </tr>
              `
                        );
                    }
                }
            })
        })
    }

})



