<!DOCTYPE html>
<html lang="en">
    <%@ include file="head.jspf"%>
	<style>
		#distributor-listing tbody tr.selected {
    			    background-color: #eeeeee;
    			    
    			}
    			
    	#distributor-listing tbody tr.selected td{
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
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="admin">Shri Stationery</a></li>
                                            <li class="breadcrumb-item">Inventory</li>
                                            <li class="breadcrumb-item active">Distributor</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">Distributor</h4>
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
                                                
                                                    <a href="#custom-modal" class="btn btn-success waves-effect waves-light mr-1" data-animation="fadein" data-plugin="custommodal" data-clearform="yes" data-formid="distributorCreateform"
                                                     data-overlayColor="#38414a" id="agent_anchor"><i class="fe-plus-circle"></i> Add Distributor</a>
                                                     
                                                </div>
                                               
                                            </div><!-- end col-->
                                        </div>
                
                                        <div class="table-responsive">
		                    				<table id="distributor-listing" class="table table-hover m-0 table-centered dt-responsive w-100 nowrap">
						                      <thead>
						                        <tr>
						                            <th>Name</th>
						                            <th>Phone 1</th>
						                            <th>Phone 2</th>
						                            <th>Contact Person</th>
						                            <th>Status</th>
						                            <th>Edit</th>
						                            <th>Remove</th>
						                            <th>Email</th>
						                            <th>WebSite</th>
						                            <th>GSTIN</th>
						                            <th>Alias</th>
						                            <th>Address</th>
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
		            <h4 class="custom-modal-title">Distributor Creation</h4>
		            <div class="custom-modal-text text-left">
		                <form class="parsley-examples" id="distributorCreateform" name="distributorCreateform" method="POST" action="admin/inventory/distributor/distributor-create" >
		                	<div class="row">
								<div class="col-md-9 grid-margin">
				                    <div class="form-group">
							            <label for="name">Distributor Name</label>
							            <input type="text" class="form-control" id="name" name="name" placeholder="Distributor Name" parsley-trigger="change" required >
										<input type="text" id="distributorid" name="distributorid" style="display:none">
							        </div>
							    </div>
								<div class="col-md-3 grid-margin">
				                    <div class="form-group">
							            <label for="alias">Alias</label>
							            <input type="text" class="form-control" id="alias" name="alias" placeholder="Alias" parsley-trigger="change" required>
							        </div>
							      </div>
							   </div>
							   <div class="row">
								<div class="col-md-12 grid-margin">
				                    <div class="form-group">
							            <label for="address">Address</label>
							            <input type="text" class="form-control" id="address" name="address" placeholder="Full Address" parsley-trigger="change" required>
						          	</div>
						        </div>
							 </div>
							  <div class="row">
							 	<div class="col-md-6 grid-margin">
								 	<div class="form-group">
								            <label for="gstin">GST Number</label>
								            <input type="text" class="form-control" id="gstin" name="gstin" placeholder="GST Number" parsley-trigger="change" required>
							        </div>
							 	</div>
							 	<div class="col-md-6 grid-margin">
								 	<div class="form-group">
								            <label for="contact-person">Contact Person</label>
								            <input type="text" class="form-control" id="contact-person" name="contact-person" placeholder="Contact Person" parsley-trigger="change" required>
							        </div>
							 	</div>
							 </div>
							 <div class="row">
							 	<div class="col-md-6 grid-margin">
								 	<div class="form-group">
								            <label for="phone1">Phone Number</label>
								            <input type="text" class="form-control" id="phone1" name="phone1" placeholder="Contact Number" parsley-trigger="change" required>
							        </div>
							 	</div>
							 	<div class="col-md-6 grid-margin">
								 	<div class="form-group">
								            <label for="phone2">Alternate Number</label>
								            <input type="text" class="form-control" id="phone2" name="phone2" placeholder="Alternate Number" parsley-trigger="change" required>
							        </div>
							 	</div>
							 </div>
							 <div class="row">
							 	<div class="col-md-6 grid-margin">
								 	<div class="form-group">
								            <label for="email">Email Address</label>
								            <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" parsley-trigger="change" required>
							        </div>
							 	</div>
							 	<div class="col-md-6 grid-margin">
								 	<div class="form-group">
								            <label for="website">Website</label>
								            <input type="text" class="form-control" id="website" name="website" placeholder="Website URL" parsley-trigger="change" required>
							        </div>
							 	</div>
							 </div>
							 <div class="row">
							 	<div class="col-md-6 grid-margin">
							 		<div class="text-left">
							 			<input type="checkbox" checked="true" data-plugin="switchery" data-color="#039cfd" data-switchery="true" style="display: none;" id="distributorstatus" name="distributorstatus" class="js-switch">
							 		</div>	
							 	</div>
							 	<div class="col-md-6 grid-margin">
									<div class="text-right">
				                        <button type="submit" class="btn btn-success waves-effect waves-light" id="btn-submit">Save</button>
				                        <button type="button" class="btn btn-danger waves-effect waves-light m-l-10" onclick="Custombox.modal.close();">Cancel</button>
				                    </div> 	
							 	</div>
							 </div>
		                </form>
           			 </div>
       			 </div> 
       			 <div class="toast fade" role="alert" aria-live="assertive" aria-atomic="true"  data-autohide="true" style="position: absolute; top: 12%; right: 1%;" >
					  <div class="toast-header">
					    <strong class="mr-auto text-primary">Distributor</strong>
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
    	<script src="${pageContext.request.contextPath}/assets/libs/switchery/switchery.min.js"></script>
    	<script>
    	
    	function changeSwitchery(element, checked) {
    		  if ( ( element.is(':checked') && checked == false ) || ( !element.is(':checked') && checked == true ) ) {
    		    element.parent().find('.switchery').trigger('click');
    		  }
    		}
    	
    	function editDistributor(vDistributorCode) {
    		
			var element = $('#distributorstatus');
			console.log('Edit ' + vDistributorCode);
			$.ajax({
  	  	      type: 'POST',
  	  	      url: "admin/inventory/distributor/get-distributor/"+vDistributorCode,
  	  	      dataType: "json",
  	  	  	  success: function(resultData) {
  	  	  		$('#distributorCreateform').trigger("reset");
  	  	  		$('#distributorid').val(resultData.id);
  	  	  		$('#name').val(resultData.name);
  	  	  		$('#alias').val(resultData.alias);
  	  	  		$('#address').val(resultData.address);
  	  	  		$('#phone1').val(resultData.phone1);
  	  	  		$('#phone2').val(resultData.phone2);
  	  	  		$('#email').val(resultData.email);
  	  	  		$('#website').val(resultData.website);
  	  	  		$('#gstin').val(resultData.gstin);
  	  	  		$('#contact-person').val(resultData.contactPerson);
  	  	  		console.log(resultData.status);
  	  	  		if(resultData.status == "on"){
  	  	  			changeSwitchery(element, true);
  	  	  		}else{
	  	  	  		changeSwitchery(element, false);
  	  	  		}
  	  	  		
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
    			var elem = document.querySelector('.js-switch');
    			var init = new Switchery(elem);
    			
    			
    			var t = $('#distributor-listing').DataTable({
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
        	        		{"data":"name","width": "30%"},
        	        		{"data":"phone1","width": "10%"},
        	        		{"data":"phone2","width": "10%"},
        	        		{"data":"contactPerson","width":"20%"},
        	        		{"data":"status", "width":"10%","render": function(data,type,row){
        	        			return data.toUpperCase();
        	        		}},
        	        		{"data":"name", "width":"10%","bSortable": false ,"render": function ( data, type, row ) {
             	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#4fc6e1!important">'+
             	        		'<a href="javascript:void(0)" onClick="editDistributor('+row.id+')" ><i class="fe-edit-1 avatar-title font-22 text-white"></i></a></div></div>';
                            }},
                            {"data":"name", "width":"10%","bSortable": false ,"render": function ( data, type, row ) {
             	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#ed2643!important"><a href="" class="remove"><i class="fe-x avatar-title font-22 text-white"></i></a></div></div>';
                            }},
                            {"data":"email"},
        	        		{"data":"website"},
        	        		{"data":"gstin"},
                            {"data":"alias"},
        	        		{"data":"address"}
        	        		],
        	        "responsive": true,
        	        //"sPaginationType": "full_numbers",
        	        "bServerSide": true,
        	        "bDestroy": true,
        	        "bPaginate": true,
        	        "bProcessing": true,
        	        "ajax": {"url": "admin/inventory/distributor/get-distributor-for-datatable","type":"POST", "contentType": "application/json","data": function(d) {
        	            return JSON.stringify(d);
        	        	},
        	        },
        	        
    			  "dom": '<\'row\'<"col-sm-7"><\'col-sm-3\'f><\'col-sm-2\'l>>rt<\'col-sm-12\'i>p'
        	        
        	    });
        		
    			 $('#demo-custom-toolbar2').appendTo($("#distributor-listing_wrapper div.col-sm-7"));
    			
    			$(".parsley-examples").parsley();
    		
    			
    			$('#distributorCreateform').validate({
    				submitHandler: function(form) {
    	                $(form).ajaxSubmit(function(resp) {
    	                	if(resp == 'Yes'){
    	                		 $.toast({ 
    	    	    	  	    	  heading: 'Success',
    	    	    	  	    	  text :'Distributor updated/created successfully !!!', 
    	    	    	  	    	  icon : 'success',
    	    	    	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
    	    	    	  	    	  hideAfter: 5000,
    	    	    	  	    	  position: 'top-right',
    	    	    	  	    	});
			        		 }else{
			        			 $.toast({ 
			 	    	  	    	  heading: 'Error',
			 	    	  	    	  text : 'Unable to create Distributor !!!', 
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
    	            	name: {
    	                  required: true,
    	                  remote: {
    	                      url: "admin/inventory/distributor/check-unique-distributor-name",
    	                      type: "post",
    	                      data: {
    	                        username: function() {
    	                          return $( "#name" ).val();
    	                        },
    	                        id: function() {
      	                          return $( "#distributorid" ).val();
      	                        },
      	                        gstin: function(){
      	                        	return $('#gstin').val();
      	                        }
    	                      }
    	                  }
    	                }
    	              },
    	             messages:{
    	            	 username:{
    	            		 remote: "Distributor already exists !!"
    	            	 }
    	             }
    			});
    			
    			
    			 $('#distributor-listing').on( 'click', 'a.remove',function (e) {
    				 e.preventDefault();
    				 	$(this).closest('tr').addClass('selected');
    	     	    	var vDistributorCode = t.rows('.selected').data()[0].id; 
    	     	    	console.log('Remove' + vDistributorCode);
    	     	    	$.ajax({
    	     	    	      type: 'POST',
    	     	    	      url: "admin/inventory/distributor/delete-distributor/"+vDistributorCode,
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