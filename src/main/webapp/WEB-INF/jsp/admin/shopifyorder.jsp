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
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Home</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Orders</a></li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">Orders</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                    	<h2 class="header-title" style="padding-bottom:20px">New Order(s)</h2>
                                        <div class="table-responsive">
                                            <table class="table table-hover m-0 table-centered dt-responsive w-100"  id="order-listing" >
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th>Store </th>
							                            <th>Order Number</th>
							                            <th>Date</th>
							                            <th>Customer Name</th>
							                            <th>Payment</th>
							                            <th>Fulfillment</th>
							                            <th>Total</th>
							                            <th>Agent Name</th>
							                            <th>View</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col -->
                        </div>
                         <div class="row">
                            <div class="col-12">
                                <div class="card-box">
                                <h2 class="header-title" style="padding-bottom:20px">Confirm Order(s)</h2>
                                    <table class="table table-hover m-0 table-centered dt-responsive nowrap w-100" id="confirm-orders">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Store</th>
                                            <th>Created Date</th>
                                            <th>Customer</th>
                                            <th>Status</th>
                                            <th>Agent Name</th>
                                            <th>View</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div><!-- end col -->
                        </div>
                        
                         <div class="row">
                            <div class="col-12">
                                <div class="card-box">
                                	<h2 class="header-title" style="padding-bottom:20px">Processing Order(s)</h2>
                                    <table class="table table-hover m-0 table-centered dt-responsive nowrap w-100" id="processing-orders">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Store</th>
                                            <th>Created Date</th>
                                            <th>Customer</th>
                                            <th>Status</th>
                                            <th>Agent Name</th>
                                            <th>Download PS</th>
                                            <th>View</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>                                    
                                </div>
                            </div><!-- end col -->
                        </div>
                        
                         <div class="row">
                            <div class="col-12">
                                <div class="card-box">
                                	<h2 class="header-title" style="padding-bottom:20px">Fulfilled order(s)</h2>
                                    <table class="table table-hover m-0 table-centered dt-responsive nowrap w-100" id="shipping-orders">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Store</th>
                                            <th>Created Date</th>
                                            <th>Customer</th>
                                            <th>Agent Name</th>
                                            <th>Tracking #</th>
                                            <th>Status</th>
                                            <th>Message</th>
                                            <th>View</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div><!-- end col -->
                        </div>
                        
                        <div class="row">
                            <div class="col-12">
                                <div class="card-box">
                                	<h2 class="header-title" style="padding-bottom:20px">Delivered order(s)</h2>
                                    <table class="table table-hover m-0 table-centered dt-responsive nowrap w-100" id="delivered-orders">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Store</th>
                                            <th>Created Date</th>
                                            <th>Customer</th>
                                            <th>Agent Name</th>
                                            <th>Tracking #</th>
                                            <th>Status</th>
                                            <th>Message</th>
                                            <th>View</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div><!-- end col -->
                        </div>
                        
                        <div class="row">
                            <div class="col-12">
                                <div class="card-box">
                                	<h2 class="header-title" style="padding-bottom:20px">Paid order(s)</h2>
                                    <table class="table table-hover m-0 table-centered dt-responsive nowrap w-100" id="paid-orders">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Store</th>
                                            <th>Created Date</th>
                                            <th>Customer</th>
                                            <th>Agent Name</th>
                                            <th>Tracking #</th>
                                            <th>Status</th>
                                            <th>Message</th>
                                            <th>View</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div><!-- end col -->
                        </div>
                        
                        <div class="row">
                            <div class="col-12">
                                <div class="card-box">
                                	<h2 class="header-title" style="padding-bottom:20px">Cancel Order(s)</h2>
                                    <table class="table table-hover m-0 table-centered dt-responsive nowrap w-100" id="cancel-orders">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Store</th>
                                            <th>Created Date</th>
                                            <th>Customer</th>
                                            <th>Status</th>
                                            <th>Agent Name</th>
                                            <th>View</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div><!-- end col -->
                        </div>
                    </div> <!-- container -->
                </div> <!-- content -->
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
                <%@ include file="orderdetails.jspf"%>
                <%@ include file="footer.jspf"%>
            </div>
        </div>
    	<%@ include file="scripts.jspf"%>
    	
    	<script>
    	
    	
		function downloadPS(id) {
    		location.href = 'admin/downloadps/' + id;
    	}
    	
    	
    	$(document).ready(function() {
    		
    		
    		$.fn.dataTable.ext.errMode = 'none';
    		
    		var confirmOrders = $("#confirm-orders").DataTable({
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
			 	responsive: true,
    	        bServerSide: true,
    	        bDestroy: true,
    	        bPaginate: true,
    	        bProcessing: true,
			 	columns:[
			 		{"data":"orderNumber"},
			 		{"data":"shopifyStoreUrl","render": function ( data, type, row ) {return data.replace('.myshopify.com','')}},
			 		{"data":"createdAt"},
			 		{"data":"customerName"},
			 		{"data":"processed","render": function(data,type,row) {return data.toUpperCase()}},
			 		{"data": "firstName"},
			 		{"data":"customerName", "bSortable": false ,"render": function ( data, type, row ) {
     	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#7c8a87!important"><a href="javascript:void(0)"  onClick="editOrder(' + row.id + ')"  class="edit"><i class="fe-eye avatar-title font-22 text-white"></i></a></div></div>';
                    }}
			 		],
                ajax: {"url": "admin/get-orders-for-datatable/Confirm","type":"POST", "contentType": "application/json","data": function(d) {
        	            return JSON.stringify(d);
        	    }}
			});
    		
    		var processingOrders = $("#processing-orders").DataTable({
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
			 	responsive: true,
    	        bServerSide: true,
    	        bDestroy: true,
    	        bPaginate: true,
    	        bProcessing: true,
			 	columns:[
			 		{"data":"orderNumber"},
			 		{"data":"shopifyStoreUrl","render": function ( data, type, row ) {return data.replace('.myshopify.com','')}},
			 		{"data":"createdAt"},
			 		{"data":"customerName"},
			 		{"data":"processed"},
			 		{"data": "firstName"},
			 		{"data":"customerName", "bSortable": false ,"render": function ( data, type, row ) {
			 			return '<div class="col-12"><div class="avatar-sm bg-success shadow-lg rounded"><a href="javascript:void(0)" onClick="downloadPS(\''+row.id+'\')" class="sms"><i class="fas fa-download avatar-title font-22 text-white"></i></a></div></div>';
                    }},
                    {"data":"customerName", "bSortable": false ,"render": function ( data, type, row ) {
     	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#7c8a87!important"><a href="javascript:void(0)"  onClick="editOrder(' + row.id + ')"  class="edit"><i class="fe-eye avatar-title font-22 text-white"></i></a></div></div>';
                    }}
			 		],
                ajax: {"url": "admin/get-orders-for-datatable/Processing","type":"POST", "contentType": "application/json","data": function(d) {
        	            return JSON.stringify(d);
        	    }}
			});
    		
			$("#processing-orders_filter").append('&nbsp;&nbsp;<button type="button" id="download-all-packing-slip" class="btn btn-danger waves-effect waves-light mb-2 mr-2"><i class="mdi mdi-basket mr-1"></i>Download All Packing Slip</button><button type="button" id="export-order-csv" class="btn btn-light waves-effect mb-2">Export Order CSV</button><button id="uploadButton" class="btn btn-light waves-effect mb-2 ml-2">Upload Tracking</button><form action="admin/upload-tracking-file" id="uploadTrackingCSV" method="POST" enctype="multipart/form-data"><input type="file" name="fileContent" id="fileContent" style="display:none"><input type="submit" id="upload" class="btn btn-light waves-effect mb-2 ml-2" value="Upload"/></form>');
    		
			$("#uploadButton").click(function(){
				$("#fileContent").click();
			});
    		
    		$("#download-all-packing-slip").click(function(){
    			location.href = 'admin/download-bulk-ps1';
    		});
    		$("#export-order-csv").click(function(){
    			location.href = 'admin/export-order-csv';
    		});
    		
    		var shippingOrders = $("#shipping-orders").DataTable({
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
			 	responsive: true,
    	        bServerSide: true,
    	        bDestroy: true,
    	        bPaginate: true,
    	        bProcessing: true,
			 	columns:[
			 		{"data":"orderNumber"},
			 		{"data":"shopifyStoreUrl","render": function ( data, type, row ) {return data.replace('.myshopify.com','')}},
			 		{"data":"createdAt"},
			 		{"data":"customerName"},
			 		{"data": "firstName"},
			 		{"data":"trackingNumber"},
			 		{"data":"shippingStatus","bSortable": false ,"render": function ( data, type, row ) {
			 			
			 			if(data == 'Departed' || data == 'Arrived' || data == 'On Delivery') {
			 				return '<a href="javascript:void(0)" "><span class="badge badge-blue badge-pill ml-2" style="font-size:90%">In Transit</span>';	
			 			} else if (data == 'On Return' || data == 'Returned') {
			 				return '<a href="javascript:void(0)" "><span class="badge badge-danger badge-pill ml-2" style="font-size:90%">Returned</span>';
			 			} else if(data == 'Delivered') {
			 				return '<a href="javascript:void(0)" "><span class="badge badge-green badge-pill ml-2"  style="font-size:90%">Delivered</span>';
			 			}  else if(data == 'On Hold') {
			 				return '<a href="javascript:void(0)" "><span class="badge badge-warning badge-pill ml-2"  style="font-size:90%">On Hold</span>';
			 			}
			 			
     	        		
                    }},
			 		{"data":"description"},
			 		{"data":"customerName", "bSortable": false ,"render": function ( data, type, row ) {
     	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#7c8a87!important"><a href="javascript:void(0)"  onClick="editOrder(' + row.id + ')"  class="edit"><i class="fe-eye avatar-title font-22 text-white"></i></a></div></div>';
                    }}
			 		],
                ajax: {"url": "admin/get-orders-for-datatable-shipping","type":"POST", "contentType": "application/json","data": function(d) {
        	            return JSON.stringify(d);
        	    }}
			});
    		var deliveredOrders = $("#delivered-orders").DataTable({
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
			 	responsive: true,
    	        bServerSide: true,
    	        bDestroy: true,
    	        bPaginate: true,
    	        bProcessing: true,
			 	columns:[
			 		{"data":"orderNumber"},
			 		{"data":"shopifyStoreUrl","render": function ( data, type, row ) {return data.replace('.myshopify.com','')}},
			 		{"data":"createdAt"},
			 		{"data":"customerName"},
			 		{"data": "firstName"},
			 		{"data":"trackingNumber"},
					{"data":"shippingStatus","bSortable": false ,"render": function ( data, type, row ) {
						return '<a href="javascript:void(0)" "><span class="badge badge-pill ml-2"  style="font-size:90%; background-color: green !important">Delivered</span>';     	        		
                    }},
			 		{"data":"description"},
			 		{"data":"customerName", "bSortable": false ,"render": function ( data, type, row ) {
     	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#7c8a87!important"><a href="javascript:void(0)"  onClick="editOrder(' + row.id + ')"  class="edit"><i class="fe-eye avatar-title font-22 text-white"></i></a></div></div>';
                    }}
			 		],
                ajax: {"url": "admin/get-orders-for-datatable-delivered","type":"POST", "contentType": "application/json","data": function(d) {
        	            return JSON.stringify(d);
        	    }}
			});
    		
    		$("#delivered-orders_filter").append('&nbsp;&nbsp;<button id="uploadDeliveredButton" class="btn btn-light waves-effect mb-2 ml-2">Upload Tracking</button><form action="admin/upload-delivered-file" id="uploadDeliveredCSV" method="POST" enctype="multipart/form-data"><input type="file" name="deliveredFileContent" id="deliveredFileContent" style="display:none"><input type="submit" id="deliveredUpload" class="btn btn-light waves-effect mb-2 ml-2" value="Upload"/></form>');
    		
    		$("#uploadDeliveredButton").click(function(){
				$("#deliveredFileContent").click();
			});
    		var paidOrders = $("#paid-orders").DataTable({
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
			 	responsive: true,
    	        bServerSide: true,
    	        bDestroy: true,
    	        bPaginate: true,
    	        bProcessing: true,
			 	columns:[
			 		{"data":"orderNumber"},
			 		{"data":"shopifyStoreUrl","render": function ( data, type, row ) {return data.replace('.myshopify.com','')}},
			 		{"data":"createdAt"},
			 		{"data":"customerName"},
			 		{"data": "firstName"},
			 		{"data":"trackingNumber"},
			 		{"data":"shippingStatus","bSortable": false ,"render": function ( data, type, row ) {
						return '<a href="javascript:void(0)" "><span class="badge badge-pill ml-2"  style="font-size:90%; background-color: green !important">Paid</span>';     	        		
                    }},
			 		{"data":"description"},
			 		{"data":"customerName", "bSortable": false ,"render": function ( data, type, row ) {
     	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#7c8a87!important"><a href="javascript:void(0)"  onClick="editOrder(' + row.id + ')"  class="edit"><i class="fe-eye avatar-title font-22 text-white"></i></a></div></div>';
                    }}
			 		],
                ajax: {"url": "admin/get-orders-for-datatable-paid","type":"POST", "contentType": "application/json","data": function(d) {
        	            return JSON.stringify(d);
        	    }}
			});
    		
    		var cancelOrders = $("#cancel-orders").DataTable({
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
			 	responsive: true,
    	        bServerSide: true,
    	        bDestroy: true,
    	        bPaginate: true,
    	        bProcessing: true,
			 	columns:[
			 		{"data":"orderNumber"},
			 		{"data":"shopifyStoreUrl","render": function ( data, type, row ) {return data.replace('.myshopify.com','')}},
			 		{"data":"createdAt"},
			 		{"data":"customerName"},
			 		{"data":"processed", "render": function(data,type,row) {return data.toUpperCase()}},
			 		{"data": "firstName"},
			 		{"data":"customerName", "bSortable": false ,"render": function ( data, type, row ) {
     	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#7c8a87!important"><a href="javascript:void(0)"  onClick="editOrder(' + row.id + ')"  class="edit"><i class="fe-eye avatar-title font-22 text-white"></i></a></div></div>';
                    }}
			 		],
                ajax: {"url": "admin/get-orders-for-datatable/Cancelled","type":"POST", "contentType": "application/json","data": function(d) {
        	            return JSON.stringify(d);
        	    }}
			});
	    	
        	
    		var t = $('#order-listing').DataTable({
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
    	        "columns":[{"data":"shopifyStoreUrl","render": function ( data, type, row ) {
    	        			return data.replace('.myshopify.com','')}
		    	        	},
		    	        {"data":"orderNumber"},
		    	        {"data":"createdAt"},
		    	        {"data":"customerName"},
		    	        {"data":"financialStatus"},
		    	        {"data":"fulfillmentStatus"},
		    	        {"data":"totalLineItemsPrice"},
		    	        {"data":"agentName"},
		    	        {"data":"customerName", "bSortable": false ,"render": function ( data, type, row ) {
	     	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#7c8a87!important"><a href="javascript:void(0)"  onClick="editOrder(' + row.id + ')"  class="edit"><i class="fe-eye avatar-title font-22 text-white"></i></a></div></div>';
	                    }}],
    	        "responsive": true,
    	        "bServerSide": true,
    	        "bDestroy": true,
    	        "bPaginate": true,
    	        "bProcessing": true,
    	        "ajax": {"url": "admin/get-orders-for-datatable","type":"POST", "contentType": "application/json","data": function(d) {
    	            return JSON.stringify(d);
    	        	}
    	        }
    	    });
    		
    		
    		$('#mark-shipping').on('click',function(){
    			$.ajax({
       	  	      type: 'POST',
       	  	      url: "admin/ship-order",
       	  	      dataType: "json",
       	  	  	  success: function(resp) {
		       	  	  	 $.toast({ 
		    	  	    	  heading: 'Success',
		    	  	    	  text : resp, 
		    	  	    	  icon : 'success',
		    	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
		    	  	    	  hideAfter: 5000,
		    	  	    	  position: 'top-right',
		    	  	    	});
		            	 shippingOrders.ajax.reload();
		            	 processingOrders.ajax.reload();
       	  	  		}
     			});
    		});
    		
    		setInterval( function () {
    			t.ajax.reload();
    			cancelOrders.ajax.reload();
    			shippingOrders.ajax.reload();
    			processingOrders.ajax.reload();
    			confirmOrders.ajax.reload();
    		}, 30000 );
    		
    	});

    	
    	function editOrder(orderid){
				console.log(orderid);
				$('#orderid').val(orderid);
      			$('#shippingOrderid').val(orderid);
      			$('#customerOrderid').val(orderid);
				$.ajax({
         	  	      type: 'GET',
         	  	      url: "admin/get-order-details/"+orderid,
         	  	      dataType: "json",
         	  	  	  success: function(resultData) {
         	  	  		$('#lblOrderNumber').text(resultData.orderNumber);
         	  	  		$('#textcustomername').val(resultData.customerName);
         	  	  		$('#textphone').val(resultData.customerPhone);
         	  	  		$('#textemail').val(resultData.customerEmail);
         	  	  		$('#textcompany').val(resultData.company);
         	  	  		$('#textfullname').val(resultData.firstName + ' ' + resultData.lastName);
         	  	  		$('#textaddress1').val(resultData.address1);
         	  	  		$('#textaddress2').val(resultData.address2);
         	  	  		$('#textcity').val(resultData.city);
         	  	  		$('#textprovince').val(resultData.province);
         	  	  		$('#textzip').val(resultData.zip);
         	  	  		$('#textcountry').val(resultData.country);
         	  	  		$('#lblOrderDate').text(resultData.orderDate);
         	  	  		$('#textordervalue').val(resultData.orderValue);
         	  	  		$('#textdiscount').val(resultData.totalDiscounts);
         	  	  		$('#textshipping').val(resultData.shippingCosts);
         	  	  		
         	  	  		displayOrderItem(resultData);
         	  	  		$('#btn-add-items').attr("disabled", false);
         	  	  		$('#orderdetailsModal').modal('toggle');
         	  	  			
         	  	  		}
       			});
			
		}
    	
		function displayOrderItem(resultData){
    		
    		var html='';
    		var orderValue = 0;
    			$.each(resultData.items,function(key,val){
	  	  			  var totalPrice = parseInt(val.quantity) * parseFloat(val.price);
	  	  			  orderValue += totalPrice;
	  	  			 
	  	  			html += '<tr>' +
	  	  				 + '    <td>'+ val.id + '</td>'
	  	  				 + '    <td>'+ val.id + '</td>';
	  	  				 if(val.variantTitle) {
	  	  					html += '	<td>'+ val.title + '[ ' + val.variantTitle + ' ]' + '</td>';	 
	  	  				 } else {
	  	  					html +=  '	<td>'+ val.title + '</td>';
	  	  				 }
	  	  				 
	  	  				 html += '	<td>'+ val.quantity +'</td>'
                	  	 + '	<td>'+ val.price +'</td>'
                	 	 + '	<td>'+ totalPrice.toFixed(2) +'</td>'
	  	  			  	 + '</tr>';  
	  	  				
	  	  		  });
	  	  			$('#orderItems tbody').html('');
	  	  			$('#orderItems tbody').html(html);
	  	  			$('#orderItems').DataTable();
	  	  			$('#textordervalue').val(orderValue);
	  	  			calculateTotal();
    	}
    	
		function calculateTotal(){
			
			if($('#textordervalue').val() == ""){
				$('#textordervalue').val(0);
			}
			if($('#textdiscount').val() == ""){
				$('#textdiscount').val(0);
			}
			if($('#textshipping').val() == ""){
				$('#textshipping').val(0);
			}
			var ordervalue = parseFloat($('#textordervalue').val());
			var discount = parseFloat($('#textdiscount').val()); 
			var shipping = parseFloat($('#textshipping').val());
			    			
			var total = ordervalue - discount + shipping;
			$('#textfinaltotal').val(total.toFixed(2));
		}
    	
    </script>
    	
    </body>
</html>