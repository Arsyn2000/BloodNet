<!DOCTYPE html>
<html lang="en">
    <%@ include file="head.jspf"%>
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
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">UBold</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">eCommerce</a></li>
                                            <li class="breadcrumb-item active">Products</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">Products</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover m-0 table-centered dt-responsive w-100"  id="product-listing" >
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th>Store Name</th>
							                            <th>Product</th>
							                            <th>Type</th>
							                            <th>Vendor</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col -->
                        </div>
                    </div> <!-- container -->
                </div> <!-- content -->
                <%@ include file="footer.jspf"%>
            </div>
        </div>
    	<%@ include file="scripts.jspf"%>
    	
    	<script>
    	$(document).ready(function() {
    		var t = $('#product-listing').DataTable({
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
    	        "columns":[{"data":"storeUrl","render": function ( data, type, row ) {
    	        				return data.replace('.myshopify.com','')}
		    	        	},
		    	        	{"data":"title"},
		    	        	{"data":"productType"},
		    	        	{"data":"vendor"}],
    	        "responsive": true,
    	        "bServerSide": true,
    	        "bDestroy": true,
    	        "bPaginate": true,
    	        "bProcessing": true,
    	        "ajax": {"url": "admin/get-products-for-datatable","type":"POST", "contentType": "application/json","data": function(d) {
    	            return JSON.stringify(d);
    	        	}
    	        }
    	    });
    	});

    </script>
    	
    	
    	
    	
    	    
    </body>
</html>