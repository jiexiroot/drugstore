$(function(){
	$('#exit').bind("click",function(){
		var flag = confirm("确认退出登录吗？");
  		if (flag){
  			$.ajax({
					url:"../FunctionServlet",
					type:"post",
					async:false,
					data:{choose:'1'},
					success:function(data){
						window.location.href="index.jsp";
					}
  				})
			}
	});
})