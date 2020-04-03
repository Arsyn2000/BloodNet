<!DOCTYPE html>
<html lang="en">
    <%@ include file="head.jspf"%>
	<style>
		#category-listing tbody tr.selected {
    			    background-color: #eeeeee;
    			    
    			}
    			
    	#category-listing tbody tr.selected td{
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
                                    
                                    <h4 class="page-title">Company</h4>
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
                                                
                                                    <a href="#custom-modal" class="btn btn-success waves-effect waves-light mr-1" data-animation="fadein" data-plugin="custommodal" data-clearform="yes" data-formid="companyCreateform"
                                                     data-overlayColor="#38414a" id="agent_anchor"><i class="fe-plus-circle"></i> Add Company</a>
                                                     
                                                </div>
                                               
                                            </div><!-- end col-->
                                        </div>
                
                                        <div class="table-responsive">
		                    				<table id="company-listing" class="table table-hover m-0 table-centered dt-responsive w-100">
						                      <thead>
						                        <tr>
						                            <th>Name</th>
						                            <th>WebSite</th>
						                            <th>Email</th>
						                            <th>Margin</th>
						                            <th>Status</th>
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
		            <h4 class="custom-modal-title">Company Creation</h4>
		            <div class="custom-modal-text text-left">
		                <form class="parsley-examples" id="companyCreateform" name="companyCreateform" method="POST" action="admin/inventory/company/company-create" enctype="multipart/form-data">
		                	<div class="row">
								<div class="col-md-8 grid-margin">
				                    <div class="form-group">
							            <label for="name">Company Name</label>
							            <input type="text" class="form-control" id="name" name="name" placeholder="Category Name" parsley-trigger="change" required="true" />
										<input type="text" id="companyid" name="companyid" style="display:none">
							        </div>
							    </div>
							     <div class="col-md-4 text-center">
							 		<img src="assets/images/users/user-5.jpg" alt="image" class="img-fluid avatar-lg img-thumbnail" id="logo" name="logo">
							     </div>
							   </div>
							   <div class="row">
							    <div class="col-md-4 grid-margin">
				                    <div class="form-group">
							            <label for="alias">Alias</label>
							            <input type="text" class="form-control" id="alias" name="alias" placeholder="Alias" parsley-trigger="change"/>
							        </div>
							      </div>
						        <div class="col-md-4 grid-margin">
				                    <div class="form-group">
							            <label for="discount">Base Discount</label>
							            <input type="text" class="form-control" id="discount" name="discount" placeholder="Discount" parsley-trigger="change"/>
						          	</div>
						        </div>
						        <div class="col-md-4 grid-margin">
						        	<div class="form-group">
							        	<label>Upload Logo</label>
	                                    <div class="input-group">
	                                        <div class="custom-file">
	                                            <input type="file" class="custom-file-input" id="logo-file" name="logo-file" accept='image/*'>
	                                            <label class="custom-file-label" for="inputGroupFile04">Choose file</label>
	                                        </div>
										</div>
									</div>
						        </div>
							 </div>
							 <div class="row">
							 	<div class="col-md-12 grid-margin">
				                    <div class="form-group">
							            <label for="description">Description</label>
							            <input type="text" class="form-control" id="description" name="description" placeholder="Description" parsley-trigger="change"/>
						          	</div>
						        </div>
							 </div>
							 <div class="row">
							 	<div class="col-md-6 grid-margin">
							 		<div class="form-group">
							 			<label for="url">Website</label>
							 			<input type="url" class="form-control" id="url" name="url" placeholder="Website URL" parsley-trigger="change">
							 		</div>
							 	</div>
							 	<div class="col-md-6 grid-margin">
							 		<div class="form-group">
							 			<label for="email">eMail</label>
							 			<input type="email" class="form-control" id="email" name="email" placeholder="E-mail address" parsley-trigger="change">
							 		</div>
							 	</div>
							 </div>
							 <div class="row">
							 	<div class="col-md-6 grid-margin">
							 		<div class="form-group">
							 			<label for="phone">Phone Number</label>
							 			<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number" parsley-trigger="change" pattern="[0-9]{10}">
							 		</div>
							 	</div>
							 	<div class="col-md-6 grid-margin">
							 		<div class="form-group">
							 			<label for="fax">Fax Number</label>
							 			<input type="tel" class="form-control" id="fax" name="fax" placeholder="Fax Number" parsley-trigger="change">
							 		</div>
							 	</div>
							 </div>
							 <div class="row">
								<div class="col-md-12 grid-margin">
				                    <div class="form-group">
							            <label for="address">Address</label>
							            <input type="text" class="form-control" id="address" name="address" placeholder="Address" parsley-trigger="change"/>
						          	</div>
						        </div>
							 </div>
							 <div class="row">
							 	<div class="col-md-6 grid-margin">
							 		<div class="text-left">
							 			<input type="checkbox" checked="true" data-plugin="switchery" data-color="#039cfd" data-switchery="true" style="display: none;" id="status" name="status" class="js-switch"/>
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
    	
    	function editCompany(vCompanyCode) {
    		
			var element = $('#status');
			console.log('Edit ' + vCompanyCode);
			$.ajax({
  	  	      type: 'GET',
  	  	      url: "admin/inventory/company/get-company/"+vCompanyCode,
  	  	      dataType: "json",
  	  	  	  success: function(resultData) {
  	  	  		$('#companyCreateform').trigger("reset");
  	  	  		$('#companyid').val(resultData.id);
  	  	  		$('#name').val(resultData.name);
  	  	  		$('#alias').val(resultData.alias);
  	  	  		$('#description').val(resultData.description);
			  	$('#discount').val(resultData.baseDiscount);
			  	$('#url').val(resultData.url);
			  	$('#email').val(resultData.email);
			  	$('#phone').val(resultData.phone);
			  	$('#fax').val(resultData.fax);
			  	$('#description').val(resultData.description);
			  	$('#address').val(resultData.address);
  	  	  		if(resultData.status == "on"){
  	  	  			changeSwitchery(element, true);
  	  	  		}else{
	  	  	  		console.log('inside else');
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

    	function readURL(input) {
    		var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#logo').attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input);
		}
    	
    		$(document).ready(function(){
    			var elem = document.querySelector('.js-switch');
    			var init = new Switchery(elem);

    	        $('#logo-file').on('change',function(event){
    	            //get the file name
    	            var fileName = $(this).val();
    	            //replace the "Choose a file" label
    	            $(this).next('.custom-file-label').html(fileName.replace('C:\\fakepath\\', " "));
    	            var input = event.target;

    	            var reader = new FileReader();
    	            reader.onload = function(){
	    	            var dataURL = reader.result;
	    	            var output = document.getElementById('logo');
	    	            output.src = dataURL;
    	            };
    	            reader.readAsDataURL(input.files[0]);
    	        });
    	    	
    			
    			var t = $('#company-listing').DataTable({
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
        	        		{"data":"name"},
        	        		{"data":"url", "render": function(data,type,row){
        	        			return '<a href="' + data + '" target="_blank">'+ data + '</a>';
        	        		}},
        	        		{"data":"email", "render": function(data,type,row){
        	        			return '<a href="mailto:' + data + '">'+ data + '</a>';
        	        		}},
        	        		{"data":"baseDiscount"},
        	        		{"data":"status", "render": function(data,type,row){
        	        			return data.toUpperCase();
        	        		}},
        	        		{"data":"name", "bSortable": false ,"render": function ( data, type, row ) {
             	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#4fc6e1!important">'+
             	        		'<a href="javascript:void(0)" onClick="editCompany('+row.id+')" ><i class="fe-edit-1 avatar-title font-22 text-white"></i></a></div></div>';
                            }},
                            {"data":"name", "bSortable": false ,"render": function ( data, type, row ) {
             	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#ed2643!important"><a href="" class="remove"><i class="fe-x avatar-title font-22 text-white"></i></a></div></div>';
                            }}
        	        		],
        	        "responsive": true,
        	        //"sPaginationType": "full_numbers",
        	        "bServerSide": true,
        	        "bDestroy": true,
        	        "bPaginate": true,
        	        "bProcessing": true,
        	        "ajax": {"url": "admin/inventory/company/get-company-for-datatable","type":"POST", "contentType": "application/json","data": function(d) {
        	            return JSON.stringify(d);
        	        	}
        	        },
    			 	"dom": '<\'row\'<"col-sm-7"><\'col-sm-3\'f><\'col-sm-2\'l>>rt<\'col-sm-12\'i>p'
        	        
        	    });
        		
    			 $('#demo-custom-toolbar2').appendTo($("#category-listing_wrapper div.col-sm-7"));
    			
    			$(".parsley-examples").parsley();
    		
    			
    			$('#companyCreateform').validate({
    				submitHandler: function(form) {
    	                $(form).ajaxSubmit(function(resp) {
    	                	if(resp == 'Yes'){
    	                		 $.toast({ 
    	    	    	  	    	  heading: 'Success',
    	    	    	  	    	  text :'Company updated/created successfully !!!', 
    	    	    	  	    	  icon : 'success',
    	    	    	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
    	    	    	  	    	  hideAfter: 5000,
    	    	    	  	    	  position: 'top-right',
    	    	    	  	    	});
			        		 }else{
			        			 $.toast({ 
			 	    	  	    	  heading: 'Error',
			 	    	  	    	  text : 'Unable to create Company !!!', 
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
    	                      url: "admin/inventory/company/check-unique-company-name",
    	                      type: "get",
    	                      data: {
    	                        username: function() {
    	                          return $( "#name" ).val();
    	                        },
    	                        id: function() {
      	                          return $( "#companyid" ).val();
      	                        }
    	                      }
    	                  }
    	                }
    	              },
    	             messages:{
    	            	 username:{
    	            		 remote: "Company already exists !!"
    	            	 }
    	             }
    			});
    			
    			
    			 $('#company-listing').on( 'click', 'a.remove',function (e) {
    				 e.preventDefault();
    				 	$(this).closest('tr').addClass('selected');
    	     	    	var vCompanyCode = t.rows('.selected').data()[0].id; 
    	     	    	console.log('Remove' + vCompanyCode);
    	     	    	$.ajax({
    	     	    	      type: 'DELETE',
    	     	    	      url: "admin/inventory/company/delete-company/"+vCompanyCode,
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