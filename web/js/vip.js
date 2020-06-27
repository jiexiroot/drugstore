$(function(){
    let userid = $('#aid').text();
    if(userid == null) {
        layer.msg("当前未登录,2秒跳转登录",{icon: 2, offset: "100px"});
        setTimeout(()=>{
            window.location.href="../login.jsp"
        },2000)
    }else{
        $.ajax({
            url: "../api/showVipInfo",
            type: "post",
            async:false,
            success:((data)=>{
                let json = $.parseJSON(data);
                    if(json.result == "1"){
                    let points = json.info.points;
                    let levelName = json.info.levelName;
                    let flag = true;
                    if (json.info.mid.length == 0){
                        $("#editmessage").html("升级成vip");
                        flag = false;
                        points = 0;
                        levelName = "现在不是会员";
                    }
                    $("#editmessage").html("当前已是VIP");
                    $("#editmessage").attr("disabled","disabled");
                    $("#w1").html(levelName);
                    $("#w2").html(points);
                    $("#w3").html(flag?"有效":"无效");
                    let zhikou =  parseInt(100-json.info.lid*5)+"%";
                    $("#w4").html(zhikou);

                }else{
                    let levelName = "现在不是会员";
                    let points = 0;
                    let flag = false;
                    $("#w1").html(levelName);
                $("#w2").html(points);
                    $("#w3").html(flag?"有效":"无效");
                    $("#w4").html("不打折");
                }
            })
        })
    }
})

function updateVip() {
    $.ajax({
        url: "../api/updateVip",
        type: "post",
        async:false,
        success: ((data)=>{
            let json = $.parseJSON(data);
            if(json.result == "1"){
                layer.msg('升级成功！',{icon : 1,offset: "100px"});
                window.location.reload();
            }else{
                layer.msg("服务器连接错误",{icon : 2,offset: "100px"});
            }
        })
    })
}