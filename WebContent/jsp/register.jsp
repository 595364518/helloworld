<%--
  Created by IntelliJ IDEA.
  User: 最潇洒的猪
  Date: 2019/9/2
  Time: 下午 8:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <style type="text/css">
    *{
    	margin: 0px;
    	padding:0px;
    }
    div {
		width: 50%;
		margin: 0 auto;
	}
	body {
	background: url("${pageContext.request.contextPath}/img/bg.jpg");
	background-size:100%;
	opacity: 1.5;
}
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"/>
    <script src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function () {
    	$("#username").keydown(function(){
    		$("#error1").text("");
    	})
        $("#email").keydown(function () {
            $("#error5").text("");
        })
    	$("#sub").click(function () {
    		var $params = $("#username").val();
            var $email = $("#email").val();
    		var url = "/small_tiger/checkUsers";
			$.ajax({
				url:url,
				type:"post",
				data:{"username":$params,"email":$email},
				success:function(d){
					if (d==0) {
						document.getElementById("error1").innerHTML="用户名已存在";
			        	$("#error1").css("color","red");
			        	$("#username").focus();
						$("#username").text("");
						return;
					}else if(d==1){
                        document.getElementById("error5").innerHTML="该邮箱已被注册";
                        $("#error5").css("color","red");
                        $("#email").focus();
                        $("#email").text("");
                        return;
					}
					document.getElementById("error5").innerHTML="";
                    checkNull();
                },
				error:function(d){
					alert(d.msg);
				},
				dataType:"json"
			})
			
		})
	})
	function checkNull(){
    	var email = document.getElementById("email").value;
    	var atpos = email.indexOf("@");
    	var username = document.getElementById("username").value;
    	var password = document.getElementById("password").value;
    	var age = document.getElementById("age").value;
        if(username == "" || username == null){
        	document.getElementById("error1").innerHTML="用户名不能为空";
        	$("#error1").css("color","red");
        	$("#username").focus();
        	$("#username").blur(function() {
        		if(("#username").value!=""){            			
	            	document.getElementById("error1").innerHTML="";
        		}
			})
        }else{            	
            if(password == "" || password == null){
            	document.getElementById("error2").innerHTML="密码不能为空";
            	$("#error2").css("color","red");
            	$("#password").focus();
            	$("#password").blur(function() {
            		if(("#password").value!=""){            			
		            	document.getElementById("error2").innerHTML="";
            		}
				})
            }else{
            	if(age<=0||age>=150){
            		document.getElementById("error3").innerHTML="年龄必须在1-149之间";
                	$("#error3").css("color","red");
            		document.getElementById("age").value="";
            		$("#age").focus();
            		$("#age").blur(function() {
                		if(("#age").value!=""){            			
    		            	document.getElementById("error3").innerHTML="";
                		}
    				})
            	}else{	            		
		            if(email == "" || email == null){
		            	document.getElementById("error5").innerHTML="邮箱不能为空";
		            	$("#error5").css("color","red");
		            	$("#email").focus();
		            	$("#email").blur(function() {
		            		if(("#email").value!=""){            			
				            	document.getElementById("error5").innerHTML="";
		            		}
						})
		            }else{
		                if(atpos<=1||atpos>=email.length-1){
		                	document.getElementById("error5").innerHTML="请输入正确的邮箱格式";
		                	$("#error5").css("color","red");
		            		$("#email").val("");
			            	$("#email").focus();
			            	$("#email").blur(function() {
			            		if($("#email").value!=""){            			
					            	document.getElementById("error5").innerHTML="";
			            		}
							})
		            	}else{
		            		var $username = $("#username").val();
		            		var $email = $("#email").val();
		    				var url = "/small_tiger/sendEmail";
		    				$.ajax({
		    					url:url,
		    					type:"post",
		    					data:{"username":$username,"email":$email},
		    					datatype:'json',
		    					success:function(d){
		    						if(d == 1){
		    							alert("发送成功");
		    						}else{
		    							alert("发送失败");
		    						}
		    					}
		    				}) 
		            	}
		            }
            	}
            }
        }
        $("#sub1").click(function(){
        	if($("#checkCode").val()==""||$("#checkCode").val()==null){
        		document.getElementById("error4").innerHTML="请输入验证码";
        		$("#error4").css("color","red");
        		$("#checkCode").focus(function(){
		        	document.getElementById("error4").innerHTML="";        			
        		})
        		return;
        	}
				var $checkCode = $("#checkCode").val();
				var username = $("#username").val();
				var url = "/small_tiger/checkCode";
				$.ajax({
					url:url,
					type:"post",
					data:{"checkCode":$checkCode,"username":username},
					success:function(d){
						if(d == 0){
							alert("验证码错误");
							$("#checkCode").val("");
							$("#checkCode").focus();
							return;
						}else{
							alert("验证码正确，点击确认跳转~");
							$("#form1").submit();
						}
					}
				})
			})
    }
    </script>
</head>
<body>
<audio src="${pageContext.request.contextPath }/music/WhyWouldIEver.mp3" loop="loop" autoplay="autoplay" controls="controls"></audio>
<div>
<form id="form1" role="form" name="form1" method="post" action="${pageContext.request.contextPath }/regist">
    <p align="center" style="font-size: 36px; color: aqua; font-weight: bolder;">注册用户 </p>
   	<div class="form-group">
   		<label for="username">用户名：</label>
        <input type="text" class="form-control" placeholder="请输入用户名" name="username" id="username" /><span id="error1"></span>
   	</div>
   	<div class="form-group">
    	<label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
        <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码"/><span id="error2"></span>
    </div>
    <div class="form-group">
    	<label for="age">年&nbsp;&nbsp;&nbsp;&nbsp;龄：</label>
        <input type="text" name="age" class="form-control" id="age" placeholder="请输入年龄" oninput="value=value.replace(/[^\d]/g,'')" /><span id="error3"></span>
    </div>
    <div class="form-group">
    	<label for="email">邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
        <input type="text" class="form-control" name="email" id="email" placeholder="请输入邮箱" /><input type="button" id="sub" class="btn btn-primary" value="发送验证码"/><span id="error5"></span>
    </div>
    <div class="radio"> 
    	<label for="sex" style="font-weight: bold;">性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
      &nbsp;&nbsp;&nbsp;&nbsp;  <input type="radio" name="sex" id="man" value="男" checked />男
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;   <input type="radio" name="sex" id="woman" value="女" />女
    </div>
    <div class="form-group">
    	<label for="checkCode">验&nbsp;证&nbsp;码：</label>
        <input type="text" class="form-control" name="checkCode" id="checkCode" placeholder="请输入验证码" /><span id="error4"></span>
    </div>
    <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-primary" name="sub1" id="sub1" value="注册"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<input type="reset" class="btn btn-secondary" name="reset" id="reset" value="重置" />
    </div>
</form>
</body>
</html>
