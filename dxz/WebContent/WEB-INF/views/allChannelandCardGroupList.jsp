
<%@page import="com.dxz.model.Misoperator"%>
<%@page import="com.dxz.model.Vercontrol"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML >
<html>
<head>
<title>支付渠道计费编组</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, height=device-height,initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">  
<style type="text/css">
body{
font-size:10px;
}
.table>thead>tr>td, .table>thead>tr>th{
    vertical-align: middle !important;
    padding:2px;
}

.table>tbody>tr>td, .table>tbody>tr>th{
    padding:1px;
}
.pager{
margin-top:40px;
	}
.label{
margin-top:6px;
padding:1px;
}

.table-bordered>tbody>tr:nth-of-type(odd) 
{	
background-color: #e0e0e0;
}
</style>

<script src="jquery/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
</script>

</head>
<body>
<script type="text/javascript">
$(function(){
	$(".toDetailLink").each(function(){
		$(this).attr("href",$(this).attr("href")+"&fromURL="+location.href.split("/")[4]);
	});
});
</script>
<div style="padding: 5px 5px 5px;">
<% if(!"55".equals(request.getAttribute("opLevel")) && (!"99".equals(request.getAttribute("opLevel")))){ %>
 <p class="text-info text-center">没有权限！</p>
<%}%>
<% if("55".equals(request.getAttribute("opLevel")) || ("99".equals(request.getAttribute("opLevel")))){ %>
<h2 class="text-info"><span class="glyphicon glyphicon-th-large"></span>支付渠道计费编组</h2>
<div class="panel panel-default">
<!--     <div class="panel-body"> -->
 <table class="table table-bordered">
	<thead>
		<tr>
			<th>渠道名</th>
			<th>客户ID</th>
			<th>系统</th>
			<th>权重</th>
			<th>状态</th>
			<th>计费编组</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		 	<c:forEach var="channelcardgroup"   items="${cardgroupDatas}"  varStatus="status">
			 		<tr <c:if test="${channelcardgroup.enable==0}"> style="color:red" </c:if> >
						<td style="vertical-align: middle;">${channelcardgroup.chname}</td>
						<td style="vertical-align: middle;">${channelcardgroup.clientid}</td>
						<td style="vertical-align: middle;">
							<c:if test="${channelcardgroup.os%2==1}">安卓</c:if>
							<c:if test="${channelcardgroup.os%4>=2}"><br/>苹果</c:if>
							<c:if test="${channelcardgroup.os%8>=4}"><br/>Windows</c:if>
						</td>
						<td style="vertical-align: middle;">${channelcardgroup.priority}</td>
						<td style="vertical-align: middle;">
						<c:if test="${channelcardgroup.enable==1}">
							有效
						</c:if>
						<c:if test="${channelcardgroup.enable==0}">
							无效
						</c:if>
						
						</td>
						<td style="vertical-align: middle;">
						${channelcardgroup.feegroupid}<br/>
						<a class="toDetailLink" href ="toChannelCardgroup?feegroupid=${channelcardgroup.feegroupid}&channelid=${channelcardgroup.channelid}&pageNum=${pageNum}">查   看</a>
						
						
						</td>
						<td style="vertical-align: middle;"><button type="button" class="btn btn-info"  onclick="window.location.href='toUpdateChannelcardgroup?feegroupid=${channelcardgroup.feegroupid}&channelid=${channelcardgroup.channelid}&os=${channelcardgroup.os}&clientid=${channelcardgroup.clientid}&pageNum=${pageNum}'" style="display:block;width:100%">修 改</button></td>
			 		 </tr>
	    	 </c:forEach>
	</tbody>
</table>


</div>

 <ul class="pager">
   			 <%if(1 == (Integer)request.getAttribute("pageNum")) {%>
				<li  class = "disabled" ><a href="javascript:void(0);"> 上一页</a></li>
			<%} %>
			
			 <%if(1 !=  (Integer)request.getAttribute("pageNum")) {%>
				<li   ><a href="listAllChannelAndCardgroup?pageNum=${pageNum-1}"> 上一页</a></li>
			<%} %>
			
			
			 <%if(1 == (Integer)request.getAttribute("lastPage")) {%>
				<li  class = "disabled" ><a href="javascript:void(0);"> 下一页</a></li>
			<%} %>
			
			 <%if(1 !=  (Integer)request.getAttribute("lastPage")) {%>
				<li><a href="listAllChannelAndCardgroup?pageNum=${pageNum+1}"> 下一页</a></li>
			<%} %>
		</ul>
<%} %>

</div>




</body>
</html>