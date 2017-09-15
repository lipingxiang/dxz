<%@page import="com.dxz.model.Misoperator"%>
<%@page import="com.dxz.model.Vercontrol"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, height=device-height,initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>

<title>Login</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">  
<script src="jquery/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
function back(){
// 	$.get("/TestDemo/op?pageNum=1")
	location.href="getMisoperatorList?pageNum=1";
}
</script>


</head>
<body>



<div style="padding: 10px 10px 10px;">
<div class="panel panel-default" >
    <div class="panel-body">
	<form class="form-horizontal" method="post"  action="updateMisoperator" role="form">
	<%Misoperator misoperator = (Misoperator)  request.getAttribute("misoperator"); %>
	<input type = "hidden" name = "id" value = "<%=misoperator.getId()!= 0 ?misoperator.getId():"" %>"/>
	<div class="form-group" >
		<label for="firstname" class="col-sm-2 control-label text-info">姓名</label>
		<div class="col-sm-10">
<%-- 			<input type="text" class="form-control" id="firstname"  name = "upVer"  value =  "<%=vercontrol.getUpVer()!= null ?vercontrol.getUpVer():"" %>" > --%>
			<label><%=misoperator.getOpName()%></label>
		</div>
	</div>
	
	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label text-info">权限级别</label>
		<div class="col-sm-10">
<%-- 			<input type="text" class="form-control" id="lastname"  name = "clientid"  value =  "<%=vercontrol.getClientid() != null ?vercontrol.getClientid():""%>" > --%>
<%-- 			<label><%=misoperator.getOpLevel()%></label> --%>
			<input type="text" class="form-control" id="lastname"  name = "opLevel"  value =  "<%=misoperator.getOpLevel() != null ?misoperator.getOpLevel():""%>" >
		</div>
	</div>
	
	<div class="form-group" style="clear:both;">
		<label for="lastname" class="col-sm-2 control-label text-info">是否可用</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname"  name = "enable"  value =  "<%=misoperator.getEnable() != null ?misoperator.getEnable():""%>" >
		</div>
	</div>
	
	
	<div class="form-group">
		<label for="lastname"   class="col-sm-2 control-label text-info">cid</label>
		<div class="col-sm-10" >
			<input type="text"   class="form-control" id="lastname"  name = "cid"  value =  "<%=misoperator.getCid()!= null ?misoperator.getCid():""%>"  >
		</div>
	</div>
	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label text-info">区域</label>
		<div class="col-sm-10">
			<input type="text"   class="form-control" id="lastname"  name = "area"  value =  "<%=misoperator.getArea()!= null ?misoperator.getArea():"" %>"  >
		</div>
	</div>
	
	
	<div class="form-group" >
		<div class="col-sm-offset-2 col-sm-10"  style="float:left;margin-left:10%">
			<button type="button" onclick = "back()" class="btn btn-info">返回</button>
		</div>
		<div class="col-sm-offset-2 col-sm-10" style="float:right;margin-right:10%">
			<button type="submit" class="btn btn-warning" >保存</button>
		</div>
	</div>
</form>

</div>
</div>
</div>
</body>
</html>