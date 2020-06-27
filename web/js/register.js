function addError(){
    let $repeat = $("#repeat");
    $repeat.empty();
    $repeat.append(` <span class="glyphicon"></span>`)
    $repeat.children('span').addClass("glyphicon-remove-circle");
    $repeat.append("当前用户名已被注册");
    $repeat.removeClass('message_ojbk');
    $repeat.addClass('message_error');
    $('#user').parent().addClass('has-error');
}
function addOk(){
    let $repeat = $("#repeat");
    $repeat.empty();
    $repeat.append(` <span class="glyphicon"></span>`)
    $repeat.children('span').addClass("glyphicon-ok-circle");
    $repeat.append("当前用户名可用");
    $repeat.removeClass('message_error');
    $repeat.addClass('message_ojbk');
    $('#user').parent().removeClass('has-error');
}

$('#user').focus(function(){
    $('#user').parent().removeClass('has-error');
});
$(function () {
    $("#user").blur(()=>{
        let $user = $('#user').val();
        if($user!==""){
            $.ajax({
                url:"../api/repeatName",
                type:"post",
                async:false,
                data: {username : $user},
                success:data => {
                    let json = $.parseJSON(data);
                    if(json.result == 1){
                        addError()
                    }else{
                        addOk()
                    }
                }
            })
        }
    })

    $('#sub_register').bind('click', function () {
        let $user = $('#user').val();
        let $pass = $('#pass1').val();
        let $pass2 = $('#pass2').val();
        let $num = $('#num').val();
        let $nickname = $('#nickname').val();
        let $address = $('#address').val();
        let regex = /^(13[0-9]|14[0-9]|15[0-9]|166|17[0-9]|18[0-9]|19[8|9])\d{8}$/;
        if ($user != "" || $pass != "" || $pass2 != "" || $num != "") {
            if ($pass != $pass2) {
                layer.msg("两次密码不一致");
            } else if (!(regex.test($num))) {
                layer.msg("手机号码不合法");
            }else{
                $.ajax({
                    url:"../api/registerAjax",
                    type:"post",
                    async:false,
                    data:{'username':$user,'password':$pass,'telphone':$num,'address':$address,'nickname':$nickname},
                    success:function(data){
                        console.log(data);
                        let json = $.parseJSON(data);
                        let t=3
                        if(json.result=='1'){
                            layer.msg("注册成功，还有"+ t +"秒退出",{time: 3000,success:function (layero,index) {
                                    let i = t;
                                    let timer = null;
                                    let fn = function (){
                                        layero.find(".layui-layer-content").text("注册成功，还有"+ i +"秒退出");
                                        if(!i) {
                                            layer.close(index);
                                            clearInterval(timer);
                                            location.href = "login.jsp";
                                        }
                                        i--;
                                    }
                                    timer = setInterval(fn, 1000);
                                }});

                        }else{
                            layer.alert('注册失败！用户名已经存在');
                            $('#user').val("");
                        }
                    }
                
                })
            }
        }else{
            layer.msg("有空值请检查");
        }
    });
})