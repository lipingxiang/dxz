<%@page import="com.dxz.model.S2sconfig"%>
<%@page import="com.dxz.model.Misoperator"%>
<%@page import="com.dxz.model.Vercontrol"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML >
<html>
<head>
<title>权限管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, height=device-height,initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">  
<style type="text/css">
.table>thead>tr>td, .table>thead>tr>th{
    vertical-align: middle !important;

}
</style>

<script src="jquery/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

function back(){
	location.href="${fromURL}";
}

</script>
</head>
<body>
<div style="padding: 10px 10px 10px;">


<h2 class="text-info"><span class="glyphicon glyphicon-th-large"></span>  ${paymentChannel.chname}</h2>
<div class="panel panel-default">
  <div class="panel-body">
 <table class="table table-striped">
	<thead>
		<tr>
			<th></th>
			<th>房卡</th>
			<th>赠送卡</th>
			<th>金额（分）</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="cardgroup"   items="${cardgroups}"  varStatus="status">
		<tr >
			<td style="vertical-align: middle;">
			 ${status.index+1}
			</td>
			<td style="vertical-align: middle;" >
				 ${cardgroup.roomcard}
			</td>
			
			<td style="vertical-align: middle;" >
				${cardgroup.giftcard}
			</td>
			
			<td style="vertical-align:middle;text-align:center;">
				&yen;${cardgroup.money/100}
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>



</div>

   <div class="form-group" align="center">
			<button type="button" onclick = "back()" class="btn btn-default">返回</button>
	</div>

</div>




</body>
</html>