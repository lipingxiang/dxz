<%@page import="com.dxz.model.S2sconfig"%>
<%@page import="com.dxz.model.Misoperator"%>
<%@page import="com.dxz.model.Vercontrol"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h2 class="text-info"><span class="glyphicon glyphicon-th-large"></span>  服务器管理 <button type="button" class="btn btn-success"   style="float:right;margin-right:5px" onclick="window.location.href='toAddS2sconfig'">添 加</button></h2>
<div class="panel panel-default">
    <div class="panel-body">
 <table class="table table-striped">
	<thead>
		<tr>
			<th>编号</th>
			<th>类型</th>
			<th>状态</th>
			<th align="right" style="vertical-align:middle;text-align:center;">操作</th>
		</tr>
<!-- 		<tr> -->
<!-- 			<th>上版本</th> -->
<!-- 			<th>下版本</th> -->
			
<!-- 		</tr> -->
	</thead>
	<tbody>
	<%List<S2sconfig> s2sconfigList = (List<S2sconfig> )  request.getAttribute("s2sconfigdataList"); %>
	<% int cnt = 0; %>
	<% for(S2sconfig s2sconfig : s2sconfigList){ %>
		<tr  <%if(cnt%2==0) {%>  style="background-color: #e0e0e0;" <%}else{%>  style="background-color: white" <%} %> >
			<td style="vertical-align: middle;">
			<%=s2sconfig.getCode() %>
			</td>
			<td style="vertical-align: middle;" >
			
			<%if(s2sconfig.getServerType()== 0) {%>  中心服<%}%>
			<%if(s2sconfig.getServerType()== 1) {%>  游戏服<%}%>
			</td>
			
			<td style="vertical-align: middle;" >
				<%if(s2sconfig.getEnable()== 0) {%>  无效<%}%>
				<%if(s2sconfig.getEnable()== 1) {%>  有效<%}%>
			
			</td>
			
			<td style="vertical-align:middle;text-align:center;" rowspan="2">
<%-- 			<a href="/TestDemo/verControllerDetail?id=<%=ver.getId()%>"> 修改</a> --%>
				<button type="button" class="btn btn-info"  onclick="window.location.href='toUpdateS2sconfig?id=<%=s2sconfig.getId()%>'" style="display:block;width:100%">修 改</button>
			
			</td>
			</tr>
			
			<tr <%if(cnt%2==0) {%>  style="background-color: #e0e0e0;" <%}else{%>  style="background-color: white" <%} %>>
				<td style="vertical-align: middle;font-size:12px;" colspan="3">
					<%=s2sconfig.getWebsocketURL() %>
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
				<li   ><a href="gets2sconfigList?pageNum=<%= (pageNum -1)%>"> 上一页</a></li>
			<%} %>
			
			
			 <%if(1 == (Integer)request.getAttribute("lastPage")) {%>
				<li  class = "disabled" ><a href="javascript:void(0);"> 下一页</a></li>
			<%} %>
			
			 <%if(1 !=  (Integer)request.getAttribute("lastPage")) {%>
				<li   ><a href="gets2sconfigList?pageNum=<%= (pageNum +1)%>"> 下一页</a></li>
			<%} %>
		</ul>
    </div>
</div>
<%} %>

</div>




</body>
</html>