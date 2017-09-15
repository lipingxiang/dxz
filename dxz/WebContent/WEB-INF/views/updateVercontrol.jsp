<%@page import="com.dxz.model.Vercontrol"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, height=device-height,initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>

<title>修改</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">  
<script src="jquery/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<style type="text/css">
body{
font-size:16px;
}
</style>

<script type="text/javascript">


function back(){
	location.href="getvercontrolList?pageNum=1";
}


function doSubmit(){
	var downVer = $(":text[name='downVer']").val();
	if(downVer==""){
		$("#errorTip").show();
		$("#errorText").text("下行版本必须输入!");
		return;		
	}
	
	
	if(!/^\d{1,}([.]\d{1,})+$/.test(downVer)){
		$("#errorTip").show();
		$("#errorText").text("下行版本输入不正确！");
		return;		
	}
	
	
	var updateURL = $(":text[name='updateURL']").val();
	if(updateURL==""){
		$("#errorTip").show();
		$("#errorText").text("更新地址必须输入!");
		return;		
	}
	
	if(!IsURL(updateURL)){
		$("#errorTip").show();
		$("#errorText").text("更新地址输入不正确!");
		return;		
	}
	
	
	var openURL = $(":text[name='openURL']").val();
	if(!IsURL(openURL)){
		$("#errorTip").show();
		$("#errorText").text("打开地址输入不正确!");
		return;		
	}
	
	
    $("#form1").submit();
	
}

function IsURL (str_url) { 
	var strRegex = '^((https|http|ftp|rtsp|mms)?://)'
	+ '?(([0-9a-z_!~*\'().&=+$%-]+: )?[0-9a-z_!~*\'().&=+$%-]+@)?' //ftp的user@ 
	+ '(([0-9]{1,3}.){3}[0-9]{1,3}' // IP形式的URL- 199.194.52.184 
	+ '|' // 允许IP和DOMAIN（域名） 
	+ '([0-9a-z_!~*\'()-]+.)*' // 域名- www. 
	+ '([0-9a-z][0-9a-z-]{0,61})?[0-9a-z].' // 二级域名 
	+ '[a-z]{2,6})' // first level domain- .com or .museum 
	+ '(:[0-9]{1,4})?' // 端口- :80 
	+ '((/?)|' // a slash isn't required if there is no file name 
	+ '(/[0-9a-z_!~*\'().;?:@&=+$,%#-]+)+/?)$'; 
	var re=new RegExp(strRegex); 
	//re.test() 
	if (re.test(str_url)) { 
		return (true); 
	} else { 
		return (false); 
	} 
}


</script>


</head>
<body>



<div style="padding: 10px 10px 10px;">
<div class="panel panel-default">
    <div class="panel-body">
    <div class="alert alert-danger" id="errorTip" style="display:none">
		<a href="#" class="alert-link" id="errorText" ></a>
	</div>
    
	<form id="form1" class="form-horizontal" method="post"  action="updateVercontrol" role="form">
	<%Vercontrol vercontrol = (Vercontrol)  request.getAttribute("vercontrol"); %>
	<input type = "hidden" name = "id" value = "<%=vercontrol.getId()!= 0 ?vercontrol.getId():"" %>"/>
	<div class="form-group" style="float:left;display:inline;width:30%;">
		<label for="firstname" class="col-sm-2 control-label text-info">上行版本</label>
		<div class="col-sm-10">
<%-- 			<input type="text" class="form-control" id="firstname"  name = "upVer"  value =  "<%=vercontrol.getUpVer()!= null ?vercontrol.getUpVer():"" %>" > --%>
			<label><%=vercontrol.getUpVer()%></label>
		</div>
	</div>
	<div class="form-group" style="float:left;display:inline;width:30%;margin-left:5%">
		<label for="lastname" class="col-sm-2 control-label text-info">系统</label>
		<div class="col-sm-10">
		
		<%if("1".equals(vercontrol.getOs())){%>  
			<label>安卓</label>
			
		<%} %>
		
		<%if("2".equals(vercontrol.getOs())){%>
		
			<label>苹果</label>
		
		 <%} %> 	
		
<%-- 			<input type="text" class="form-control" id="lastname"  name = "os"  value =  "<%=vercontrol.getOs()!= null ?vercontrol.getOs():"" %>"  > --%>
		</div>
	</div>
	
	<div class="form-group"style="float:left;display:inline;width:30%;margin-left:5%">
		<label for="lastname" class="col-sm-2 control-label text-info">客户ID</label>
		<div class="col-sm-10">
<%-- 			<input type="text" class="form-control" id="lastname"  name = "clientid"  value =  "<%=vercontrol.getClientid() != null ?vercontrol.getClientid():""%>" > --%>
			<label><%=vercontrol.getClientid()%></label>
		</div>
	</div>
	
	<div class="form-group" style="clear:both;">
		<label for="lastname" class="col-sm-2 control-label text-info">下行版本</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname"  name = "downVer"  value =  "<%=vercontrol.getDownVer() != null ?vercontrol.getDownVer():""%>" >
		</div>
	</div>
	
	
	
	
	<div class="form-group"  style="float:left;width:40%;">
		<label for="lastname"   class="col-sm-2 control-label text-info">开关1</label>
		<div class="col-sm-10" > 
			<select class="form-control" name="sw">
					<option value="1" <%if("1".equals(vercontrol.getSw())){%> selected="selected"<%}%>  >开</option>
					<option value="0"  <%if("0".equals(vercontrol.getSw())){%> selected="selected"<%}%> >关</option>
			</select>
		</div>
		
		
	</div>
	
	<div class="form-group" style="float:left;width:40%;margin-left:5%;">
		<label for="lastname" class="col-sm-2 control-label text-info">开关2</label>
		
		<div class="col-sm-10">
			<select class="form-control" name="sw2">
					<option value="1"  <%if("1".equals(vercontrol.getSw2())){%> selected="selected"<%}%>  >开</option>
					<option value="0"  <%if("0".equals(vercontrol.getSw2())){%> selected="selected"<%}%> >关</option>
			</select>
		</div>
	</div>
	
	<div class="form-group" style="clear:both">
		<label for="lastname" class="col-sm-2 control-label text-info">更新地址</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname" name = "updateURL"  value =  "<%=vercontrol.getUpdateURL() != null ?vercontrol.getUpdateURL():""%>" >
		</div>
	</div>
	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label text-info">打开地址</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname"  name = "openURL"  value =  "<%=vercontrol.getOpenURL() != null ?vercontrol.getOpenURL():""%>"  >
		</div>
	</div>
	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label text-info">保留</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname" name = "Reserve"  value =  "<%=vercontrol.getReserve()!= null ?vercontrol.getReserve():"" %>" >
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10"  style="float:left;margin-left:10%">
			<button type="button" onclick = "back()" class="btn btn-info">返回</button>
		</div>
		<div class="col-sm-offset-2 col-sm-10" style="float:right;margin-right:10%">
			<button type="button"   onclick = "doSubmit()"  class="btn btn-warning" >保存</button>
		</div>
	</div>
</form>

</div>
</div>
</div>
</body>
</html>