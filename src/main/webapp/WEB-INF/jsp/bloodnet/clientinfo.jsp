<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="com.taim.conduire.domain.ClientData" %>
<%@ page language="java" import="com.taim.conduire.service.ClientDataService" %>
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
	
	<div class="content-wrapper">
	<form action="/shristationery/bloodnet/client-info-search" method="get">
    	<label>Find Client by:</label>
			<select name="flag" id="flag">
				<option value="all">All</option>
				<option value="firstName">First Name</option>
				<option value="lastName">Last Name</option>
			    <option value="emailid">Email ID</option>
				<option value="phno">Phone Number</option>
				<option value="bloodGroup">Blood Group</option>
				<option value="bloodDonationCount">Blood Donation Count</option>
				<option value="aadharNumber">Aadhar Number</option>
				<option value="status">Status</option>
				<option value="area">Area</option>
			</select>
			&nbsp;
			&nbsp;
			&nbsp;
			&nbsp;
			<label for="searchby">Write a keyword:</label>
			<input type="text" placeholder="Type Here" name="keyword">
			<input name="email" type="hidden" value="${email}">
          	<input type="submit" value="Search" id="submit">
      </form>
	
            
    <% 
		List<ClientData> listClientData = (List<ClientData>)request.getAttribute("list"); 
	%>
	<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-lg-12">
								<table class="table table-responsive" id="tbl-data">
									<thead>
										<tr>
											<th>ID</th>
											<th>Name</th>
											<th>Email ID</th>
											<th>Phone Number</th>
											<th>Blood Group</th>
											<th>Blood Donation Count</th>
											<th>Date Of Birth</th>
											<th>Signup Date</th>
											<th>Aadhar Number</th>
											<th>Status</th>
											<th>Area</th>
											<th></th>
										</tr>
									</thead>
									<% for(ClientData clientData:listClientData){ %>
						              <tbody>
						                  <tr>
						                      <td>
						                          <% out.print(clientData.getClientId()); %>
						                      </td>
						                      <td>
						                          <% out.print(clientData.getFirstName()); %> <% out.print(clientData.getLastName()); %>
						                      </td>
						                      <td>
						                          <% out.print(clientData.getEmailId()); %>
						                      </td>
						                      <td>
						                          <% out.print(clientData.getPhoneNumber()); %>
						                      </td>
						                      <td>
						                          <% out.print(clientData.getBloodGroup()); %>
						                      </td>
						                      <td>
						                          <% out.print(clientData.getBloodDonationCount()); %>
						                      </td>
						                      <td>
						                          <% out.print(clientData.getBirthDate()); %>
						                      </td>
						                      <td>
						                          <% out.print(clientData.getSignUpDate()); %>
						                      </td>
						                      <td>
						                          <% out.print(clientData.getAadharNumber()); %>
						                      </td>
						                      <td>
						                          <% out.print(clientData.getStatus()); %>
						                      </td>
						                      <td>
						                          <% out.print(clientData.getArea()); %>
						                      </td>
						                      <td class="project-actions text-right">
						                          <a class="btn btn-info btn-sm" href="#">
						                              Message
						                          </a>
						                      </td>
						                  </tr>
						                  
						              </tbody>
						              <%} %>
								</table>
							</div>
						</div>	
					</div>
				</div>		
			</div>
		</div>
	<%@ include file = "scripts.jsp" %>
</body>
</html>