<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, height=device-height,initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>

<title>Login</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/bootstrap/css/bootstrap.min.css">  
<script src="<%=request.getContextPath() %>/jquery/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath() %>/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div style="padding: 100px 100px 10px;">

	<form class="bs-example bs-example-form" method="POST" action="login" role="form">
		<div class="input-group">
			<span class="input-group-addon">用户</span>
			<input type="text" class="form-control" name="userName">
		</div>
		<br>
		<br>
		<div class="input-group">
			<span class="input-group-addon">密码</span>
			<input type="password" class="form-control"  name="pwd" value="11122222">
		</div>
		<br>
		<div class="form-group text-right">
			<button id="fat-btn" class="btn btn-primary"  data-loading-text="Loading..." 
	  		 	type="submit"> 登录
			</button>
		</div>
	</form>
</div>
</body>
</html>