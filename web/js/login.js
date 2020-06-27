$(function(){


    $('#sumbit').bind('click',function(){
        let $user = $('#username');
        let $pass = $('#password');
        if ($user.val()=="" || $pass.val()==""){
            layer.msg("有空值，请检查");
            $user.parent().addClass('has-error');
            $pass.parent().addClass('has-error');
        }else{
            $.ajax({
                url:"../api/loginAjax",
                type:"post",
                async:false,
                data:{'loginName':$user.val(),'password':$pass.val()},
                success:function(data){
                    let json = $.parseJSON(data);
                    if(json.result=='0'){
                        layer.msg('密码或账户名错误');
                        $user.parent().addClass('has-error');
                        $pass.parent().addClass('has-error');
                        $pass.val("");
                    }else if(json.result=='2'){
                        layer.msg('账号已被禁止登陆，请联系管理员');
                    }else{
                        layer.msg('登录成功,1秒后跳转');
                        setTimeout(()=>{
                            window.location.href="/drugstore/resources/index.jsp"
                        },1000)
                    }

                }
            });
        }
    });
    $("#username").focus();
    $(document).keyup(function(event){
        if(event.keyCode ==13){
            console.log(1);
            $("#sumbit").trigger("click");
        }
    });
    $('#username').focus(function(){
    	$('#username').parent().removeClass('has-error');
    });
    $('#password').focus(function(){
    	$('#password').parent().removeClass('has-error');
    });
});


