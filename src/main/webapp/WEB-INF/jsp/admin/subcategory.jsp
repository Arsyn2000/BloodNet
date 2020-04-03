<!DOCTYPE html>
<html lang="en">
    <%@ include file="head.jspf"%>
	<style>
		#subcategory-listing tbody tr.selected {
    			    background-color: #eeeeee;
    			    
    			}
    			
    	#subcategory-listing tbody tr.selected td{
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
                                            <li class="breadcrumb-item active">Sub Category </li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">Sub Category</h4>
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
                                                
                                                    <a href="#custom-modal" class="btn btn-success waves-effect waves-light mr-1" data-animation="fadein" data-plugin="custommodal" data-clearform="yes" data-formid="subcategoryCreateform"
                                                     data-overlayColor="#38414a" id="agent_anchor" name="agent_anchor"><i class="fe-plus-circle"></i> Add Sub Category</a>
                                                     
                                                </div>
                                               
                                            </div><!-- end col-->
                                        </div>
                
                                        <div class="table-responsive">
		                    				<table id="subcategory-listing" class="table table-hover m-0 table-centered dt-responsive w-100">
						                      <thead>
						                        <tr>
						                        	<th>Category</th>
						                            <th>Name</th>
						                            <th>Alias</th>
						                            <th>Description</th>
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
		            <h4 class="custom-modal-title">Sub Category Creation</h4>
		            <div class="custom-modal-text text-left">
		                <form class="parsley-examples" id="subcategoryCreateform" name="subcategoryCreateform" method="POST" action="admin/inventory/subcategory/subcategory-create" >
		                	<div class="row">
		                		<div class="col-md-9 grid-margin">
		                			<div class="form-group">
		                				<label for="categoryname">Category</label>
		                				<select id="categoryname" name="categoryname" class="form-control" required>
		                					<option value="">Select</option>
		                				</select>
		                			</div>
		                		</div>
		                	</div>	
		                	<div class="row">
								<div class="col-md-9 grid-margin">
				                    <div class="form-group">
							            <label for="name">Sub Category Name</label>
							            <input type="text" class="form-control" id="name" name="name" placeholder="Sub Category Name" parsley-trigger="change" required >
										<input type="text" id="subcategoryid" name="subcategoryid" style="display:none">
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
							            <label for="description">Description</label>
							            <input type="text" class="form-control" id="description" name="description" placeholder="Description" parsley-trigger="change" required>
						          	</div>
						        </div>
							   
							 </div>
							 <div class="row">
							 	<div class="col-md-6 grid-margin">
							 		<div class="text-left">
							 			<input type="checkbox" checked="true" data-plugin="switchery" data-color="#039cfd" data-switchery="true" style="display: none;" id="subcategorystatus" name="subcategorystatus" class="js-switch">
							 			
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
					    <strong class="mr-auto text-primary">Sub Category</strong>
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
    	
    	function editSubCategory(vSubCategoryCode) {
    		
			var element = $('#subcategorystatus');
			console.log('Edit ' + vSubCategoryCode);
			$.ajax({
  	  	      type: 'POST',
  	  	      url: "admin/inventory/subcategory/get-subcategory/"+vSubCategoryCode,
  	  	      dataType: "json",
  	  	  	  success: function(resultData) {
  	  	  		$('#subcategoryCreateform').trigger("reset");
  	  	  		$('#subcategoryid').val(resultData.id);
  	  	  		$('#name').val(resultData.name);
  	  	  		$('#alias').val(resultData.alias);
  	  	  		$('#description').val(resultData.description);
  	  	  		$('#categoryname').val(resultData.categoryId);
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

    	function getCategoryForDropDown(){
    		$.ajax({
                type: "GET",
                url:"admin/inventory/category/load-category",
                success: function (data) {
                    $.each(data,function(key,val)
                    {
                    	console.log(val);
	                    var div_data="<option value="+val.id+">"+val.name+"</option>";
	                    console.log(div_data);
	                    $(div_data).appendTo('#categoryname'); 
                    });  
                  }
              });
    	}
    	
    	
    		$(document).ready(function(){
    			var elem = document.querySelector('.js-switch');
    			var init = new Switchery(elem);
    			
    			getCategoryForDropDown();
    			
    			var t = $('#subcategory-listing').DataTable({
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
        	        		{"data":"categoryname"},
        	        		{"data":"name"},
        	        		{"data":"alias"},
        	        		{"data":"description"},
        	        		{"data":"status", "render": function(data,type,row){
        	        			return data.toUpperCase();
        	        		}},
        	        		{"data":"name", "bSortable": false ,"render": function ( data, type, row ) {
             	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#4fc6e1!important">'+
             	        		'<a href="javascript:void(0)" onClick="editSubCategory('+row.id+')" ><i class="fe-edit-1 avatar-title font-22 text-white"></i></a></div></div>';
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
        	        "ajax": {"url": "admin/inventory/subcategory/get-subcategory-for-datatable","type":"POST", "contentType": "application/json","data": function(d) {
        	            return JSON.stringify(d);
        	        	},
        	         "order": [[ 1, "asc" ],[ 2, "asc" ]]
        	        },
    			 	"dom": '<\'row\'<"col-sm-7"><\'col-sm-3\'f><\'col-sm-2\'l>>rt<\'col-sm-12\'i>p'
        	        
        	    });
        		
    			 $('#demo-custom-toolbar2').appendTo($("#subcategory-listing_wrapper div.col-sm-7"));
    			
    			$(".parsley-examples").parsley();
    		
    			
    			$('#subcategoryCreateform').validate({
    				submitHandler: function(form) {
    	                $(form).ajaxSubmit(function(resp) {
    	                	if(resp == 'Yes'){
    	                		 $.toast({ 
    	    	    	  	    	  heading: 'Success',
    	    	    	  	    	  text :'Sub Category updated/created successfully !!!', 
    	    	    	  	    	  icon : 'success',
    	    	    	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
    	    	    	  	    	  hideAfter: 5000,
    	    	    	  	    	  position: 'top-right',
    	    	    	  	    	});
			        		 }else{
			        			 $.toast({ 
			 	    	  	    	  heading: 'Error',
			 	    	  	    	  text : 'Unable to create Sub Category !!!', 
			 	    	  	    	  icon : 'error',
			 	    	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
			 	    	  	    	  hideAfter: 5000,
			 	    	  	    	  position: 'top-right',
			 	    	  	    	});
			        		 }
    	                	 t.ajax.reload();
    	                	 $('#subcategoryCreateform').trigger("reset");
    	                	 $('#subcategoryid').val("");
    	                	 Custombox.modal.close();
    	                });
    	            },
    	            rules: {
    	            	name: {
    	                  required: true,
    	                  remote: {
    	                      url: "admin/inventory/subcategory/check-unique-subcategory-name",
    	                      type: "post",
    	                      data: {
    	                        username: function() {
    	                          return $( "#name" ).val();
    	                        },
    	                        id: function() {
      	                          return $( "#subcategoryid" ).val();
      	                        }
    	                      }
    	                  }
    	                },
    	                categoryname:{
    	                	required:true
    	                }
    	              },
    	             messages:{
    	            	 username:{
    	            		 remote: "Sub Category already exists !!"
    	            	 },
    	            	 categoryname:{
    	            		 required:"Please select category"
    	            	 }
    	             }
    			});
    			
    			 $('#subcategory-listing').on( 'click', 'a.remove',function (e) {
    				 e.preventDefault();
    				 	$(this).closest('tr').addClass('selected');
    	     	    	var vSubCategoryCode = t.rows('.selected').data()[0].id; 
    	     	    	console.log('Remove' + vSubCategoryCode);
    	     	    	$.ajax({
    	     	    	      type: 'POST',
    	     	    	      url: "admin/inventory/subcategory/delete-subcategory/"+vSubCategoryCode,
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