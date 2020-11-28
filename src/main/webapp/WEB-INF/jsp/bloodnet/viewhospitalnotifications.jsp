<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="com.taim.conduire.domain.HospitalNotificationData" %>
<%@ page language="java" import="com.taim.conduire.service.HospitalNotificationDataService" %>
<%@ page language="java" import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "cssfiles.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<%@ include file = "hospitalfixedbodycontent.jsp" %>
	<% List<HospitalNotificationData> listHospitalNotificationData = (List<HospitalNotificationData>)request.getAttribute("listHospitalNotificationData");  %>
	
	<div class="content-wrapper">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Notifications</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="card card-primary card-outline">
            <div class="card-header">
            </div>
            <div class="card-body p-0">
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover">
                  <tbody>
                  <%for(HospitalNotificationData hospitalNotificationData:listHospitalNotificationData){
                	  if(hospitalNotificationData.getStatus()==1){
                  %>
                  		<%   
                  			Integer i = hospitalNotificationData.getHnotificationId();
                  			String notId = Integer.toString(i);
                  		%>
                	  	<tr bgcolor="#BCC6CC"  onclick="openInNextPage('<%=notId%>')">
		                    <td>&rarr;</td>
		                    <td class="mailbox-name"><a href="read-mail.html"><% out.print(hospitalNotificationData.getSender());%></a></td>
		                    <td class="mailbox-subject"><%out.print(hospitalNotificationData.getData()); %></td>
		                    <td class="mailbox-date"><%out.print(hospitalNotificationData.getCreationTime()); %></td>
		                    <td class="mailbox-date"><%out.print(hospitalNotificationData.getCreationDate()); %></td>
		                </tr>
                	  <% }else{ 
                	  %>
                		  <tr>
		                    <td>&rarr;</td>
		                    <td class="mailbox-name"><a href="read-mail.html"><% out.print(hospitalNotificationData.getSender());%></a></td>
		                    <td class="mailbox-subject"><%out.print(hospitalNotificationData.getData()); %></td>
		                    <td class="mailbox-date"><%out.print(hospitalNotificationData.getCreationTime()); %></td>
		                    <td class="mailbox-date"><%out.print(hospitalNotificationData.getCreationDate()); %></td>
		                </tr>
                	  <%}
                  }
                       %>
                  
                  
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
	
	<%@ include file = "scripts.jsp" %>
	<script>
	function openInNextPage(notId) {
		
		window.open("/shristationery/hospital-notification/view-particular-notification?email=${email}&not_id="+notId);
		}
	</script>
</body>
</html>