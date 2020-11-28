<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.List" %>
<%@ page language="java" import="com.taim.conduire.domain.HospitalData" %>
<%@ page language="java" import="com.taim.conduire.service.HospitalDataService" %>
<%@ page language="java" import="com.taim.conduire.domain.ClientData" %>
<%@ page language="java" import="com.taim.conduire.service.ClientDataService" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "cssfiles.jsp" %>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<%@ include file = "fixedbodycontent.jsp" %>
	
	<div class="card card-info">
		<div style="padding-left:300px">
			<h1>Following is the list of hospitals near you</h1>
		</div>
	</div>
	<% 
		List<HospitalData> listHospitalData = (List<HospitalData>)request.getAttribute("listHospitalData"); 
		for(HospitalData hospitalData:listHospitalData){
	%>
			<div class="card card-info">
				<div style="padding-left:300px">
					<%out.print(hospitalData.getName()); %>
				</div>
				<div style="padding-left:300px">
					<%out.print(hospitalData.getEmailId()); %>
				</div>
				<div style="padding-left:300px">
					<%out.print(hospitalData.getPhoneNumber()); %>
				</div>
			</div>
				
         <% } %>
         
    <div class="card card-info">
		<div style="padding-left:300px">
			<h1>Following is the list of donors near you</h1>
		</div>
	</div>
	<% 
		List<ClientData> listClientData3 = (List<ClientData>)request.getAttribute("listClientData3"); 
		for(ClientData clientData:listClientData3){
	%>
			<div class="card card-info">
				<div style="padding-left:300px">
					<%out.print(clientData.getFirstName()); %>
					<%out.print(clientData.getLastName()); %>
				</div>
				<div style="padding-left:300px">
					<%out.print(clientData.getEmailId()); %>
				</div>
				<div style="padding-left:300px">
					<%out.print(clientData.getPhoneNumber()); %>
				</div>
			</div>
				
         <% } %>
	
	
	
	<%@ include file = "scripts.jsp" %>
	</body>
</html>