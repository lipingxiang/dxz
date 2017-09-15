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
	location.href="toAddCardGrouptoChannel?channelId=${channelid}&pageNum=1";
}



function doSubmit(){
	
// 	var upVer = $(":text[name='upVer']").val();
// 	if(upVer==""){
// 		$("#errorTip").show();
// 		$("#errorText").text("上行版本必须输入!");
// 		$('body').scrollTop(0);
// 		return;		
// 	}
	
	
// 	if(!/^\d{1,}([.]\d{1,})+$/.test(upVer)){
// 		$("#errorTip").show();
// 		$("#errorText").text("上行版本输入不正确！");
// 		$('body').scrollTop(0);
// 		return;		
// 	}
	
	
	
	
	
// 	var downVer = $(":text[name='downVer']").val();
// 	if(downVer==""){
// 		$("#errorTip").show();
// 		$("#errorText").text("下行版本必须输入!");
// 		$('body').scrollTop(0);
// 		return;		
// 	}
	
	
// 	if(!/^\d{1,}([.]\d{1,})+$/.test(downVer)){
// 		$("#errorTip").show();
// 		$("#errorText").text("下行版本输入不正确！");
// 		$('body').scrollTop(0);
// 		return;		
// 	}
	
	
// 	var clientid = $(":text[name='clientid']").val();
// 	if(clientid==""){
// 		$("#errorTip").show();
// 		$("#errorText").text("客户ID必须输入!");
// 		$('body').scrollTop(0);
// 		return;		
// 	}
	
	
// 	var updateURL = $(":text[name='updateURL']").val();
// 	if(updateURL==""){
// 		$("#errorTip").show();
// 		$("#errorText").text("更新地址必须输入!");
// 		$('body').scrollTop(0);
// 		return;		
// 	}
	
// 	if(!IsURL(updateURL)){
// 		$("#errorTip").show();
// 		$("#errorText").text("更新地址输入不正确!");
// 		$('body').scrollTop(0);
// 		return;		
// 	}
	
	
// 	var openURL = $(":text[name='openURL']").val();
// 	if(openURL.length!=0&&!IsURL(openURL)){
// 		$("#errorTip").show();
// 		$("#errorText").text("打开地址输入不正确!");
// 		$('body').scrollTop(0);
// 		return;		
// 	}
	
	
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

table tr th,table tr td{
padding:1px 6px ;
}
.label{
display:block;
width:50px !important;
text-align:left;
}
</style>

</head>
<body>



<div style="padding: 10px 10px 10px;">
<div class="panel panel-default">
    <div class="panel-body">
    
    <c:if test="${msg !=null}">
	    <div class="alert alert-danger" id="errorTip">
			<a href="#" class="alert-link" id="errorText" >${msg}</a>
		</div>
    </c:if>
    
	<form class="form-horizontal" id="form1" method="post"  action="addCardGrouptoChannel" role="form">
	<input type="hidden" name="channelid"  value="${channelid}"/>
	<input type="hidden" name="feegroupid"  value="${cardgroups[0].feegroup}"/>
<!-- 	<div class="form-group"> -->
<!-- 		<label for="firstname" class="col-sm-2 control-label text-info">客户ID</label> -->
<!-- 		<div class="col-sm-10"> -->
<%-- 			${cardgroups[0].clientid} --%>
<!-- 		</div> -->
<!-- 	</div> -->
	
	
<!-- 	<div class="form-group"> -->
<!-- 		<label for="firstname" class="col-sm-2 control-label text-info">CODE</label> -->
<!-- 		<div class="col-sm-10"> -->
<%-- 			${cardgroups[0].code} --%>
<!-- 		</div> -->
<!-- 	</div> -->
	
	<div class="form-group">
<!-- 	<label for="firstname" class="col-sm-2 control-label text-info">编组</label> -->
		<div class="col-sm-10" style="width:100%">
			
		
		
<!-- 			<input type="text"   class="form-control" id="lastname"  name = "sw"   > -->
<!-- 			<label for="firstname" class="text-info" style="display:inline" >房卡</label> <input type="text" style="display:inline !important;width:30px" class="form-control" id="firstname"  name = "code"  ><br/><br/> -->
<!-- 			<label for="firstname" class="control-label text-info" style="display:inline" >赠送</label> <input type="text"  style="display:inline !important;width:30px" class="form-control" id="firstname"  name = "code"  ><br/><br/> -->
<!-- 			<label for="firstname" class="control-label text-info" style="display:inline" >金额</label> <input type="text"  style="display:inline !important;width:30px" class="form-control" id="firstname"  name = "code"  > -->

				
				<table style="width:90%;" >
					<tr>
						<th style="width:5%"></th>
						<th style="width:20%"><label for="firstname" class="text-info" style="display:inline">房卡</label></th>
						<th style="width:20%"><label for="firstname" class="text-info" style="display:inline">赠送</label></th>
						<th style="width:20%"><label for="firstname" class="text-info" style="display:inline">金额(分)</label></th>
					</tr>
					
					<c:forEach items="${cardgroups}" var="cardgroup" varStatus="status" >
						<tr><td><label for="firstname" class="text-info" style="display:inline;">${status.index+1}</label></td>
							<td><span class="label label-info" style="width:100%;">${cardgroup.roomcard}</span></td>
							<td><span class="label label-success">${cardgroup.giftcard}</span></td>
							<td><span class="label label-warning">${cardgroup.money}</span></td>
						</tr>
					</c:forEach>
					
				</table>
		</div>
	</div>
	
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label text-info">备注</label>
		<div class="col-sm-10">
			
			
			<c:if test="${cardgroups[0].sdesc == null}">无</c:if>
			<c:if test="${cardgroups[0].sdesc != null}">${cardgroups[0].sdesc}</c:if>
		</div>
	</div>
	
	
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label text-info">客户ID</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="firstname"  name = "clientid"  >
		</div>
	</div>
	
	
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label text-info">CODE</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="firstname"  name = "code"  >
		</div>
	</div>
	
	
	

	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label text-info">是否有效</label>
		<div class="col-sm-10">
<%-- 			 <c:if test="${cardgroups[0].enable==1}">有效</c:if>  --%>
<%-- 			<c:if test="${cardgroups[0].enable==0}">无效</c:if>  --%>
			<select class="form-control" name="enable">
				<option value="1">有效</option>
				<option value="0">无效</option>
			</select>
		</div>
	</div>
	
	<div class="form-group">
		
		<label for="lastname" class="col-sm-2 control-label text-info">支持系统</label>
		<div class="col-sm-10">
			<select class="form-control" name="os">
				<c:if test="${paymentChannel.os%2==1}"><option value="1">安卓</option></c:if>
				<c:if test="${paymentChannel.os%4>=2}"><option value="2">苹果</option></c:if>
				<c:if test="${paymentChannel.os%8>=4}"><option value="4">Windows</option></c:if>
			</select>
		</div>
	</div>
	
	
	
	
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label text-info">权重</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="firstname"  name = "priority"  >
		</div>
	</div>
	
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label text-info">是否是审核版本</label>
		<div class="col-sm-10">
			<select class="form-control" name="audit">
				<option value="1">是</option>
				<option value="0">否</option>
			</select>
		</div>
	</div>

	
	<div class="form-group" >
		<div class="col-sm-offset-2 col-sm-10"  style="float:left;margin-left:10%">
			<button type="button" onclick = "back()" class="btn btn-info">返回</button>
		</div>
		<div class="col-sm-offset-2 col-sm-10" style="float:right;margin-right:10%">
			<button type="button" onclick = "doSubmit()"  class="btn btn-warning" >添加</button>
		</div>
	</div>
</form>

</div>
</div>
</div>
</body>
</html>