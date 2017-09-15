
<%@page import="com.dxz.model.Misoperator"%>
<%@page import="com.dxz.model.Vercontrol"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML >
<html>
<head>
<title>支付渠道商</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, height=device-height,initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">  
<style type="text/css">
body{
font-size:16px;
}
.table>thead>tr>td, .table>thead>tr>th{
    vertical-align: middle !important;

}
</style>

<script src="jquery/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<%int pageNum = (Integer)request.getAttribute("pageNum"); %>
<script type="text/javascript">

function delVercontrol(id){
	location.href="delVer?pageNum=<%=pageNum %>&id="+ id;
}

</script>
</head>
<body>
<div style="padding: 10px 10px 10px;">
<% if(!"55".equals(request.getAttribute("opLevel")) && (!"99".equals(request.getAttribute("opLevel")))){ %>
 <p class="text-info text-center">没有权限！</p>
<%}%>


<% if("55".equals(request.getAttribute("opLevel")) || ("99".equals(request.getAttribute("opLevel")))){ %>
<h2 class="text-info"><span class="glyphicon glyphicon-th-large"></span>  支付渠道商 <button type="button" class="btn btn-success"   style="float:right;margin-right:5px" onclick="window.location.href='toAddPaymentchannel'">添 加</button></h2>
<div class="panel panel-default">
    <div class="panel-body">
 <table class="table table-striped">
	<thead>
		<tr>
			<th>名称</th>
			<th>系统</th>
			<th>状态</th>
			<th align="right" style="vertical-align:middle;text-align:center;">操作</th>
		</tr>
<!-- 		<tr> -->
<!-- 			<th>上版本</th> -->
<!-- 			<th>下版本</th> -->
			
<!-- 		</tr> -->
	</thead>
	<tbody>
		
		
	 <c:forEach var="paymentchannel"   items="${paymentChannelList}"  >
		 <tr>
				<td style="vertical-align: middle;">${paymentchannel.chname}</td>
				<td style="vertical-align: middle;"><c:if test="${paymentchannel.os%2==1}">安卓</c:if><c:if test="${paymentchannel.os%4>=2}"> 苹果</c:if><c:if test="${paymentchannel.os%8>=4}"> Windows</c:if></td>
				<td style="vertical-align: middle;"><c:if test="${paymentchannel.enable==1}">有效</c:if><c:if test="${paymentchannel.enable==0}">无效</c:if></td>
				<td style="vertical-align:middle;text-align:center;" > 
					<button type="button" class="btn btn-info"  onclick="window.location.href='listCardGroupByChannelId?channelId=${paymentchannel.channelid}'" style="display:block;width:100%">计 费</button><br/>
					<button type="button" class="btn btn-warning"  onclick="window.location.href='toUpdatePaymentchannel?id=${paymentchannel.channelid}'" style="display:block;width:100%">修 改</button>
				</td>
    		</tr>
    	 </c:forEach>
	</tbody>
</table>
    <ul class="pager">
   			 <%if(1 == (Integer)request.getAttribute("pageNum")) {%>
				<li  class = "disabled" ><a href="javascript:void(0);"> 上一页</a></li>
			<%} %>
			
			 <%if(1 !=  (Integer)request.getAttribute("pageNum")) {%>
				<li   ><a href="getPaymentchannelList?pageNum=<%= (pageNum -1)%>"> 上一页</a></li>
			<%} %>
			
			
			 <%if(1 == (Integer)request.getAttribute("lastPage")) {%>
				<li  class = "disabled" ><a href="javascript:void(0);"> 下一页</a></li>
			<%} %>
			
			 <%if(1 !=  (Integer)request.getAttribute("lastPage")) {%>
				<li   ><a href="getPaymentchannelList?pageNum=<%= (pageNum +1)%>"> 下一页</a></li>
			<%} %>
		</ul>
    </div>
</div>
<%} %>

</div>




</body>
</html>