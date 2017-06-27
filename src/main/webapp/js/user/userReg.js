var submit = function(){
	if(!checkRegInfo()){
		return;
	}
    $.ajax({
        type:"post",
        url:"user/reg/userRegister",
        data:{
            "userName":$("#input_userName").val(),
            "password":$("#input_password").val()
        },
        dataType:"json",
        success:function(data){
        	var status = data.status;
        	var msg = data.msg;
            if(status==="1"){
                alert("提示",msg,null,{type:'success'});
                window.location.href="";//返回首页
            }else{
                alert("提示",msg,null,{type:'error'});
			}
        }
    });
};

var checkRegInfo = function(){
	var userName = $("#input_userName").val();
	var password = $("#input_password").val();
	var cfpassword = $("#input_cfpassword").val();
	if(userName === "" && password === "" && cfpassword ===""){
		alert("提示","什么都不填，你注册个啥",null,null);
		return false;
	}
	if(userName === ""){
		alert("提示","用户名不能为空哦",null,null);
		return false;
	}
	if(password === ""){
		alert("提示","密码不能为空哦",null,null);
		return false;
	}
	if(password !== cfpassword){
		alert("提示","两次密码输入不一致哦",null,null);
		return false;
	}
	return true;
};