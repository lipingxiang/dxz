<%@page import="com.dxz.model.Vercontrol"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, height=device-height,initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>

<title>添加支付渠道商</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">  
<script src="jquery/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
function back(){
	location.href="getPaymentchannelList?pageNum=1";
}

function doSubmit(){
	
	var chname = $(":text[name='chname']").val();
	if(chname==""){
		$("#errorTip").show();
		$("#errorText").text("渠道商名称必须输入!");
		$('body').scrollTop(0);
		return;		
	}
	
	

	var supportOs = $(":checkbox[name='supportOs']");
	var noCheckFlag = true;
	
	for(var i = 0;i<supportOs.length;i++){
		if(supportOs[i].checked){
			noCheckFlag = false;	
		}
	}

	if(noCheckFlag){
		$("#errorTip").show();
		$("#errorText").text("支持操作系统必须选中一个!");
		$('body').scrollTop(0);
		return;		
	}
	
	var feeurl = $(":text[name='feeurl']").val();
	if(feeurl==""){
		$("#errorTip").show();
		$("#errorText").text("支付地址必须输入!");
		$('body').scrollTop(0);
		return;		
	}
	if(!IsURL(feeurl)){
		$("#errorTip").show();
		$("#errorText").text("支付地址输入不正确!");
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
.inputlabel{
font-size:14px;
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
    
	<form class="form-horizontal" id="form1" method="post"  action="addPaymentchannel" role="form">
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label text-info">渠道商名称</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname"  name = "chname"  >
		</div>
	</div>
	
	
	<div class="form-group" style="clear:both;">
		<label for="lastname" class="col-sm-2 control-label text-info">支持系统</label>
		<div class="col-sm-10">
		
			<label class = "inputlabel text-info">
				<input type="checkbox" name="supportOs" value="1" /> 安卓
			</label>
			
			<label class = "inputlabel text-info">
				<input type="checkbox"  name="supportOs" value="2"/> 苹果
			</label>
			
			<label class = "inputlabel text-info">
				<input type="checkbox"  name="supportOs" value="4"/> Windows
			</label>
		</div>
		
	</div>
	
	<div class="form-group" style="clear:both;">
		<label for="lastname" class="col-sm-2 control-label text-info">是否有效</label>
		<div class="col-sm-10">
			<select class="form-control" name="enable">
				<option value="1">有效</option>
				<option value="0">无效</option>
			</select>
		</div>
	</div>
	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label text-info">支付地址</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname"  name = "feeurl"  >
		</div>
	</div>
	
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10"  style="float:left;margin-left:10%">
			<button type="button" onclick = "back()" class="btn btn-info">返回</button>
		</div>
		<div class="col-sm-offset-2 col-sm-10" style="float:right;margin-right:10%">
			<button type="button" onclick="doSubmit()" class="btn btn-warning" >保存</button>
		</div>
	</div>

	
</form>

</div>
</div>
</div>
</body>
</html>