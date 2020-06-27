$(function(){
    $('#editmessage').bind('click',function(){
        window.location.href="Me.jsp"
    });
    $('#editpassword').bind('click',function(){
        let $text1 =$('#choose1').children().text();
        let $text2 =$('#choose2').children().children().val();
        let $text3 =$('#choose3').children().children().val();
        if($text2!="" || $text3!=""){
            if ($text2!=$text3){
                layer.msg("两次密码不一样，请检查！",{icon : 2,offset: "100px"});
            }else{
                $.ajax({
                    url:"../api/EditInfo",
                    type:"post",
                    async:false,
                    data:{chooseID:'2','username':$text1,'password':$text2},
                    success:function(data){
                        let json = $.parseJSON(data);
                        if(json.result=='21'){
                            layer.msg('修改成功！跳转登录界面,2秒后跳转',{icon : 1,offset: "100px"});
                            setTimeout(()=>{
                                window.location.href="login.jsp"
                            },2000)
                        }else{
                            layer.msg("修改失败！",{icon : 2,offset: "100px"});
                        }
                    }
                
                })
            }
        }else{
            layer.msg("有空值请检查",{icon : 2,offset: "100px"});
        }
    });
    $('#href').bind('click',function(){
        window.location.href="login.jsp"
    });
});