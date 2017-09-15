<%@page import="com.dxz.model.S2sconfig"%>
<%@page import="com.dxz.model.Vercontrol"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, height=device-height,initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>

<title>添加</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">  
<script src="jquery/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
function back(){
	location.href="listAllChannelAndCardgroup?pageNum=${pageNum}";
}

function doSubmit(){
	
	var priority = $(":text[name='priority']").val();
	if(priority==""){
		$("#errorTip").show();
		$("#errorText").text("权重必须输入!");
		$('body').scrollTop(0);
		return;		
	}
	
	if(!/^[0-9]+$/.test(priority)){
		$("#errorTip").show();
		$("#errorText").text("权重必须是数字!");
		$('body').scrollTop(0);
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
<style type="text/css">
body{
font-size:16px;
}

</style>

</head>
<body>



<div style="padding: 10px 10px 10px;">
<div class="panel panel-default">
    <div class="panel-body">
    <div class="alert alert-danger" id="errorTip" style="display:none">
		<a href="#" class="alert-link" id="errorText" ></a>
	</div>
    
	<form class="form-horizontal" id="form1" method="post"  action="updateChannelCardgroup" role="form">
	
	<input type="hidden" name="channelid" value="${channelCardGroupData.channelid}"/>
	<input type="hidden" name="feegroupid" value="${channelCardGroupData.feegroupid}"/>
	<input type="hidden" name="os" value="${channelCardGroupData.os}"/>
	<input type="hidden" name="clientid" value="${channelCardGroupData.clientid}"/>
	<input type="hidden" name="pageNum" value="${pageNum}"/>
	
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label text-info">支付渠道商名称</label>
		<div class="col-sm-0">
			<label for="firstname" class="col-sm-2 control-label">${channelCardGroupData.chname}</label>
		</div>
	</div>
	
	<div class="form-group" style="clear:both;">
		<label for="lastname" class="col-sm-2 control-label text-info">客服ID</label>
		<div class="col-sm-0">
			<label for="firstname" class="col-sm-2 control-label">${channelCardGroupData.clientid}</label>
		</div>
	</div>
	
	<div class="form-group" style="clear:both;">
		<label for="lastname" class="col-sm-2 control-label text-info">系统</label>
		<div class="col-sm-0">
			
<%-- 		<c:if test="${channelCardGroupData.os==1}"> --%>
<!-- 			<label for="firstname" class="col-sm-2 control-label">安卓</label> -->
<%-- 		</c:if> --%>
		
<%-- 		<c:if test="${channelCardGroupData.os==2}"> --%>
<!-- 			<label for="firstname" class="col-sm-2 control-label">苹果</label> -->
<%-- 		</c:if> --%>
		
		
		<c:if test="${channelCardGroupData.os%2==1}"><label for="lastname" class="col-sm-2 control-label">安卓</label></c:if>
		<c:if test="${channelCardGroupData.os%4>=2}"><label for="lastname" class="col-sm-2 control-label">苹果</label></c:if>
		<c:if test="${channelCardGroupData.os%8>=4}"><label for="lastname" class="col-sm-2 control-label">Windows</label></c:if>
		
		</div>
	</div>
	
	<div class="form-group" style="clear:both">
		<label for="lastname" class="col-sm-2 control-label text-info">是否是审核版本</label>
		<div class="col-sm-0">
			
			<c:if test="${channelCardGroupData.audit==1}">
				<label for="firstname" class="col-sm-2 control-label">是</label>
			</c:if>
			<c:if test="${channelCardGroupData.audit==0}">
				<label for="firstname" class="col-sm-2 control-label">否</label>
			</c:if>
			
		</div>
	</div>
	
	<div class="form-group" style="clear:both;">
		<label for="lastname" class="col-sm-2 control-label text-info">是否有效</label>
		<div class="col-sm-10">
			<select class="form-control" name="enable">
				<option value="1" <c:if test="${channelCardGroupData.enable==1}">  selected="selected" </c:if>>有效</option>
				<option value="0" <c:if test="${channelCardGroupData.enable==0}">  selected="selected" </c:if> >无效</option>
			</select>
		</div>
	</div>
	
	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label text-info">权重</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname"  name = "priority"  value="${channelCardGroupData.priority}"  >
		</div>
	</div>
	
	
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10"  style="float:left;margin-left:10%">
			<button type="button" onclick = "back()" class="btn btn-info">返回</button>
		</div>
		<div class="col-sm-offset-2 col-sm-10" style="float:right;margin-right:10%">
			<button type="button"  onclick = "doSubmit()"   class="btn btn-warning" >保存</button>
		</div>
	</div>

	
</form>

</div>
</div>
</div>
</body>
</html>