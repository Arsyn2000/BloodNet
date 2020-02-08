<!DOCTYPE html>
<html lang="en">
    <%@ include file="head.jspf"%>
	<style>
		#agent-listing tbody tr.selected {
    			    background-color: #eeeeee;
    			    
    			}
    			
    	#agent-listing tbody tr.selected td{
    			    border-color:#eeeeee;
    			}
	</style>    
    <body>
        <div id="wrapper">
    		<%@ include file="topnavbar.jspf"%>        
            <%@ include file="leftsidemenu.jspf"%>
           
            <div class="content-page">
                <div class="content">

                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    
                                    <h4 class="page-title">Agents</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 


                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row mb-2">
                                           
                                            <div class="">
                                                <div class="text-sm-left mt-3 mt-lg-0" id="demo-custom-toolbar2">
                                                
                                                    <a href="#custom-modal" class="btn btn-success waves-effect waves-light mr-1" data-animation="fadein" data-plugin="custommodal" data-clearform="yes" data-formid="agentCreateform"
                                                     data-overlayColor="#38414a" id="agent_anchor"><i class="fe-user-plus"></i> Add Agent</a>
                                                     
                                                </div>
                                               
                                            </div><!-- end col-->
                                        </div>
                
                                        <div class="table-responsive">
		                    				<table id="agent-listing" class="table table-hover m-0 table-centered dt-responsive w-100">
						                      <thead>
						                        <tr>
						                            <th>First Name</th>
						                            <th>Last Name</th>
						                            <th>User Name</th>
						                            <th>Email Address</th>
						                            <th>Account Status</th>
						                            <th>Edit</th>
						                            <th>Remove</th>
						                        </tr>
						                      </thead>
						                      <tbody>
						                      </tbody>
		                    				</table>
		                  				</div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col -->

                            
                        </div>
                        <!-- end row -->
                        
                    </div> <!-- container -->

                </div>
                <div id="custom-modal" class="modal-demo">
		            <button type="button" class="close" onclick="Custombox.modal.close();">
		                <span>&times;</span><span class="sr-only">Close</span>
		            </button>
		            <h4 class="custom-modal-title">Agent Creation</h4>
		            <div class="custom-modal-text text-left">
		                <form class="parsley-examples" id="agentCreateform" name="agentCreateform" method="POST" action="agent/create" >
		                	<div class="row">
								<div class="col-md-6 grid-margin">
				                    <div class="form-group">
							            <label for="firstname">First Name</label>
							            <input type="text" class="form-control" id="firstname" name="firstname" placeholder="First Name" parsley-trigger="change" required >
										<input type="hidden" id="agentid" name="agentid">
							        </div>
							    </div>
								<div class="col-md-6 grid-margin">
				                    <div class="form-group">
							            <label for="lastname">Last Name</label>
							            <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last Name" parsley-trigger="change" required>
							        </div>
							      </div>
							   </div>
							   <div class="row">
								<div class="col-md-6 grid-margin">
				                    <div class="form-group">
							            <label for="username">User Name</label>
							            <input type="text" class="form-control" id="username" name="username" placeholder="User Name" parsley-trigger="change" required>
							            <div id="hiddenstatus"></div>
						          	</div>
						        </div>
								<div class="col-md-6 grid-margin">
				                   <div class="form-group">
							            <label for="emailaddress">Email address</label>
							            <input type="email" class="form-control" id="emailaddress" name="emailaddress" placeholder="Email" parsley-trigger="change" required>
							       </div>
							     </div>
							   </div>
							   <div class="row">
							      <div class="col-md-6 grid-margin">
				 				   <div class="form-group" id="password_div">
							            <label for="password">Password</label>
							            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
						           </div>
						          </div>
						          <div class="col-md-6 grid-margin">
						           <div class="form-group" id="confirm_password_div">
							            <label for="confirm_password">Confirm Password</label>
							            <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Confirm Password" data-parsley-equalto="#password" required>
							       </div>
							      </div>
							     </div>
							    <div class="row">
							      <div class="col-md-6 grid-margin">
				 				   <div class="form-group" id="line_number">
							            <label for="password">Line Number</label>
							            <input type="text" class="form-control" id="line_number" name="line_number" placeholder="Line Number" required>
						           </div>
						          </div>
						          
							     </div>
							     
				                    <div class="text-right">
				                        <button type="submit" class="btn btn-success waves-effect waves-light" id="btn-submit">Save</button>
				                        <button type="button" class="btn btn-danger waves-effect waves-light m-l-10" onclick="Custombox.modal.close();">Cancel</button>
				                    </div>
		                </form>
           			 </div>
           			 
       			 </div> 
       			 <div class="toast fade" role="alert" aria-live="assertive" aria-atomic="true"  data-autohide="true" style="position: absolute; top: 12%; right: 1%;" >
					  <div class="toast-header">
					    <strong class="mr-auto text-primary">Agents</strong>
					    <small class="text-muted"></small>
					    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
					  </div>
					  <div class="toast-body">
					    Some text inside the toast body
					  </div>
					</div>
                <%@ include file="footer.jspf"%>
                
            </div>
        </div>
    	<%@ include file="scripts.jspf"%>
    	<script src="${pageContext.request.contextPath}/assets/js/pages/jquery.validate.min.js"></script>
    	<script src="${pageContext.request.contextPath}/assets/js/pages/jquery-form.min.js"></script>
    	
    	<script>
    	function editAgent(vAgentCode) {
			 
			console.log('Edit ' + vAgentCode);
			$.ajax({
  	  	      type: 'POST',
  	  	      url: "agent/get-agent/"+vAgentCode,
  	  	      dataType: "json",
  	  	  	  success: function(resultData) {
  	  	  		$('#agentCreateform').trigger("reset");
  	  	  		$('#agentid').val(resultData.id);
  	  	  		$('#firstname').val(resultData.fname);
  	  	  		$('#lastname').val(resultData.lname);
  	  	  		$('#username').val(resultData.username);
  	  	  		$('#emailaddress').val(resultData.email);
  	  	  		$('#password').val(resultData.password);
  	  	  		$('#confirm_password').val(resultData.password);
  	  	  		console.log('ln ' + resultData.lineNumber);	
  	  	  		$('#line_number').val(resultData.lineNumber);
  	  	  		
              	var modal = new Custombox.modal({
                    content: {
                        target: '#custom-modal',
                        effect: 'fadein'
                    },
                    overlay: {
                        color: '#38414a'
                    }
                });
                modal.open();
  	  	  	  }
  	  	  	
			});
		}

    	
    		$(document).ready(function(){
    			
    			var t = $('#agent-listing').DataTable({
    				language:{
    					paginate:{
    						previous:"<i class='mdi mdi-chevron-left'>",
    						next:"<i class='mdi mdi-chevron-right'>"
    					},
    					"infoFiltered": ""
    			 	},
    			 	drawCallback:function(){
    			 		$(".dataTables_paginate > .pagination").addClass("pagination-rounded")
    			 	},
        	        "columns":[
        	        		{"data":"fname"},
        	        		{"data":"lname"},
        	        		{"data":"username"},
        	        		{"data":"email"},
        	        		{"data":"accountstatus"},
        	        		{"data":"fname", "bSortable": false ,"render": function ( data, type, row ) {
             	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#4fc6e1!important">'+
             	        		'<a href="javascript:void(0)" onClick="editAgent('+row.id+')" ><i class="fe-edit-1 avatar-title font-22 text-white"></i></a></div></div>';
                            }},
                            {"data":"fname", "bSortable": false ,"render": function ( data, type, row ) {
             	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#ed2643!important"><a href="" class="remove"><i class="fe-user-x avatar-title font-22 text-white"></i></a></div></div>';
                            }}
        	        		],
        	        "responsive": true,
        	        //"sPaginationType": "full_numbers",
        	        "bServerSide": true,
        	        "bDestroy": true,
        	        "bPaginate": true,
        	        "bProcessing": true,
        	        "ajax": {"url": "agent/get-agents-for-datatable","type":"POST", "contentType": "application/json","data": function(d) {
        	            return JSON.stringify(d);
        	        	}
        	        },
    			 	"dom": '<\'row\'<"col-sm-7"><\'col-sm-3\'f><\'col-sm-2\'l>>rt<\'col-sm-12\'i>p'
        	        
        	    });
        		
    			 $('#demo-custom-toolbar2').appendTo($("#agent-listing_wrapper div.col-sm-7"));
    			
    			$(".parsley-examples").parsley();
    		
    			
    			$('#agentCreateform').validate({
    				submitHandler: function(form) {
    	                $(form).ajaxSubmit(function(resp) {
    	                	if(resp == 'Yes'){
    	                		 $.toast({ 
    	    	    	  	    	  heading: 'Success',
    	    	    	  	    	  text :'Agent updated/created successfully !!!', 
    	    	    	  	    	  icon : 'success',
    	    	    	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
    	    	    	  	    	  hideAfter: 5000,
    	    	    	  	    	  position: 'top-right',
    	    	    	  	    	});
			        		 }else{
			        			 $.toast({ 
			 	    	  	    	  heading: 'Error',
			 	    	  	    	  text : 'Unable to create Agent !!!', 
			 	    	  	    	  icon : 'error',
			 	    	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
			 	    	  	    	  hideAfter: 5000,
			 	    	  	    	  position: 'top-right',
			 	    	  	    	});
			        		 }
    	                	 t.ajax.reload();
    	                	Custombox.modal.close();
    	                });
    	            },
    	            rules: {
    	            	username: {
    	                  required: true,
    	                  remote: {
    	                      url: "agent/check-unique-username",
    	                      type: "post",
    	                      data: {
    	                        username: function() {
    	                          return $( "#username" ).val();
    	                        },
    	                        id: function() {
      	                          return $( "#agentid" ).val();
      	                        }
    	                      }
    	                  }
    	                }
    	              },
    	             messages:{
    	            	 username:{
    	            		 remote: "Username already exists !!"
    	            	 }
    	             }
    			});
    			
    			
    			 $('#agent-listing').on( 'click', 'a.remove',function (e) {
    				 e.preventDefault();
    				 	$(this).closest('tr').addClass('selected');
    	     	    	var vAgentCode = t.rows('.selected').data()[0].id; 
    	     	    	console.log('Remove' + vAgentCode);
    	     	    	$.ajax({
    	     	    	      type: 'POST',
    	     	    	      url: "agent/delete-agent/"+vAgentCode,
    	     	    	      dataType: "text",
    	     	    	      success: function(resp) { 
    	     	    	    	 $.toast({ 
    	    	    	  	    	  heading: 'Success',
    	    	    	  	    	  text : resp, 
    	    	    	  	    	  icon : 'success',
    	    	    	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
    	    	    	  	    	  hideAfter: 5000,
    	    	    	  	    	  position: 'top-right',
    	    	    	  	    	}); 	    	    		    
    	           	    		  t.ajax.reload();
    	     	    	      }
    	     	    	});
      	   		 	});
      	   });
    	</script>    
    </body>
</html>