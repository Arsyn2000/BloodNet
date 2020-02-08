<!DOCTYPE html>
<html lang="en">
    <%@ include file="head.jspf"%>
     <style>
		#store-listing tbody tr.selected {
    			    background-color: #eeeeee;
    			    
    			}
    			
    	#store-listing tbody tr.selected td{
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
                                    
                                    <h4 class="page-title">Stores</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 


                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-body">
                                        <a href="#custom-modal" class="btn btn-success waves-effect waves-light mr-1" data-animation="fadein" data-plugin="custommodal"
                                                     data-overlayColor="#38414a" id="agent_anchor" style="display:none"><i class="fe-user-plus"></i> Add Agent</a>
                
                                        <div class="table-responsive">
		                    				<table id="store-listing" class="table table-hover table-centered mb-0 dt-responsive w-100">
						                      <thead>
						                        <tr>
						                             <th>Store Name</th>
						                            <th>Owner Name</th>
						                            <th>Email Address</th>
						                            <th>Is Call Facility required ?</th>
						                            <th>Status</th>
						                            <th>Edit</th>
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
		            <h4 class="custom-modal-title">Store Configuration</h4>
		            <div class="custom-modal-text text-left">
		                <form class="parsley-examples" id="store-agent-form" name="store-agent-form" method="POST" action="admin/store-agent-mapping" >
		                	<div class="row">
								<div class="col-md-6 grid-margin">
							          <div class="form-group">
							            <label for="firstname">Store Name</label>
							            <input type="text" class="form-control" id="storename" name="storename" placeholder="Store Name" autocomplete="off" disabled>
							            <input type="hidden" id="storeid" name="storeid">
							          </div>
							     </div>
							     <div class="col-md-6 grid-margin">
							          <div class="form-group">
							            <label for="lastname">Owner Name</label>
							            <input type="text" class="form-control" id="ownername" name="ownername" placeholder="Owner Name" autocomplete="off" disabled>
							          </div>
							  	</div>
							</div>
							<div class="row">
								<div class="col-md-6 grid-margin">
							          <div class="form-group">
							            <label for="username">Contact Number</label>
							            <input type="text" class="form-control" id="wphone" name="wphone" placeholder="Work Phone" autocomplete="off" disabled>
							          </div>
								</div>
							    <div class="col-md-6 grid-margin">
								       <div class="form-group">
								            <label for="emailaddress">Email address</label>
								            <input type="email" class="form-control" id="emailaddress" name="emailaddress" placeholder="Email" autocomplete="off" disabled>
								          </div>
								</div>
							</div>	         
							<div class="row">
								<div class="col-md-6 grid-margin"> 
							          <div class="form-group">
							          	<p>Is Call facility Required?</p>
										<label class="toggle-switch">
											<input type="checkbox" id="callfacility">
					                        <span class="toggle-slider round"></span>
					                      </label>                     
							          </div>
							     </div>
					             <div class="col-md-6 grid-margin">
							          <div class="form-group">
							          <!--   <p>Is Store Active?</p>
										<label class="toggle-switch toggle-switch-success">
											<input type="checkbox" id="storestatus">
					                        <span class="toggle-slider round"></span>
					                      </label>
					                      -->                     
							          </div>
							      </div>
					       	</div>
							<div class="row">
							   <div class="col-md-12 grid-margin stretch-card">
								 	<div class="form-group" id="agent-div">
					                    
									</div>
									<select multiple="multiple" class="multi-select" id="my_multi_select1" name="my_multi_select1[]" data-plugin="multiselect">
										<c:forEach items="${agents}" var="agent">
								    		<option value="${agent.id}">${agent.fname} ${agent.lname}</option> 
										</c:forEach>
									</select>
					            </div>
							</div>
			                    <div class="text-right">
			                        <button type="button" class="btn btn-success waves-effect waves-light" id="btn-submit">Save</button>
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
    	<!--  <script src="${pageContext.request.contextPath}/assets/js/pages/jquery.validate.min.js"></script>
    	<script src="${pageContext.request.contextPath}/assets/js/pages/jquery-form.min.js"></script>-->
    	
    	<script>
    		$(document).ready(function(){
				$('#my_multi_select1').multiSelect();    			

    			var t = $('#store-listing').DataTable({
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
        	        "responsive": true,
        	        //"sPaginationType": "full_numbers",
        	        "bServerSide": true,
        	        "bDestroy": true,
        	        "bPaginate": true,
        	        "bProcessing": true,
        	        "columns":[{"data":"shopifyStoreUrl","render": function ( data, type, row ) {return data.replace('.myshopify.com','')}},
        	        	{"data":"fname"},{"data":"email"},{"data":"isCallFacility"},{"data":"accountstatus"},
        	        	{"data":"email", "bSortable": false ,"render": function ( data, type, row ) {
         	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#7c8a87!important"><a href="" class="edit"><i class="fe-edit-1 avatar-title font-22 text-white"></i></a></div></div>';
                        }}],
        	        "ajax": {"url": "admin/get-store-for-datatable","type":"POST", "contentType": "application/json","data": function(d) {
        	            return JSON.stringify(d);
        	        },
        			//"dom":'<\'row\'<\'col-sm-4\'l><\'col-sm-3\'f>>rt<\'col-sm-6\'i>p'
        	        
        	        }
        	    });
        		
        		
        		$('#callfacility').on('change', function() {
        			if(this.checked){
        				console.log("Checked");
        				$('#ddagents').prop("disabled", false);
        			}else{
        				console.log("Un-Checked");
        				$('#ddagents').prop("disabled", true);
        			}
        		});
        		
        		$('#store-listing').on( 'click', 'tr', function () {
        	        if ( $(this).hasClass('selected') ) {
        	            $(this).removeClass('selected');
        	        }
        	        else {
        	            t.$('tr.selected').removeClass('selected');
        	            $(this).addClass('selected');
        	        }
        	    });
        	    
        	    $('#store-listing').on( 'dblclick', 'tr', function () {
        	    	t.$('tr.selected').removeClass('selected');
    	            $(this).addClass('selected');
    	            $('#btn-edit-store').trigger('click');
        	    });
        		
        	    $('#store-listing').on('click','a.edit',function(e){
        	    	e.preventDefault();
        	    	$(this).closest('tr').addClass('selected');
        	    	var vstorecode = t.rows('.selected').data()[0].id;
        			$.ajax({
          	  	      type: 'POST',
          	  	      url: "admin/get-store/"+vstorecode,
          	  	      dataType: "json",
          	  	  	  success: function(resultData) {
          	  	  		$('#storeid').val(resultData.account.id);
          	  	  		$('#storename').val(resultData.account.shopifyStoreUrl);
          	  	  		$('#ownername').val(resultData.account.fname);
          	  	  		$('#wphone').val(resultData.account.wphone);
          	  	  		$('#emailaddress').val(resultData.account.email);
          	  	  		if(resultData.account.isCallFacility == "Yes"){
          	  	  			$('#callfacility').attr( 'checked', true );
          	  	  		}
          	  	  		if(resultData.account.accountstatus == "ACTIVE"){
          	  	  			$('#storestatus').attr( 'checked', true );	
          	  	  		}
          	  	  		
          	  	  		var agents = resultData.agents;
          	  	  		var selected = [];
          	  	  		var i = 0;
          	  	  		$.each(agents,function(a,val){
          	  	  			selected[i] = val.id; 	
          	  	  			i = i +1;
          	  	  		});
          	  	  		console.log('selected ' + selected);
          	  	  		$('#my_multi_select1').val(selected);
          	  	  		$("#my_multi_select1").multiSelect("refresh");
          	  	  		$('#agent_anchor').trigger("click");
          	  	  	}
        		});
        	 });
        		
        		loadAgents();
        		
        		 
        		 $('#btn-submit').on('click',function(){
        			 console.log("Inside submit");
        			 var agentdata = $('#my_multi_select1').val();
        			 var storedata = $('#storeid').val();
        			 var iscallcenter;
        			 if($('#callfacility').prop("checked") == true){
        	                iscallcenter = "Yes";
        	         }else{
        	        	   iscallcenter = "No";
        	         }
        			 var status;
        			 if($('#storestatus').prop("checked") == true){
        				 status = "Yes";
    	 	         }else{
    	 	        	status = "No";
    	 	         }
        			 var data=JSON.stringify(agentdata);
        			 console.log(agentdata);
        			 console.log(storedata);
        			 console.log('selected agent  :' + data);
        			 $.ajax({
             	  	      type: 'POST',
             	  	      url: "admin/store-agent-mapping",
             	  	      data:{'agentdata':data,'storedata':storedata,'iscallcenter':iscallcenter,'status':status},
             	  	      success: function(resp) {
             	  	    	 $.toast({ 
   		    	  	    	  heading: 'Success',
   		    	  	    	  text : resp, 
   		    	  	    	  icon : 'success',
   		    	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
   		    	  	    	  hideAfter: 5000,
   		    	  	    	  position: 'top-right',
   		    	  	    	});  	
    	                	 Custombox.modal.close();
             	  	  		t.ajax.reload(); 
             	  	  	},
             	  	  	error:function(resultData){
             	  	 		console.log("Inside error" + resultData);
             	  	  	}
           			});
        		 });
        
        	
        	function loadAgents(){
        		
        		 console.log("Inside loadAgents");
        		 $.ajax({type : "GET", url : 'admin/get-agents',
        			    success : function(data) {
        			      var html = '';

        			      html += '<label>Agents</label>';
        			      html +=  '<select id="ddagents" multiple="multiple" class="multi-select" name="ddagents[]" data-plugin="multiselect">';
        			     
        			      html+= '<option value="Select">Select Agent(s)</option>';

        			      $.each(data,function(key, val) {
        			    	  console.log(key + " " + val);
        			        html += '<option value=' + key + '>' + val + '</option>';
        			      });

        			      html += "</select>";
        			   /*    $('#agent-div')
        			          .empty()
        			          .append(html)
        			          ;*/
        			  }
        			});
        	};
        	
        	
      	   });
    	</script>    
    </body>
</html>