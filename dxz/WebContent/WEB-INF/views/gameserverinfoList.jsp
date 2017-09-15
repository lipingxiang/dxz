<%@page import="com.dxz.model.v2gameserverinfo"%>
<%@page import="com.dxz.model.S2sconfig"%>
<%@page import="com.dxz.model.Misoperator"%>
<%@page import="com.dxz.model.Vercontrol"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML >
<html>
<head>
<title>游戏服务器</title>
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
<%int pageNum = (Integer)request.getAttribute("pageNum"); %>
<script type="text/javascript">

function delVercontrol(id){
	location.href="delVer?pageNum=<%=pageNum %>&id="+ id;
}

</script>
</head>
<body>
<div style="padding: 10px 10px 10px;">
<% if(!"55".equals(request.getAttribute("opLevel")) && (!"99".equals(request.getAttribute("opLevel")))){ %>
 <p class="text-info text-center">没有权限！</p>
<%}%>


<% if("55".equals(request.getAttribute("opLevel")) || ("99".equals(request.getAttribute("opLevel")))){ %>
<h2 class="text-info"><span class="glyphicon glyphicon-th-large"></span>  游戏服务器 <button type="button" class="btn btn-success"   style="float:right;margin-right:5px" onclick="window.location.href='toAddGameserverinfo'">添 加</button></h2>
<div class="panel panel-default">
    <div class="panel-body">
 <table class="table table-striped">
	<thead>
		<tr>
			<th>中心服</th>
			<th>游戏类型</th>
			<th>状态</th>
			<th align="right" style="vertical-align:middle;text-align:center;">操作</th>
		</tr>
<!-- 		<tr> -->
<!-- 			<th>上版本</th> -->
<!-- 			<th>下版本</th> -->
			
<!-- 		</tr> -->
	</thead>
	<tbody>
	<%List<v2gameserverinfo> gameserverinfoList = (List<v2gameserverinfo> )  request.getAttribute("gameserverinfList"); %>
	<% int cnt = 0; %>
	<% for(v2gameserverinfo gameserverinfo : gameserverinfoList){ %>
		<tr  <%if(cnt%2==0) {%>  style="background-color: #e0e0e0;" <%}else{%>  style="background-color: white" <%} %> >
			<td style="vertical-align: middle;"><%=gameserverinfo.getCscode() %></td>
			<td style="vertical-align: middle;" >
			
			  <%if(gameserverinfo.getGameid()==10001) {%>斗牛<%} %>
			  <%if(gameserverinfo.getGameid()==10002) {%>斗地主<%} %>
			  <%if(gameserverinfo.getGameid()==10003) {%>中兴麻将<%} %>
			
			</td>
			<td style="vertical-align: middle;" >
				<%if(gameserverinfo.getEnable()== 0) {%>  无效<%}%>
				<%if(gameserverinfo.getEnable()== 1) {%>  有效<%}%>
			</td>
			
			<td style="vertical-align:middle;text-align:center;" rowspan="2">
<%-- 			<a href="/TestDemo/verControllerDetail?id=<%=ver.getId()%>"> 修改</a> --%>
				<button type="button" class="btn btn-info"  onclick="window.location.href='toUpdateGameserverinfo?id=<%=gameserverinfo.getId()%>'" style="display:block;width:100%">修 改</button>
			
			</td>
			</tr>
			
			<tr <%if(cnt%2==0) {%>  style="background-color: #e0e0e0;" <%}else{%>  style="background-color: white" <%} %>>
				<td style="vertical-align: middle;font-size:12px;" colspan="3">
					<%=gameserverinfo.getWebsocketURL() %>
				</td>
			</tr>
<%-- 			<tr <%if(cnt%2==0) {%>  style="background-color: #e0e0e0;"<%}else{%>  style="background-color: white" <%} %> > --%>
<!-- 				<td style="vertical-align: middle;"></td> -->
<!-- 				<td style="vertical-align: middle;" ></td> -->
<!-- 			</tr> -->
		<% cnt++; %>
		<% } %>
	</tbody>
</table>
    <ul class="pager">
   			 <%if(1 == (Integer)request.getAttribute("pageNum")) {%>
				<li  class = "disabled" ><a href="javascript:void(0);"> 上一页</a></li>
			<%} %>
			
			 <%if(1 !=  (Integer)request.getAttribute("pageNum")) {%>
				<li   ><a href="getgameserverinfoList?pageNum=<%= (pageNum -1)%>"> 上一页</a></li>
			<%} %>
			
			
			 <%if(1 == (Integer)request.getAttribute("lastPage")) {%>
				<li  class = "disabled" ><a href="javascript:void(0);"> 下一页</a></li>
			<%} %>
			
			 <%if(1 !=  (Integer)request.getAttribute("lastPage")) {%>
				<li   ><a href="getgameserverinfoList?pageNum=<%= (pageNum +1)%>"> 下一页</a></li>
			<%} %>
		</ul>
    </div>
</div>
<%} %>

</div>




</body>
</html>