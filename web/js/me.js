$(function(){

    $.ajax({
        url: "../api/showUser",
        type: "post",
        async:false,
        success:((data)=>{
            let json = $.parseJSON(data);
            $("#w1").html(json.info.username);
            $("#w2").html(json.info.nickName);
            $("#w3").html(json.info.telphone);
            $("#w4").html(json.info.address);
        })
    })


    $('#editmessage').bind('click',function(){
        
        if($(this).text()=='修改信息'){
        let $t1 =$('#choose1').children().text();
        let $t2 =$('#choose2').children().text();
        let $t3 =$('#choose3').children().text();
        $('#choose1').children().html("<input type='text' value='"+ $t1 +"' maxlength='20' class='form-control'>");
        $('#choose2').children().html("<input type='text' value='"+ $t2 +"' maxlength='11' class='form-control'>");
        $('#choose3').children().html("<input type='text' value='"+ $t3 +"' maxlength='1' class='form-control'>");
        $(this).text("确定修改");
        }else{
            let $text1 =$('#choose1').children().children().val();
            let $text2 =$('#choose2').children().children().val();
            let $text3 =$('#choose3').children().children().val();
            let $username =$('.text:first').children().text();
            if($text1!="" || $text2!="" || $text3!=""){
                $.ajax({
                    url:"../api/EditInfo",
                    type:"post",
                    async:false,
                    data:{chooseID:'1','nickname':$text1,'telphone':$text2,'address':$text3},
                    success:function(data){
                        let json = $.parseJSON(data);
                        if(json.result=='11'){
                            $('#choose1').children().html($text1);
                            $('#choose2').children().html($text2);
                            $('#choose3').children().html($text3);
                            layer.msg('修改成功！',{icon : 1,offset: "100px"});
                        }else{
                            layer.msg("修改失败！错误的ID",{icon : 2,offset: "100px"});
                                            
                        }
                    }
                
                })

                $(this).text("修改信息");
            }else{
                layer.msg("有空值请检查",{icon : 2,offset: "100px"});
            }

           
        }  
    });
    $('#editpassword').bind('click',function(){
        window.location.href="edit.jsp"
    });
    $('#href').bind('click',function(){
        window.location.href="login.jsp"
    });
})