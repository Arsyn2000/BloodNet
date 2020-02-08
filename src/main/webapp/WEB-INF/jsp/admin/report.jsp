<!DOCTYPE html>
<html lang="en">
 <head>

        <!-- Plugins css -->
        <link href="${pageContext.request.contextPath}/assets/libs/jquery-nice-select/nice-select.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/libs/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/libs/multiselect/multi-select.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/libs/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/libs/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />

    </head>
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
                                            <li class="breadcrumb-item active">Reports</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">Reports</h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title -->
					
					<div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                               <p class="mb-1 font-weight-bold text-muted">Range Date & Time</p>
                                               <input type="text" name="datepicker" id="datepicker" class="form-control" placeholder="Date and Time">
                                            </div> <!-- end col -->

                                            <div class="col-md-4">
                                                <p class="mb-1 font-weight-bold text-muted mt-3 mt-md-0">Shopify Order Status</p>
												<select class="form-control select2-multiple" name="example-multiselect" id="example-multiselect" data-toggle="select2" multiple="multiple" data-placeholder="Choose ...">
                                                    <option value="Shipping">Shipping</option>
													<option value="Cancelled">Cancelled</option>
													<option value="Upsell Cancelled">Upsell Cancelled</option>
													<option value="new">New</option>
													<option value="Confirm">Confirm</option>
													<option value="Upsell">Upsell</option>
                                                </select>
                                            </div> <!-- end col -->
                                            
                                            <div class="col-md-4">
                                               <p class="mb-1 font-weight-bold text-muted mt-3 mt-md-0">Search </p>
                                               <button type="button" id="searchOrder" class="btn btn-light waves-effect mb-2">Search</button>
                                               <button type="button" id="export-report-order-csv" class="btn btn-light waves-effect mb-2">Export Order CSV</button>
                                            </div>
                                        </div> <!-- end row -->

                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col-->
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
                    </div> <!-- container -->
                </div> <!-- content -->
                
                <%@ include file="orderdetails.jspf"%>
                <%@ include file="footer.jspf"%>
            </div>
        </div>
    	<%@ include file="scripts.jspf"%>
        <script src="${pageContext.request.contextPath}/assets/js/pages/form-advanced.init.js"></script>
    	
    	<!-- Plugins js-->
        <script src="${pageContext.request.contextPath}/assets/libs/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/libs/clockpicker/bootstrap-clockpicker.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/libs/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    	<script src="${pageContext.request.contextPath}/assets/js/pages/form-pickers.init.js"></script>
    	 
    	<script src="${pageContext.request.contextPath}/assets/libs/jquery-nice-select/jquery.nice-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/libs/switchery/switchery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/libs/jquery-mockjax/jquery.mockjax.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/libs/autocomplete/jquery.autocomplete.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/libs/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
        

    	<script>
			
	    	$("#export-report-order-csv").click(function(){
	    		var datetime = $("#datepicker").val();
				var status = $("#example-multiselect").val();
				if(datetime!="" && status!="") {
					location.href = 'export-report-order-csv/'+datetime+'/'+status;
				}
			});
			
			flatpickr("#datepicker", {
				
			    dateFormat: "Y-m-d",
			    mode: "range"
			});
			
			$("#searchOrder").click(function(){
			
				var datetime = $("#datepicker").val();
				var status = $("#example-multiselect").val();
				
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
	                ajax: {"url": "admin/getShopifyOrderReportsByStatus/"+datetime+"/"+status,"type":"POST", "contentType": "application/json","data": function(d) {
	        	            return JSON.stringify(d);
	        	    }}
				});
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