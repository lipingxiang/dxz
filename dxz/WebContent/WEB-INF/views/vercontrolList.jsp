<%@page import="com.dxz.model.Misoperator"%>
<%@page import="com.dxz.model.Vercontrol"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML >
<html>
<head>
<title>版本管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, height=device-height,initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">  
<style type="text/css">
body{
font-size:16px;
}
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
<h2 class="text-info"><span class="glyphicon glyphicon-th-large"></span>  版本管理  <button type="button" class="btn btn-success"   style="float:right;margin-right:5px" onclick="window.location.href='toAddVercontrol'">添 加</button></h2>
<div class="panel panel-default">
    <div class="panel-body">
 <table class="table table-striped">
	<thead>
		<tr>
			<th>系统</th>
			<th>客户ID</th>
			<th align="right" style="vertical-align:middle;text-align:center;" rowspan="2">操作</th>
		</tr>
		<tr>
			<th>上版本</th>
			<th>下版本</th>
			
		</tr>
	</thead>
	<tbody>
	<%List<Vercontrol> vercontrollist = (List<Vercontrol> )  request.getAttribute("vercontrollist"); %>
	<% int cnt = 0; %>
	<% for(Vercontrol ver : vercontrollist){ %>
		<tr  <%if(cnt%2==0) {%>  style="background-color: #e0e0e0;" <%}else{%>  style="background-color: white" <%} %> >
			<td style="vertical-align: middle;"><%="1".equals(ver.getOs())?"安卓":("2".equals(ver.getOs())?"苹果":"其他") %></td>
<%-- 			<td style="vertical-align: middle;" ><%=ver.getUpVer() %></td> --%>
			<td style="vertical-align: middle;" ><%=ver.getClientid()%></td>
			<td style="vertical-align:middle;text-align:center;" rowspan="2">
<%-- 			<a href="/TestDemo/verControllerDetail?id=<%=ver.getId()%>"> 修改</a> --%>
			<button type="button" class="btn btn-info"  onclick="window.location.href='toUpdateVercontrol?id=<%=ver.getId()%>'" style="display:block;width:100%">修 改</button>
			
			
<!-- 			<button type="button" style="margin-top:15px;display:block;width:100%" class="btn btn-warning">删 除</button> -->
			
<%-- 			<a data-toggle="modal" data-target="#vercontrol<%=ver.getId() %>" href="javascript:void(0);">删除</a> --%>
			
<%-- 			<div class="modal fade" id="vercontrol<%=ver.getId() %>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> --%>
<!-- 					<div class="modal-dialog"> -->
<!-- 						<div class="modal-content"> -->
<!-- 							<div class="modal-header"> -->
<!-- 								<button type="button" class="close" data-dismiss="modal" aria-hidden="true"> -->
<!-- 									&times; -->
<!-- 								</button> -->
<!-- 								<h4 class="modal-title" id="myModalLabel"> -->
<!-- 									删除 -->
<!-- 								</h4> -->
<!-- 							</div> -->
<!-- 							<div class="modal-body"> -->
<!-- 								您确定要删除该记录吗？ -->
<!-- 							</div> -->
<!-- 							<div class="modal-footer"> -->
<!-- 								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> -->
<%-- 								<button type="button" class="btn btn-primary" onclick="delVercontrol(<%=ver.getId() %>)">删除</button> --%>
<!-- 							</div> -->
<!-- 						</div>/.modal-content -->
<!-- 					</div>/.modal -->
<!-- 				</div> -->
			</td>
			
			<tr <%if(cnt%2==0) {%>  style="background-color: #e0e0e0;"<%}else{%>  style="background-color: white" <%} %> >
				<td style="vertical-align: middle;"><%=ver.getUpVer() %></td>
				<td style="vertical-align: middle;" ><%=ver.getDownVer() %></td>
			</tr>
		<% cnt++; %>
		<% } %>
	</tbody>
</table>
    <ul class="pager">
   			 <%if(1 == (Integer)request.getAttribute("pageNum")) {%>
				<li  class = "disabled" ><a href="javascript:void(0);"> 上一页</a></li>
			<%} %>
			
			 <%if(1 !=  (Integer)request.getAttribute("pageNum")) {%>
				<li   ><a href="getvercontrolList?pageNum=<%= (pageNum -1)%>"> 上一页</a></li>
			<%} %>
			
			
			 <%if(1 == (Integer)request.getAttribute("lastPage")) {%>
				<li  class = "disabled" ><a href="javascript:void(0);"> 下一页</a></li>
			<%} %>
			
			 <%if(1 !=  (Integer)request.getAttribute("lastPage")) {%>
				<li   ><a href="getvercontrolList?pageNum=<%= (pageNum +1)%>"> 下一页</a></li>
			<%} %>
		</ul>
    </div>
</div>
<%} %>

</div>




</body>
</html>