$(function(){
			$('#sub_btn').bind('click',function(){
				var $user = $('#username');
		        var $pass = $('#password');
		        $.ajax({
		            url:"../../DetermineServlet",
		            type:"post",
		            async:false,
		            data:{'username':$user.val(),'password':$pass.val()},
		            success:function(data){
		                var json = $.parseJSON(data);
		                if(json.result=='0'){
		                    layer.msg('密码或账户名错误');
		                    $user.parent().addClass('has-error');
		                    $pass.parent().addClass('has-error');
		                    $pass.val("");
		                }else if(json.result=='3'){
		                	layer.msg('登陆成功，欢迎您'+$user.val()+'用户');
		                	window.location.href="Loginadmin.jsp";
		                }else{
		                    layer.msg('权限不足，请联系管理员申请');
		                    window.location.href="index.jsp"                        
		                }
		               
		            }
			});
		});
})