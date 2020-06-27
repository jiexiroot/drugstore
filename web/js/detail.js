/** Created by GOU on 2020-06-19 17:39  */
function addcart(){
  let $userid = $('#aid').html();
  if( $userid == null ){
    layer.confirm('当前未登录，是否跳转登录',{
      btn:['跳转','取消'] ,offset: '100px'
    },function () {
      window.location.href="../resources/login.jsp";
    })
  }else {
    let $did = $('#did').html();
    let $num = $('#quantity.num').val();
    $.ajax({
      url:"../api/addCart",
      type:"post",
      async:false,
      data:{'uid':$userid,'did':$did,'num':$num},
      success: ((data)=> {
        let json = $.parseJSON(data);
        if(json.result == '1'){
          layer.confirm('添加成功，是否跳转到购物车页面',{
            btn:['跳转','再看看'],offset:'100px'
          },function () {
            window.location.href="../resources/cart.jsp";
          },function (index) {
            layer.close(index);
          })
        }else{
          layer.msg("加入失败")
        }}
      )
    })
  }
}
function subductionNum(e){
  let $text =parseInt($(e).next().val());
  if($text==1){
    layer.msg("已到最小值！")
  }else{
    $text-=1;

    $(e).next().val($text);
  }

}
function addNum(e,Max){
  let $text =parseInt($(e).prev().val());
  if($text==Max){
    layer.msg("已到最大值！")
  }else{
    $text+=1;
    $(e).prev().val($text);
  }
}