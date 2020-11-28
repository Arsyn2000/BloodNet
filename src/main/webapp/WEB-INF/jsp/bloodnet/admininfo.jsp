<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="com.taim.conduire.domain.AdminData" %>
<%@ page language="java" import="com.taim.conduire.service.AdminDataService" %>
<%@ page language="java" import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "cssfiles.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<%@ include file = "adminfixedbodycontent.jsp" %>
		<div class="card card-info">
			<div style="padding-left:300px">
				<h1>The Admin</h1>
			</div>
		</div>
			<% 
				List<AdminData> listAdminData = (List<AdminData>)request.getAttribute("list"); 
				for(AdminData adminData:listAdminData){
			%>
					<div class="card card-info">
						<div style="padding-left:300px">
							<%out.print(adminData.getFirstName()); %>
							<%out.print(adminData.getLastName()); %>
						</div>
						<div style="padding-left:300px">
							<%out.print(adminData.getEmailId()); %>
						</div>
						<div style="padding-left:300px">
							<%out.print(adminData.getPhoneNumber()); %>
						</div>
					</div>
				
         <% } %>
		
	<%@ include file = "scripts.jsp" %>
</body>
</html>