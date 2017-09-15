<%@page import="com.dxz.model.S2sconfig"%>
<%@page import="java.util.List"%>
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
	location.href="getgameserverinfoList?pageNum=1";
}

function back(){
	location.href="getgameserverinfoList?pageNum=1";
}

function doSubmit(){
	
	var code = $(":text[name='code']").val();
	if(code==""){
		$("#errorTip").show();
		$("#errorText").text("服务器编码必须输入!");
		$('body').scrollTop(0);
		return;		
	}
	
	var gameserviceip = $(":text[name='gameserviceip']").val();
	if(gameserviceip==""){
		$("#errorTip").show();
		$("#errorText").text("游戏服ip地址必须输入!");
		$('body').scrollTop(0);
		return;		
	}
	
	
	var port = $(":text[name='port']").val();
	if(port==""){
		$("#errorTip").show();
		$("#errorText").text("游戏服端口必须输入!");
		$('body').scrollTop(0);
		return;		
	}
	
	
	var roomLimit = $(":text[name='roomLimit']").val();
	if(roomLimit==""){
		$("#errorTip").show();
		$("#errorText").text("最多房间数量必须输入!");
		$('body').scrollTop(0);
		return;		
	}
	
	
	
	var idHeader = $(":text[name='idHeader']").val();
	if(idHeader==""){
		$("#errorTip").show();
		$("#errorText").text("房间字头必须输入!");
		$('body').scrollTop(0);
		return;		
	}
	
	
	var vipRoomHeaderList = $(":text[name='vipRoomHeaderList']").val();
	if(vipRoomHeaderList==""){
		$("#errorTip").show();
		$("#errorText").text("VIP房间字头必须输入!");
		$('body').scrollTop(0);
		return;		
	}
	
	
	
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

</style>

</head>
<body>



<div style="padding: 10px 10px 10px;">
<div class="panel panel-default">
    <div class="panel-body">
    
    <div class="alert alert-danger" id="errorTip" style="display:none">
		<a href="#" class="alert-link" id="errorText" ></a>
	</div>
    
	<form class="form-horizontal" id="form1" method="post"  action="addGameserverinfo" role="form">
	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label text-info">服务器编码</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="code"  name = "code"  >
<%-- 			<label><%=vercontrol.getClientid()%></label> --%>
		</div>
	</div>
	
	
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label text-info">所属中心服务器</label>
		<div class="col-sm-10">
<!-- 			<input type="text" class="form-control" id="firstname"  name = "upVer"  > -->
			<select class="form-control" name="cscode"> 
				
		<!--		<option value="2">游戏服</option> -->
			
			<%List<S2sconfig> s2sconfigList = (List<S2sconfig> )  request.getAttribute("centerS2sconfigList"); %>
			<% int cnt = 0; %>
			<% for(S2sconfig s2sconfig : s2sconfigList){ %>
					<option value="<%=s2sconfig.getCode()%>"><%=s2sconfig.getCode()%></option>
			<% } %>
			</select>
		</div>
	</div>
	
	
	<div class="form-group" style="clear:both;">
		<label for="lastname" class="col-sm-2 control-label text-info">游戏ID</label>
		<div class="col-sm-10">
			<select class="form-control" name="gameid"> 
				<option value="10001" >斗牛</option>
				<option value="10002" >斗地主</option>
				<option value="10003" >中兴麻将</option>
			</select>
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
	
	
<!-- 	<div class="form-group"> -->
<!-- 		<label for="lastname" class="col-sm-2 control-label text-info">从属服务器</label> -->
<!-- 		<div class="col-sm-10"> -->
		
<!-- 			<select class="form-control" name="os"> -->
<!-- 				<option value="1">安卓</option>-->
<!-- 				<option value="2">苹果</option>-->
<!-- 			</select> -->
		
<!-- 		</div> -->
<!-- 	</div> -->
	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label text-info">游戏服ip地址</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname"  name = "gameserviceip"  >
<%-- 			<label><%=vercontrol.getClientid()%></label> --%>
		</div>
	</div>
	
	
	<div class="form-group" style="clear:both">
		<label for="lastname" class="col-sm-2 control-label text-info">访问端口</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname" name = "port" >
		</div>
	</div>
	
	
	<div class="form-group" style="clear:both">
		<label for="lastname" class="col-sm-2 control-label text-info">最多房间数量</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname" name = "roomLimit" >
		</div>
	</div>
	
	
	
	<div class="form-group" style="clear:both">
		<label for="lastname" class="col-sm-2 control-label text-info">房间字头</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname" name = "idHeader" >
		</div>
	</div>
	
	
	<div class="form-group" style="clear:both">
		<label for="lastname" class="col-sm-2 control-label text-info">VIP房间字头</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="lastname" name = "vipRoomHeaderList" >
		</div>
	</div>
	
	
	<div class="form-group" style="clear:both">
		<label for="lastname" class="col-sm-2 control-label text-info">房间类型</label>
		<div class="col-sm-10">
			<select class="form-control" name="groupid">
				<option value="1">私房</option>
				<option value="0">比赛房</option>
			</select>
		</div>
	</div>
	
	<div class="form-group" style="clear:both">
		<label for="lastname" class="col-sm-2 control-label text-info">服务器描述</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="sdesc" name = "sdesc" >
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10"  style="float:left;margin-left:10%">
			<button type="button" onclick = "back()" class="btn btn-info">返回</button>
		</div>
		<div class="col-sm-offset-2 col-sm-10" style="float:right;margin-right:10%">
			<button type="button"  onclick = "doSubmit()"  class="btn btn-warning" >保存</button>
		</div>
	</div>

	
</form>

</div>
</div>
</div>
</body>
</html>