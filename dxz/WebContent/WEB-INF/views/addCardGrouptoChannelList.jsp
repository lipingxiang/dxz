
<%@page import="com.dxz.model.Misoperator"%>
<%@page import="com.dxz.model.Vercontrol"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE HTML >
<html>
<head>
<title>记费管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, height=device-height,initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">  
<style type="text/css">
body{
font-size:10px;
}
.table>thead>tr>td, .table>thead>tr>th{
    vertical-align: middle !important;
    padding:3px;

}

.table>tbody>tr>td, .table>tbody>tr>th{
    padding:4px;

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
function back(){
	location.href="listCardGroupByChannelId?channelId=${paymentChannel.channelid}";
}


function  toAddDetail(feegroup){
	window.location.href='toAddCardgroupdetail?feegroupid='+feegroup+'&channelid='+${paymentChannel.channelid};
}


</script>
</head>
<body>
<div style="padding: 5px 5px 5px;">
<% if(!"55".equals(request.getAttribute("opLevel")) && (!"99".equals(request.getAttribute("opLevel")))){ %>
 <p class="text-info text-center">没有权限！</p>
<%}%>


<% if("55".equals(request.getAttribute("opLevel")) || ("99".equals(request.getAttribute("opLevel")))){ %>
<h2 class="text-info"><span class="glyphicon glyphicon-th-large"></span>添加计费编组 </h2>
<div class="panel panel-default">
<!--     <div class="panel-body"> -->
<!--  <table class="table table-striped"> -->
<!-- 	<thead> -->
<!-- 		<tr> -->
<!-- 			<th colspan="7"  style="font-size:16px">计费列表</th> -->
<!-- 		</tr> -->
<!-- 	</thead> -->
	
	
<!-- 	<tbody> -->
<%-- 		 	<c:forEach var="cardgroup"   items="${cardgroupList}"  varStatus="status"> --%>
<%-- 			 		<c:if test="${status.index%6==0}"> --%>
<!-- 			 		<tr> -->
<%-- 			 		</c:if> --%>
<%-- 						<td style="vertical-align: middle;">${cardgroup.roomcard}/${cardgroup.giftcard}<br/>&yen;${cardgroup.money}</td> --%>
<%-- 					<c:if test="${status.index%6==5}"> --%>
<!-- 						<td>  -->
<%-- 					 		<button type="button" class="btn btn-success"   style="width:50px;padding:6px 0px"   onclick="window.location.href='addCardGrouptoChannel?feegroup=${cardgroup.feegroup}&channelid=${paymentChannel.channelid}'">添 加</button> --%>
<!-- 						</td> -->
<!-- 			 		 </tr> -->
<%-- 			 		</c:if> --%>
<%-- 	    	 </c:forEach> --%>
<!-- 	</tbody> -->
<!-- </table> -->
<table class="table table-bordered">
	<thead>
		<tr>
			<th colspan="6"  style="font-size:16px">计费列表 </th>
		</tr>
	</thead>
	
	<tbody>
		 	<c:forEach var="cardgroup"   items="${cardgroupList}"  varStatus="status">
			 		<c:if test="${status.index%6==0}">
<%-- 			 			<tr  onclick="toAddDetail('${cardgroup.feegroup}')"> --%>
			 			
			 			<tr <c:if test="${status.index%12!=0}"> style="background-color: white;"</c:if>  ><td style="font-weight:bold" colspan="6" >编组ID:${cardgroup.feegroup}</td></tr>
			 			<tr <c:if test="${status.index%12!=0}">  style="background-color: white;"</c:if>    onclick="toAddDetail('${cardgroup.feegroup}')">
			 		</c:if>
						<td style="vertical-align: middle;">${cardgroup.roomcard}+${cardgroup.giftcard}<br/>&yen;${cardgroup.money/100}<br/>${cardgroup.payid}</td>
					<c:if test="${status.index%6==5}">
<!-- 						<td align="center">  -->
<%-- 					 		<button type="button" class="btn btn-info"   style="width:50px;padding:6px 0px"   onclick="window.location.href='toUpdateCardgroup?feegroupid=${cardgroup.feegroup}'">修 改</button> --%>
<!-- 						</td> -->
			 		 </tr>
			 		</c:if>
	    	 </c:forEach>
	    	 <c:if test="${cardgroupList == null ||fn:length(cardgroupList)==0}">
	    	 	<tr><td colspan="6" align="center">没有可以添加的计费编组！</td></tr>
			</c:if>
	</tbody>
</table>

</div>


<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10"  style="float:left;margin-left:10%">
			<button type="button" onclick = "back()" class="btn btn-info">返回</button>
		</div>
<!-- 		<div class="col-sm-offset-2 col-sm-10" style="float:right;margin-right:10%"> -->
<!-- 			<button type="button" onclick="doSubmit()" class="btn btn-warning" >保存</button> -->
<!-- 		</div> -->
	</div>
<%} %>

</div>




</body>
</html>