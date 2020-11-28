<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="com.taim.conduire.domain.HospitalData" %>
<%@ page language="java" import="com.taim.conduire.service.HospitalDataService" %>
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
		<form action="/shristationery/bloodnet/hospital-info-search" method="get">
    	<label>Find Hospital by:</label>
			<select name="flag" id="flag">
				<option value="all">All</option>
				<option value="name">Name</option>
			    <option value="emailid">Email ID</option>
				<option value="phno">Phone Number</option>
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
		List<HospitalData> listHospitalData = (List<HospitalData>)request.getAttribute("list"); 
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
											<th>Qty A</th>
											<th>Qty B</th>
											<th>Qty AB</th>
											<th>Qty O</th>
											<th>Signup Date</th>
											<th>Status</th>
											<th>Area</th>
											<th></th>
										</tr>
									</thead>
									<% for(HospitalData hospitalData:listHospitalData){ %>
						              <tbody>
						                  <tr>
						                      <td>
						                          <% out.print(hospitalData.getHospitalId()); %>
						                      </td>
						                      <td>
						                          <% out.print(hospitalData.getName()); %>
						                      </td>
						                      <td>
						                          <% out.print(hospitalData.getEmailId()); %>
						                      </td>
						                      <td>
						                          <% out.print(hospitalData.getPhoneNumber()); %>
						                      </td>
						                      <td>
						                          <% out.print(hospitalData.getQtyA()); %>
						                      </td>
						                      <td>
						                          <% out.print(hospitalData.getQtyB()); %>
						                      </td>
						                      <td>
						                          <% out.print(hospitalData.getQtyAb()); %>
						                      </td>
						                      <td>
						                          <% out.print(hospitalData.getQtyO()); %>
						                      </td>
						                      <td>
						                          <% out.print(hospitalData.getSignUpDate()); %>
						                      </td>
						                      <td>
						                          <% out.print(hospitalData.getStatus()); %>
						                      </td>
						                      <td>
						                          <% out.print(hospitalData.getArea()); %>
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
		</div>	<%@ include file = "scripts.jsp" %>
	</body>
</html>

		                      