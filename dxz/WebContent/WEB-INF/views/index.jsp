<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>查找用户信息</title>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, height=device-height,initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
</head>
<body>
	<center>
		<a href="getvercontrolList?pageNum=1&opId=oERc0wPi8YaE7SnPk27nS7Q5aP24.wx">版本控制</a><br>
		<a href="getMisoperatorList?pageNum=1&opId=oERc0wPi8YaE7SnPk27nS7Q5aP24.wx">用户权限控制</a><br>
		<a href="gets2sconfigList?pageNum=1&opId=oERc0wPi8YaE7SnPk27nS7Q5aP24.wx">中心服务器管理</a><br>
		<a href="getgameserverinfoList?pageNum=1&opId=oERc0wPi8YaE7SnPk27nS7Q5aP24.wx">游戏服务器管理</a><br>
		<a href="getPaymentchannelList?pageNum=1&opId=oERc0wPi8YaE7SnPk27nS7Q5aP24.wx">渠道商管理</a><br>
		<a href="getCardgroupList?pageNum=1&opId=oERc0wPi8YaE7SnPk27nS7Q5aP24.wx">计费列表</a><br>
		<a href="listAllChannelAndCardgroup?pageNum=1&opId=oERc0wPi8YaE7SnPk27nS7Q5aP24.wx">渠道商计费列表</a>
	</center>
</body>
</html>