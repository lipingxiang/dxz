<%@page import="com.dxz.model.Vercontrol"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	location.href="getCardgroupList?pageNum=1";
}



function doSubmit(){
	
	var clientid = $(":text[name='clientId']").val();
	if(clientid==""){
		$("#errorTip").show();
		$("#errorText").text("客户ID必须输入!");
		$('body').scrollTop(0);
		return;		
	}
	
	
	if(!/^[A-Za-z0-9]+$/.test(clientid)){
		$("#errorTip").show();
		$("#errorText").text("客户ID必须是英文或数字!");
		$('body').scrollTop(0);
		return;		
		
	}
	
	
	
	var code = $(":text[name='code']").val();
	if(code!=""&&!/^[A-Za-z0-9]+$/.test(code)){
		$("#errorTip").show();
		$("#errorText").text("CODE必须是英文或数字!");
		$('body').scrollTop(0);
		return;		
		
	}
	
	
	var  roomCards = $(":text[name$='roomCard']");
	var  giftCards = $(":text[name$='giftCard']");
	var  money = $(":text[name$='money']");
	
	for(var i = 0;i<roomCards.length;i++){
		if(roomCards[i].value==""){
			$("#errorTip").show();
			$("#errorText").text("房卡数必须输入!");
			$('body').scrollTop(0);
			return;		
		}
		
		if(!/^[0-9]+$/.test(roomCards[i].value)){
			$("#errorTip").show();
			$("#errorText").text("房卡数必须是数字!");
			$('body').scrollTop(0);
			return;		
		}
	}
	
	
	
	for(var i = 0;i<giftCards.length;i++){
		if(giftCards[i].value==""){
			$("#errorTip").show();
			$("#errorText").text("赠送房卡必须输入!");
			$('body').scrollTop(0);
			return;		
		}
		
		if(!/^[0-9]+$/.test(giftCards[i].value)){
			$("#errorTip").show();
			$("#errorText").text("赠送卡数必须是数字!");
			$('body').scrollTop(0);
			return;		
		}
	}
	
	
	for(var i = 0;i<money.length;i++){
		if(money[i].value==""){
			$("#errorTip").show();
			$("#errorText").text("金额必须输入!");
			$('body').scrollTop(0);
			return;		
		}
		
		if(!/^[0-9]+$/.test(money[i].value)){
			$("#errorTip").show();
			$("#errorText").text("金额必须是数字!");
			$('body').scrollTop(0);
			return;		
		}
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

table tr th,table tr td{
padding:1px 6px ;
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
    
	<form class="form-horizontal" id="form1" method="post"  action="addCardgroup" role="form">
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label text-info">客户ID</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="firstname"  name = "clientId"  >
		</div>
	</div>
	
	
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label text-info">CODE</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="firstname"  name = "code"  >
		</div>
	</div>
	
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
					<tr><td><label for="firstname" class="text-info" style="display:inline">1</label></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[0].roomCard"  ></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[0].giftCard"  ></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[0].money"  ></td>
					</tr>
					
					<tr><td><label for="firstname" class="text-info" style="display:inline">2</label></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[1].roomCard"  ></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[1].giftCard"  ></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[1].money"  ></td>
					</tr>
					
					
					<tr><td><label for="firstname" class="text-info" style="display:inline">3</label></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[2].roomCard"  ></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[2].giftCard"  ></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[2].money"  ></td>
					</tr>
					
					<tr><td><label for="firstname" class="text-info" style="display:inline">4</label></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[3].roomCard"  ></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[3].giftCard"  ></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[3].money"  ></td>
					</tr>
					<tr><td><label for="firstname" class="text-info" style="display:inline">5</label></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[4].roomCard"  ></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[4].giftCard"  ></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[4].money"  ></td>
					</tr>
					
					<tr><td><label for="firstname" class="text-info" style="display:inline">6</label></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[5].roomCard"  ></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[5].giftCard"  ></td>
						<td><input type="text" style="display:inline !important;" class="form-control" id="firstname"  name = "cardgroups[5].money"  ></td>
					</tr>
				</table>
		</div>
	</div>
	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label text-info">是否有效</label>
		<div class="col-sm-10">
			<select class="form-control" name="enable">
				<option value="1">有效</option>
				<option value="0">无效</option>
			</select>
		</div>
	</div>
	
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label text-info">备注</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="firstname"  name = "sdesc"  >
		</div>
	</div>

	
	<div class="form-group" >
		<div class="col-sm-offset-2 col-sm-10"  style="float:left;margin-left:10%">
			<button type="button" onclick = "back()" class="btn btn-info">返回</button>
		</div>
		<div class="col-sm-offset-2 col-sm-10" style="float:right;margin-right:10%">
			<button type="button" onclick = "doSubmit()"  class="btn btn-warning" >保存</button>
		</div>
	</div>
</form>

</div>
</div>
</div>
</body>
</html>