
<%@page import="com.dxz.model.Misoperator"%>
<%@page import="com.dxz.model.Vercontrol"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML >
<html>
<head>
<title>记费列表编组</title>
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

 .table-bordered>tbody>tr  
 {	 
 background-color: #e0e0e0; 
 } 
</style>

<script src="jquery/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	function  toupdate(feegroup){
		window.location.href='toUpdateCardgroup?feegroupid='+feegroup;
	}
</script>

</head>
<body>
<div style="padding: 5px 5px 5px;">
<% if(!"55".equals(request.getAttribute("opLevel")) && (!"99".equals(request.getAttribute("opLevel")))){ %>
 <p class="text-info text-center">没有权限！</p>
<%}%>

<% if("55".equals(request.getAttribute("opLevel")) || ("99".equals(request.getAttribute("opLevel")))){ %>
<h2 class="text-info"><span class="glyphicon glyphicon-th-large"></span>记费列表编组  <button type="button" class="btn btn-success"   style="float:right;margin-right:5px" onclick="window.location.href='toAddCardgroup'">添 加</button></h2>
<div class="panel panel-default">
<!--     <div class="panel-body"> -->
 <table class="table table-bordered">
	<thead>
		<tr>
			<th colspan="6"  style="font-size:16px">计费列表 </th>
		</tr>
	</thead>
	
	<tbody>
		 	<c:forEach var="cardgroup"   items="${cardgroupList}"  varStatus="status">
			 		<c:if test="${status.index%6==0}">
			 			<tr <c:if test="${status.index%12!=0}"> style="background-color: white;"</c:if>  ><td style="font-weight:bold" colspan="6" >编组ID:${cardgroup.feegroup}</td></tr>
			 			<tr <c:if test="${status.index%12!=0}">  style="background-color: white;"</c:if>    onclick="toupdate('${cardgroup.feegroup}')">
			 		</c:if>
						<td style="vertical-align: middle;">${cardgroup.roomcard}+${cardgroup.giftcard}<br/>&yen;${cardgroup.money/100}<br/>${cardgroup.payid}</td>
					<c:if test="${status.index%6==5}">
			 		 </tr>
			 		</c:if>
	    	 </c:forEach>
	</tbody>
</table>


</div>

 <ul class="pager">
   			 <%if(1 == (Integer)request.getAttribute("pageNum")) {%>
				<li  class = "disabled" ><a href="javascript:void(0);"> 上一页</a></li>
			<%} %>
			
			 <%if(1 !=  (Integer)request.getAttribute("pageNum")) {%>
				<li   ><a href="getvercontrolList?pageNum=${pageNum-1}"> 上一页</a></li>
			<%} %>
			
			
			 <%if(1 == (Integer)request.getAttribute("lastPage")) {%>
				<li  class = "disabled" ><a href="javascript:void(0);"> 下一页</a></li>
			<%} %>
			
			 <%if(1 !=  (Integer)request.getAttribute("lastPage")) {%>
				<li><a href="getvercontrolList?pageNum=${pageNum-1}"> 下一页</a></li>
			<%} %>
		</ul>
<%} %>

</div>




</body>
</html>