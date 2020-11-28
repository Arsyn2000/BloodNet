<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="com.taim.conduire.domain.ClientNotificationData" %>
<%@ page language="java" import="com.taim.conduire.service.ClientNotificationDataService" %>
<%@ page language="java" import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "cssfiles.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<%@ include file = "fixedbodycontent.jsp" %>
	<% List<ClientNotificationData> listClientNotificationData = (List<ClientNotificationData>)request.getAttribute("listClientNotificationData");  %>
	
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
                  <%for(ClientNotificationData clientNotificationData:listClientNotificationData){
                	  if(clientNotificationData.getStatus()==1){
                  %>
                  		<%   
                  			Integer i = clientNotificationData.getCnotificationId();
                  			String notId = Integer.toString(i);
                  		%>
                	  	<tr bgcolor="#BCC6CC"  onclick="openInNextPage('<%=notId%>')">
		                    <td>&rarr;</td>
		                    <td class="mailbox-name"><a href="read-mail.html"><% out.print(clientNotificationData.getSender());%></a></td>
		                    <td class="mailbox-subject"><%out.print(clientNotificationData.getData()); %></td>
		                    <td class="mailbox-date"><%out.print(clientNotificationData.getCreationTime()); %></td>
		                    <td class="mailbox-date"><%out.print(clientNotificationData.getCreationDate()); %></td>
		                </tr>
                	  <% }else{ 
                	  %>
                		  <tr>
		                    <td>&rarr;</td>
		                    <td class="mailbox-name"><a href="read-mail.html"><% out.print(clientNotificationData.getSender());%></a></td>
		                    <td class="mailbox-subject"><%out.print(clientNotificationData.getData()); %></td>
		                    <td class="mailbox-date"><%out.print(clientNotificationData.getCreationTime()); %></td>
		                    <td class="mailbox-date"><%out.print(clientNotificationData.getCreationDate()); %></td>
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
		
		window.open("/shristationery/client-notification/view-particular-client-notification?email=${email}&not_id="+notId);
		}
	</script>
</body>
</html>