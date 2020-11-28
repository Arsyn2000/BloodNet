<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="com.taim.conduire.domain.AdminNotificationData" %>
<%@ page language="java" import="com.taim.conduire.service.AdminNotificationDataService" %>
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
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <li class="nav-item"><a class="nav-link active" href="#timeline" data-toggle="tab">Timeline</a></li>
                  <li class="nav-item"><a class="nav-link " href="#activity" data-toggle="tab">Messages</a></li>
                  <li class="nav-item"><a class="nav-link" href="#settings" data-toggle="tab">Mail</a></li>
                </ul>
              </div>
              <div class="card-body">
                <div class="tab-content">
                  <div class="active tab-pane " id="timeline">
                    <div class="timeline timeline-inverse">
                    	<% List<AdminNotificationData> listAdminNotificationData = (List<AdminNotificationData>)request.getAttribute("listAdminNotificationData");  %>
                    	<% List<AdminNotificationData> listAdminNotificationData1 = (List<AdminNotificationData>)request.getAttribute("listAdminNotificationData1");  %>
                    	<% List<AdminNotificationData> listAdminNotificationData2 = (List<AdminNotificationData>)request.getAttribute("listAdminNotificationData2");  %>
                    	
                    <%  
                    	int flag=0;
                    	String date = listAdminNotificationData.get(0).getCreationDate();
                    	for(AdminNotificationData adminNotificationData:listAdminNotificationData){
                    		//String date = adminNotificationData.getCreationDate();
                    		if(flag==0){
                    			flag=1;
                    %>
                    	<div class="time-label">
	                		<span class="bg-red"><% out.print(date); %></span>
	             	 	</div>
	             	 <% 
                    		}
                    		else if(flag!=0){
                    			String dt = adminNotificationData.getCreationDate();
                    			if(dt.equals(date)){
                    				//nothing
                    			}
                    			else{
                    				date=dt;
                    %>
                    	<div class="time-label">
	                		<span class="bg-red"><% out.print(date); %></span>
	             	 	</div>
                    <%			}
                    		}
                    
                    		
                    		if(adminNotificationData.getType().equals("not")){
					%>
						<div>
                        <i class="fas fa-user bg-info"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> <% out.print(adminNotificationData.getCreationTime());%></span>

                          <h3 class="timeline-header border-0"> 
                          	<% out.print(adminNotificationData.getNotificationData());%>
                          </h3>
                        </div>
                      </div>
					<%
                    		}
					else if(adminNotificationData.getType().equals("msg")){
						%>	
					<div>
                        <i class="fas fa-comments bg-warning"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i> <% out.print(adminNotificationData.getCreationTime());%></span>

                          <h3 class="timeline-header">
                           	<% out.print(adminNotificationData.getNotificationData());%>
                           </h3>

                          
                          <div class="timeline-footer">
                            <a href="#" class="btn btn-warning btn-flat btn-sm">View Message</a>
                          </div>
                        </div>
                      </div>	
					<%
					}
					else if(adminNotificationData.getType().equals("mail")){
						%>	
					<div>
                        <i class="fas fa-envelope bg-primary"></i>

                        <div class="timeline-item">
                          <span class="time"><i class="far fa-clock"></i><% out.print(adminNotificationData.getCreationTime());%></span>

                          <h3 class="timeline-header">
                          	<% out.print(adminNotificationData.getNotificationData());%>
                          </h3>

                          
                          <div class="timeline-footer">
                            <a href="#" class="btn btn-primary btn-sm">Read</a>
                          </div>
                        </div>
                      </div>
                     <%}
                    		}%>

                    </div>
                  </div>
                  <div class="tab-pane" id="activity">
                  	<div class="timeline timeline-inverse">						
						<% for(AdminNotificationData adminNotificationData:listAdminNotificationData1){ %>
						<div>
					    	<div class="timeline-item">
						    	<span class="time"><i class="far fa-clock"></i> <% out.print(adminNotificationData.getCreationTime());%></span>
									<h3 class="timeline-header">
								    	<% out.print(adminNotificationData.getNotificationData());%>
			                        </h3>
								    <div class="timeline-footer">
			                        	<a href="#" class="btn btn-warning btn-flat btn-sm">View Message</a>
								     </div>
							</div>
						 </div>	
						<%} %>
						</div>				
                  	</div>

                  <div class="tab-pane" id="settings">
                  	<div class="timeline timeline-inverse">	
						<% for(AdminNotificationData adminNotificationData:listAdminNotificationData2){ %>
							<div>
					    	<div class="timeline-item">
						    	<span class="time"><i class="far fa-clock"></i> <% out.print(adminNotificationData.getCreationTime());%></span>
									<h3 class="timeline-header">
								    	<% out.print(adminNotificationData.getNotificationData());%>
			                        </h3>
								    <div class="timeline-footer">
			                        	<a href="#" class="btn btn-primary btn-sm">Read</a>
								     </div>
							</div>
						 </div>
						<%} %>
					</div>
                  </div>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </section>
      </div>
    
  
  		
	
	<%@ include file = "scripts.jsp" %>
	
</body>
</html>