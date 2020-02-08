<!DOCTYPE html>
<%@page import="com.taim.conduire.common.CommonHelper"%>
<html lang="en">
    <%@ include file="head.jspf"%>
    <style>
		#new-orders tbody tr.selected {
    			    background-color: #eeeeee;
    			}
    			
    	#new-orders tbody tr.selected td{
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
                        
                        
                        <div class="row" style="padding-top:18px">
                            <div class="col-md-3">
                                <div class="widget-rounded-circle card-box">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="avatar-lg rounded-circle shadow-lg bg-primary border-primary border">
                                                <i class="fe-heart font-22 avatar-title text-white"></i>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="text-right">
                                                <h3 class="text-dark mt-1"><span><label id="upsellcount"></label></span></h3>
                                                <p class="text-muted mb-1">Today's Upsell count</p>
                                            </div>
                                        </div>
                                    </div> <!-- end row-->
                                </div> <!-- end widget-rounded-circle-->
                            </div> <!-- end col-->

                            <div class="col-md-3">
                                <div class="widget-rounded-circle card-box">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="avatar-lg rounded-circle bg-warning">
                                                <i class="fe-phone font-22 avatar-title text-white"></i>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="text-right">
                                                <h3 class="text-dark mt-1"><span><label id="neworderscount"></label></span></h3>
                                                <p class="text-muted mb-1">Total Orders To Call</p>
                                            </div>
                                        </div>
                                    </div> <!-- end row-->
                                </div> <!-- end widget-rounded-circle-->
                            </div> <!-- end col-->

                            <div class="col-md-3">
                                <div class="widget-rounded-circle card-box">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="avatar-lg rounded-circle bg-success">
                                                <i class="fe-check-circle font-22 avatar-title text-white"></i>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="text-right">
                                                <h3 class="text-dark mt-1"><span"><label id="confirmcount"></label></span></h3>
                                                <p class="text-muted mb-1">Total Confirmed Orders</p>
                                            </div>
                                        </div>
                                    </div> <!-- end row-->
                                </div> <!-- end widget-rounded-circle-->
                            </div> <!-- end col-->

                            <div class="col-md-3">
                                <div class="widget-rounded-circle card-box">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="avatar-lg rounded-circle bg-danger">
                                                <i class="mdi font-22 avatar-title text-white">&#8369;</i>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="text-right">
                                                <h3 class="text-dark mt-1"><span><label id="commission"></label></span></h3>
                                                <p class="text-muted mb-1">Monthly Commission</p>
                                            </div>
                                        </div>
                                    </div> <!-- end row-->
                                </div> <!-- end widget-rounded-circle-->
                            </div> <!-- end col-->
                        </div>
                        <!-- end row -->
						<div class="row" style="padding-top:18px;">
                            <div class="col-12">
                                <div class="card-box">
                                	<h2 class="header-title" style="padding-bottom:20px">New Order(s)</h2>
                                	
                                    <table class="table table-hover m-0 table-centered dt-responsive nowrap w-100" id="new-orders">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Store</th>
                                            <th>Customer</th>
                                            <th>Total</th>
                                            <th>Status</th>
                                            <th>Call</th>
                                            <th>SMS</th>
                                            <th>Notes</th>
                                            <th>Edit</th>
                                            <th>Tag</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        

                                        </tbody>
                                    </table>
                                </div>
                            </div><!-- end col -->
                        </div>
                        <!-- end row -->
                        
                        
                        <div class="row">
                            <div class="col-12">
                                <div class="card-box">
                                	<h2 class="header-title" style="padding-bottom:20px">Confirm/Upsell Order(s)</h2>
                                    <table class="table table-hover m-0 table-centered dt-responsive nowrap w-100" id="confirm-orders">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Store</th>
                                            <th>Customer</th>
                                            <th>Total</th>
                                            <th>Status</th>
                                            <th>Call</th>
                                            <th>SMS</th>
                                            <th>Notes</th>
                                            <th>Edit</th>
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
                                            <th>Customer</th>
                                            <th>Total</th>
                                            <th>Status</th>
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
                
                <!--  TOAST
                <div class="toast fade" role="alert" aria-live="assertive" aria-atomic="true"  data-autohide="true" style="position: absolute; top: 12%; right: 1%;z-index:-1" >
					  <div class="toast-header">
					    <strong class="mr-auto text-primary">Agents</strong>
					    <small class="text-muted"></small>
					    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
					  </div>
					  <div class="toast-body">
					    Some text inside the toast body
					  </div>
				</div>-->
                <!--  TOAST END -->
                
                <%@ include file="addnotes.jspf"%>
                <%@ include file="smscentre.jspf"%>
                <%@ include file="orderdetails.jspf"%>
                <%@ include file="createorder.jspf"%>
                <%@ include file="selectstore.jspf"%>
                <%@ include file="footer.jspf"%>
            </div>
        </div>
    	<%@ include file="scripts.jspf"%>    
    	<script src="${pageContext.request.contextPath}/assets/js/pages/jquery.validate.min.js"></script>
    	<script src="${pageContext.request.contextPath}/assets/js/pages/jquery-form.min.js"></script>
    	<script src="${pageContext.request.contextPath}/assets/libs/select2/select2.min.js"></script>
    	<script src="${pageContext.request.contextPath}/assets/libs/sweetalert2/sweetalert2.min.js"></script>
    	<script>
    	
    		function hookUpsellClik(){
    			console.log("hookUpsellClik");
    			var html='';
    			$('#btn-add-items').on('click',function(){
				$.ajax({
           	  	      type: 'GET',
           	  	      url: "agent/get-product?orderId="+ $('#orderid').val(),
           	  	      success: function(resultData) {
           	  	  		html = '<select class="form-control" id="ddproduct" name="ddproduct">';
           	  	  		html +='<option>Select</option>';
           	  	  		$.each(resultData,function(key,val){
           	  	  			html += '<option value="'+ val + '">' + key + '</option>';
		  	  	  		  });
           	  	  			html += '</select>';
           	  	  			$("#orderItems tbody").append(
	          				      '<tr>'
	          				      	+'<td>New Item details </td>' 
	          				      	+'<td>'+ html +'</td>' 
	          				        +'<td><input class="form-control form-control-sm"  type="text" placeholder="Quantity" id="quantity">'  
	          				        +'<input type="hidden" id="title" name="title"><input type="hidden" id="variantId" name="variantId"><input type="hidden" id="productId" name="productId"></td>' 
	          				        +'<td colspan="2"><input class="form-control form-control-sm"  type="text" placeholder="Unit Price" id="price" ></td>'
	          				        
	          				     	+'<td><div class="row">'
	          				     	+	'<div class="col-6"><div class="avatar-sm bg-success rounded"><a href="" class="save"><i class="mdi mdi-content-save avatar-title font-22 text-white"></i></a></div></div>'
	          				     	+	'<div class="col-6"><div class="avatar-sm bg-secondary rounded"><a href="" class="remove"><i class="mdi mdi-trash-can avatar-title font-22 text-white"></i></a></div></div>'
	          				        
	          				        +'</div></td>'
	          				      +'</tr>'
	          				  );
	          				$('#ddproduct').select2();
	          				hookSelect2Select();
	          				$('#btn-add-items').attr("disabled", true);
	          			}
           	  		});
         		});	
    			
    			console.log("leave hookUpsellClik");
    		}
    	
    		
    	function hookSelect2Select(){
    		$('#ddproduct').on('select2:select', function (e) {
	        	    var data = e.params.data;
	        	    var res = data.id.split("|");
	        	    $('#productId').val(res[0]);
	        	    $('#price').val(res[1]);
	        	    $('#variantId').val(res[2]);
	        	    $('#title').val(data.text);
	        	});
    	}
    	
    	
    	function getTileValues(){
    		$.ajax({
    	  	      type: 'GET',
    	  	      url: 'agent/get-tile-values',
    	  	      success: function(resultData) {
    	  	    	  $('#upsellcount').text(resultData.upSellCount);
    	  	    	  $('#neworderscount').text(resultData.newOrdersCount);
    	  	    	  $('#confirmcount').text(resultData.confirmCount);
    	  	    	  $('#commission').text(resultData.commission);
    	    	  }
    		});
    	}
    	
    	function showModal(){
    		
    		$.ajax({
  	  	      type: 'GET',
  	  	      url: 'agent/get-agent-store',
  	  	      success: function(resultData) {
  	  	    	html = '<select class="form-control" id="ddstore" name="ddstore">';
   	  	  		html +='<option value="">Select</option>';
   	  	  		$.each(resultData,function(key,val){
   	  	  			var storename = val.shopifyStoreUrl;
   	  	  			storename = storename.replace('.myshopify.com','');
   	  	  			html += '<option value="'+ val.storeId + '">' + storename + '</option>';
  	  	  		  });
   	  	  			html += '</select>';
  	  	    	  $('#storeSelect').html(html);
  	  	    	  $('#selectStoreModal').modal('toggle');
  	  	  	  }
  		});
    		
    	}
    	$(document).ready(function(){
    		hookUpsellClik();
    		hookbtnSave();
    		getTileValues();
    		
    		//$(document).on('click','input[type=text]',function(){ this.select(); });
    		
    		$(".modal").on('hidden.bs.modal', function () {
    		    $(this).data('bs.modal', null);
    		});
    		
    		
    		var newOrders = $("#new-orders").DataTable({
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
    			 		{"data":"customerName"},
    			 		{"data":"totalPrice"},
    			 		{"data":"processed","render": function(data,type,row) {return data.toUpperCase()}},
    			 		{"data":"phone", "bSortable": false ,"render": function ( data, type, row ) {
    			 			return '<div class=""><div class="avatar-sm bg-success shadow-lg rounded"><a href="agent/xlite?dest='+ data + '"><i class="icon-call-out avatar-title font-22 text-white"></i></a></div></div>';
                        }},
                        {"data":"newSms", "bSortable": false ,"render": function ( data, type, row ) {
                        	if(data == "receive"){
                        		return '<div class=""><div class="avatar-sm bg-danger shadow-lg rounded"><a href="javascript:void(0)" onClick="showSMS('+row.id+')" class="sms"><i class="fas fa-envelope-open-text avatar-title font-22 text-white"></i></a></div></div>'; 
                        	}else if(data == "sent"){
                        		return '<div class=""><div class="avatar-sm bg-warning shadow-lg rounded"><a href="javascript:void(0)" onClick="showSMS('+row.id+')" class="sms"><i class="fas fa-envelope avatar-title font-22 text-white"></i></a></div></div>';	
                        	}else{
                        		return '<div class=""><div class="avatar-sm bg-success shadow-lg rounded"><a href="javascript:void(0)" onClick="showSMS('+row.id+')" class="sms"><i class="fas fa-envelope avatar-title font-22 text-white"></i></a></div></div>';
                        	}
                        }},
    			 		{"data":"customerName", "bSortable": false ,"render": function ( data, type, row ) {
         	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded"><a href="javascript:void(0)" onClick="showNotes('+row.id+')" class="notes"><i class=" dripicons-checklist avatar-title font-22 text-white"></i></a></div></div>';
                        }},
                        {"data":"customerName", "bSortable": false ,"render": function ( data, type, row ) {
         	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#7c8a87!important"><a href="javascript:void(0)"  onClick="editOrder(1,' + row.id + ')"  class="edit"><i class="fe-edit-1 avatar-title font-22 text-white"></i></a></div></div>';
                        }},
                        {"data":"tags", "bSortable": false ,"render": function ( data, type, row ) {
                        	var html='';
                        	if(data != undefined && data.includes('Redial')){
                        		html = '<a href="javascript:void(0)" onClick="toggle(0,'+ row.id +')"><span class="badge badge-danger badge-pill" id="0-' + row.id + '" style="font-size:90%">Redial</span></a>';	
                        	}else{
                        		html = '<a href="javascript:void(0)" onClick="toggle(0,'+ row.id +')"><span class="badge badge-secondary badge-pill" id="0-' + row.id + '" style="font-size:90%">Redial</span></a>';
                        	}
                        	if(data != undefined && data.includes('Unreachable')){
                        		html += '<a href="javascript:void(0)" onClick="toggle(1,'+ row.id +')"><span class="badge badge-warning badge-pill ml-2" id="1-' + row.id + '" style="font-size:90%">Unreachable</span>'; 
                        	}else{
                        		html += '<a href="javascript:void(0)" onClick="toggle(1,'+ row.id +')"><span class="badge badge-secondary badge-pill ml-2" id="1-' + row.id + '" style="font-size:90%">Unreachable</span>';
                        	}
                        	return html;
                        }}],
                        columnDefs: [
                            {
                                render: function (data, type, full, meta) {
                                    return "<div style='white-space:normal;width:150px'>" + data + "</div>";
                                },
                                targets: 0
                            }
                         ],
                    ajax: {"url": "agent/get-orders-for-datatable/new","type":"POST", "contentType": "application/json","data": function(d) {
            	            return JSON.stringify(d);
            	    }}
    			});
    		
    		$("#new-orders_filter").append('&nbsp;&nbsp;<button type="button" id="create-new-order" class="btn btn-success waves-effect waves-light mb-2 mr-2" onClick="showModal()"><i class="fas fa-cart-plus mr-1"></i>Create New Order</button>');
    		
    		
    		
    		
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
			 		{"data":"customerName"},
			 		{"data":"totalPrice"},
			 		{"data":"processed","render": function(data,type,row) {return data.toUpperCase()}},
			 		{"data":"phone", "bSortable": false ,"render": function ( data, type, row ) {
			 			return '<div class=""><div class="avatar-sm bg-success shadow-lg rounded"><a href="agent/xlite?dest='+ data + '"><i class="icon-call-out avatar-title font-22 text-white"></i></a></div></div>';
                    }},
                    {"data":"newSms", "bSortable": false ,"render": function ( data, type, row ) {
                    	if(data == "receive"){
                    		return '<div class=""><div class="avatar-sm bg-danger shadow-lg rounded"><a href="javascript:void(0)" onClick="showSMS('+row.id+')" class="sms"><i class="fas fa-envelope-open-text avatar-title font-22 text-white"></i></a></div></div>'; 
                    	}else if(data == "sent"){
                    		return '<div class=""><div class="avatar-sm bg-warning shadow-lg rounded"><a href="javascript:void(0)" onClick="showSMS('+row.id+')" class="sms"><i class="fas fa-envelope avatar-title font-22 text-white"></i></a></div></div>';	
                    	}else{
                    		return '<div class=""><div class="avatar-sm bg-success shadow-lg rounded"><a href="javascript:void(0)" onClick="showSMS('+row.id+')" class="sms"><i class="fas fa-envelope avatar-title font-22 text-white"></i></a></div></div>';
                    	}
                    }},
			 		{"data":"customerName", "bSortable": false ,"render": function ( data, type, row ) {
     	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded"><a href="javascript:void(0)" onClick="showNotes('+row.id+')" class="notes"><i class=" dripicons-checklist avatar-title font-22 text-white"></i></a></div></div>';
                    }},
                    {"data":"customerName", "bSortable": false ,"render": function ( data, type, row ) {
     	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#7c8a87!important"><a href="javascript:void(0)"  onClick="editOrder(2,' + row.id + ')" class="edit"><i class="fe-edit-1 avatar-title font-22 text-white"></i></a></div></div>';
                    }}
			 		],
                ajax: {"url": "agent/get-orders-for-datatable/Confirm","type":"POST", "contentType": "application/json","data": function(d) {
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
			 		{"data":"customerName"},
			 		{"data":"totalPrice"},
			 		{"data":"processed", "render": function(data,type,row) {return data.toUpperCase()}},
			 		],
                ajax: {"url": "agent/get-orders-for-datatable/Cancelled","type":"POST", "contentType": "application/json","data": function(d) {
        	            return JSON.stringify(d);
        	    }}
			});
	 		
    		setInterval( function () {
    			newOrders.ajax.reload();
    			confirmOrders.ajax.reload();
    			cancelOrders.ajax.reload();
    			getTileValues();
    		}, 30000 );
    		
    		
    		$('#orderItems').DataTable({
	  				"info":false,
	  				"bPaginate": true,
	  				 "ordering": false,
	  				 "lengthChange":false,
	  				 "searching":false,
	  				columnDefs: [
	  		            { width: 100, targets: 0 }
	  		        ],
	  		      fixedColumns: true
    		});
    		
    			$('#customerDetailsform').validate({
    				onfocusout: false,
                	rules: {
                		textcustomername: "required",
                		textphone: "required"
    	             },
                  messages: {
                	  textcustomername: "This field is required",
                	  textphone:"This field is required"
                  },
                  errorPlacement: function(label, element) {
                    label.addClass('mt-2 text-danger');
                    label.insertAfter(element);
                  },
                 submitHandler: function(form) {
                	 $(form).ajaxSubmit(function(resp) {
                			 $.toast({ 
    	    	  	    	  heading: 'Success',
    	    	  	    	  text : resp, 
    	    	  	    	  icon : 'success',
    	    	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
    	    	  	    	  hideAfter: 5000,
    	    	  	    	  position: 'top-right',
    	    	  	    	});
             		}); 
                 }
    			});
    		
    			$("#shippingAddressform").validate({
                	onfocusout: false,
                	rules: {
                		textfullname: "required",
                		textaddress1: "required",
                		textcity: "required",
                		textprovince: "required",
                		textzip: "required",
                		textcountry: "required"
    	             },
                  messages: {
                	  textfullname: "This field is required",
                	  textaddress1:"This field is required",
                	  textcity: "This field is required",
                	  textprovince: "This field is required",
                	  textzip: "This field is required",
                	  textcountry: "This field is required"
                  },
                  errorPlacement: function(label, element) {
                    label.addClass('mt-2 text-danger');
                    label.insertAfter(element);
                  },
                 submitHandler: function(form) {
                	 $(form).ajaxSubmit(function(resp) {
                		 $.toast({ 
 	    	  	    	  heading: 'Success',
 	    	  	    	  text : resp, 
 	    	  	    	  icon : 'success',
 	    	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
 	    	  	    	  hideAfter: 5000,
 	    	  	    	  position: 'top-right',
 	    	  	    	});
             		}); 
                 }
         });
    		
    			
    			$("#newCustomerDetailsform").validate({
                	onfocusout: false,
                	rules: {
                		newtextcustomername: "required",
                		newtextphone: "required",
                		newtextcompany: "required",
                		newtextfullname: "required",
                		newtextaddress1: "required",
                		newtextcity: "required",
                		newtextzip: "required"
                	},
                  messages: {
                	  newtextcustomername: "This field is required",
                	  newtextphone: "This field is required",
                	  newtextcompany: "This field is required",
                	  newtextfullname:"This field is required",
                	  newtextaddress1: "This field is required",
                	  newtextcity: "This field is required",
                	  newtextzip: "This field is required"
                	},
                  errorPlacement: function(label, element) {
                    label.addClass('mt-2 text-danger');
                    label.insertAfter(element);
                  },
                 submitHandler: function(form) {
                	 $(form).ajaxSubmit(function(resp) {
                		 newOrders.ajax.reload();
                		 $('#createOrderModal').modal('toggle');
                		 editOrder(1,resp);
             		}); 
                 }
         });		
    			
    		$("#addnotesform").validate({
	                  onfocusout: false,
	                  rules: {
	                    	notes: "required"
	    	             },
	                  messages: {
	                    notes: "Please enter some note"
	                  },
	                  errorPlacement: function(label, element) {
	                    label.addClass('mt-2 text-danger');
	                    label.insertAfter(element);
	                  },
	                  submitHandler: function(form) {
	                	 $(form).ajaxSubmit(function(resp) {
	                		 $.toast({ 
	    	    	  	    	  heading: 'Success',
	    	    	  	    	  text : resp, 
	    	    	  	    	  icon : 'success',
	    	    	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
	    	    	  	    	  hideAfter: 5000,
	    	    	  	    	  position: 'top-right',
	    	    	  	    	});
	                		 $('#exampleModal').modal('toggle');	
	             		}); 
	                 }
             });
    		
   			$("#smslogform").validate({
               	onfocusout: false,
               	rules: {
               		smscontent: "required"
   	             },
                 messages: {
                	 smscontent: "Please enter message"
                 },
                 errorPlacement: function(label, element) {
                   label.addClass('mt-2 text-danger');
                   label.insertAfter(element);
                 },
                submitHandler: function(form) {
	               	 $(form).ajaxSubmit(function(val) {
	               		html+=	'<li class="clearfix odd">'
  	  						+			'<div class="chat-avatar"  style="width:67px !important">'
  	  						+				'<i class=" mdi mdi-account-circle avatar-title bg-danger avatar-lg rounded-circle" style="font-size:28px"></i>'
  	  			  			+				'<i style="font-size:10px">'+ val.smsDate +'</i>'
		                    +			'</div>'
		                    + 		'<div class="conversation-text">'
		                    + 			'<div class="ctext-wrap">'
		                    +					'<i>' + val.agentName + '</i>'
		                    +					'<p>'
		                    +						val.content
		                    +          		'</p>'
		                    +      		'</div>'
		                    +			'</div>'
		                    +		'</li>';
		                    
		                    $('.conversation-list').append(html);
		                    $('.conversation-list').animate({scrollTop: $('.conversation-list').prop("scrollHeight")}, 500);
	            	 }); 
                }
         	});
			
   			$("#selectStoreForm").validate({
            	onfocusout: false,
            	rules: {
            		ddstore: "required"
	             },
              messages: {
            	  ddstore: "Please select store"
            	},
              errorPlacement: function(label, element) {
                label.addClass('mt-2 text-danger');
                label.insertAfter(element);
              },
             submitHandler: function(form) {
            	 $(form).ajaxSubmit(function(resp) {
            		 $('#selectStoreModal').modal('toggle');
            		 $('#createOrderModalLabel').html('New Order Id : ' + resp.orderNumber);
            		 $('#newOrderId').val(resp.orderId);
            		 $('#newOrderNumber').val(resp.orderNumber);
            		 $('#createOrderStoreId').val(resp.storeId);
            		 $('#newCustomerDetailsform').trigger("reset");
                	 $('#createOrderModal').modal('toggle');
         		}); 
             }
     });
   			
   			
   			
			$('#btn-confirm').on('click',function(){
				confirmUpsellOrder('confirm');
			});
			
			
			$('#btn-upsell').on('click',function(){
				confirmUpsellOrder('upsell');
			});
			
			$('#btn-new').on('click',function(){
				confirmUpsellOrder('new');
			});
			
			
			function confirmUpsellOrder(type){
				var orderid = $('#orderid').val();
				var ordervalue = $('#textordervalue').val();
				var discount = $('#textdiscount').val();
				var shipping = $('#textshipping').val();
				var total = $('#textfinaltotal').val();
				$.ajax({
       	  	      type: 'POST',
       	  	      url: "agent/confirm-upsell-order/"+orderid +'?ordervalue=' + ordervalue + '&discount=' + discount +'&shipping=' + shipping + '&total=' + total + '&type=' + type,
       	  	      success: function(resp) {
       	  	     	 $('#orderdetailsModal').modal('toggle'); 
		       	  	    $.toast({ 
		   	  	    	  heading: 'Success',
		   	  	    	  text : resp, 
		   	  	    	  icon : 'success',
		   	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
		   	  	    	  hideAfter: 5000,
		   	  	    	  position: 'top-right',
		   	  	    	});
                	 newOrders.ajax.reload();
                	 confirmOrders.ajax.reload();
                	 cancelOrders.ajax.reload();
                	 getTileValues();
       	  	  		}
     			});
			}
			
			$('#btn-cancel').on('click',function(){
				
				Swal.fire({
					  title: "Are you sure?",
					  text: "Once canceled, order will not be recovered!",
					  type: "warning",
					  showCancelButton: true
					})
					.then((result) => {
					  if (result.value) {
						  var orderid = $('#orderid').val();
							$.ajax({
			       	  	      type: 'POST',
			       	  	      url: "agent/cancel-order/"+orderid,
			       	  	      success: function(resp) {
			       	  	  		 $('#orderdetailsModal').modal('toggle');
			       	  	   		 cancelOrders.ajax.reload();
			                	 newOrders.ajax.reload();
			                	 confirmOrders.ajax.reload();
			                	 getTileValues();
			                	 swal(resp, {
								      icon: "success",
								    });
			       	  	  		}
			     		  });
					  } else{
						  
					  }
				});
			});
			
			
			$('#orderItems').on('click','a.remove',function(e){
				e.preventDefault();
				$('#orderItems tr:last').remove();
				$('#btn-add-items').attr("disabled", false);
			});
			
			$('#textordervalue').on('change',function(){
				calculateTotal();
			});
			
			$('#textdiscount').on('change',function(){
				calculateTotal();
			});
			
			$('#textshipping').on('change',function(){
				calculateTotal();
			});
			
    	});
    	//End of document.ready
    	
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
	  	  			hookTabledit();
	  	  			calculateTotal();
	  	  			console.log(orderValue);
	  	  			
	  	  			if(orderValue == 0){
	  	  				$('#btn-confirm').attr("disabled",true);
	  	  				$('#btn-upsell').attr("disabled",true);
	  	  			}else{
		  	  			$('#btn-confirm').attr("disabled",false);
	  	  				$('#btn-upsell').attr("disabled",false);
	  	  			}
	  	  			//updateOrderValue(orderValue);
	  	  			
    	}
    	
    	function updateOrderValue(orderValue){
    		var orderid = $('#orderid').val();
    		$.ajax({
    	  	      type: 'POST',
    	  	      url: "agent/update-order-value/"+orderid + '?orderValue=' + orderValue,
    	  	      success: function(resultData) {
    	  	  	  }
    		});
    	}
    	
    	
    	function showNotes(orderid){
    		console.log(orderid);
    		 $('#notes').val('');
  			 $('#orderid').val(orderid);
  			 $('#agentid').val(<%=CommonHelper.getAccount().getId()%>);
  			 $.ajax({
      	  	      type: 'GET',
      	  	      url: "agent/get-order-notes/"+orderid,
      	  	      dataType: "json",
      	  	  	  success: function(resultData) {
      	  	  		html = '';
      	  	  		console.log(resultData);
      	  	  		  $.each(resultData,function(key,val){
      	  	  			  console.log(val);
      	  	  			html += '<div class="card-body" style="padding:0.25rem">';
			                html += '<p class="card-title text-primary font-weight-bold">' + val.createdAt + ' - ' + val.agentName + '</p>';
			                html += '<span class="text-dark">';
			                html += val.notes;
			                html += '</span>';
			              	html += '</div>';
			              	html += '<hr/>';
      	  	  		  });
      	  	  		$('#previousnotes').html(html);
      	  	  		$('#exampleModal').modal('toggle');
      	  	  		}
    			});
    	}
    	
    		function editOrder(type,orderid){
    			console.log(orderid);
   				$('#orderid').val(orderid);
        		$('#shippingOrderid').val(orderid);
        		$('#customerOrderid').val(orderid);
   				$.ajax({
            	  	      type: 'GET',
            	  	      url: "agent/get-order-details/"+orderid,
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
            	  	  		
            	  	  		if(resultData.isCustom == 'Yes'){
            	  	  			$('#btn-new').css("display", "");
            	  	  		}else{
            	  	  			$('#btn-new').css("display", "none");
            	  	  		}
             	  	  	if(type == "2"){
            				$('#btn-confirm').css("display","none");
            				$('#btn-new').css("display", "none");
            			}else{
            				$('#btn-confirm').css("display","");
            			}
            	  	  		displayOrderItem(resultData);
            	  	  		$('#btn-add-items').attr("disabled", false);
            	  	  		$('#orderdetailsModal').modal('toggle');
            	  	  			
            	  	  		}
          			});
    			
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
    	
    		function showSMS(orderid) {
     			 console.log(orderid);
     			 $('#smscontent').val('');
     			 $('#smsorderid').val(orderid);
     			 $('#smsagentid').val(<%=CommonHelper.getAccount().getId()%>);
     			 $.ajax({
         	  	      type: 'GET',
         	  	      url: "agent/get-sms-log/"+orderid,
         	  	      //dataType: "json",
         	  	  	  success: function(resultData) {
         	  	  		html = '';
         	  	  	
         	  	  		if(resultData.includes('Hi')){
         	  	  			$('#smscontent').val(resultData);
         	  	  			$('.conversation-list').html('');
         	  	  		} else {
         	  	  			$.each(resultData,function(key,val){
       	  	  			  		if(val.type == 'sent'){
			       	  	  			html+=	'<li class="clearfix odd">'
				  	  						+			'<div class="chat-avatar" style="width:67px !important">'
				  	  						+				'<i class=" mdi mdi-account-circle avatar-title bg-danger avatar-lg rounded-circle" style="font-size:28px"></i>'
				  	  			  			+				'<i style="font-size:10px">'+ val.smsDate +'</i>'
						                    +			'</div>'
						                    + 		'<div class="conversation-text">'
						                    + 			'<div class="ctext-wrap">'
						                    +					'<i>' + val.agentName + '</i>'
						                    +					'<p>'
						                    +						val.content
						                    +          		'</p>'
						                    +      		'</div>'
						                    +			'</div>'
						                    +		'</li>';
		       	  	  			  } else {
		       	  	  					
		       	  	  				html+=	'<li class="clearfix">'
		   	  	  						+			'<div class="chat-avatar"  style="width:67px !important">'
		   	  	  						+				'<i class=" mdi mdi-account-circle avatar-title bg-success avatar-lg rounded-circle" style="font-size:28px"></i>'
		   	  	  						+				'<i style="font-size:10px">'+ val.smsDate +'</i>'
			      	  	  					+			'</div>'
							                + 		'<div class="conversation-text">'
							                + 			'<div class="ctext-wrap">'
							                +					'<i>' + val.customerName + '</i>'
							                +					'<p>'
							                +						val.content
							                +          		'</p>'
							                +      		'</div>'
							                +			'</div>'
							                +		'</li>';
		       	  	  			  }
       	  	  		  		});
       	  	  				$('.conversation-list').html(html);
       	  	  				
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
         	  	  			$('.conversation-list').removeAttr('style');
         	  	  			$('.conversation-list').css({"height":"300px","overflow":"hidden","width":"auto"});
         	  	  			modal.open();
         	  	  			newOrders = $("#new-orders").DataTable();
         	  	  			newOrders.ajax.reload();
         	  	  		}
       			});
   			}    			
   		
    		
    		
    		function hookbtnSave(){
       			$('#orderItems').on('click','a.save',function(e){
       				e.preventDefault();
       				var orderid = $('#orderid').val();
       				var queryURL = "title=" + encodeURIComponent($('#title').val()) + "&quantity=" + $('#quantity').val() + "&price=" + $('#price').val() + "&productId=" + $('#productId').val() + "&variantId=" + $('#variantId').val();
       				
       			 $.ajax({
        	  	      type: 'POST',
        	  	      url: "agent/save-order-item/"+orderid+"?" + queryURL,
        	  	      //dataType: "json",
        	  	  	  success: function(resultData) {
        	  	  		  	console.log('resultData ' + typeof resultData);
        	  	  		  	if(typeof resultData === "object"){
        	  	  		  		displayOrderItem(resultData);
        	  	  		  	}else{
        	  	  		  		Swal.fire({
	      						  title: "Error !!!",
	      						  text: "Product already exist. Please update the line item.",
	      						  type: "error"
	      						});
        	  	  		  	}
        	  	  			
        	  	  			$('#btn-add-items').attr("disabled", false);
        	  	  	  }
       			 
       			 });
       		   });
       		}	
       		
       		
       		function hookTabledit(){
       			$("#orderItems").Tabledit({
       				buttons:{
    					edit:{
    						class:"btn btn-sm btn-secondary",
    						html:'<span class="mdi mdi-pencil"></span>',
    						action:"edit"
    					},
    					save:{
    						class:"btn btn-sm btn-success",
    						html:'<span class="mdi mdi-content-save"></span>',
    						action:"save"
    					},
    					delete:{
    						class: 'btn btn-sm btn-secondary',
    						html: '<span class="fa fa-trash"></span>',
    						action: 'delete'
    					}
    			
    				},
    				inputClass:"form-control form-control-sm",
    				deleteButton:!0,
    				saveButton:!0,
    				autoFocus:!1,
    				columns:{
    					identifier:[0,"id"],
    					editable:[[2,"col2"],[3,"col3"]]
    				},
    				onAjax: function(action, serialize) {
    					var orderid = $('#orderid').val();
    		         
    		           	if(action == "delete"){
    		           		 $.ajax({
		    	        	  	      type: 'POST',
		    	        	  	      url: "agent/delete-order-item/"+orderid+"?"+serialize,
		    	        	  	      //dataType: "json",
		    	        	  	  	  success: function(resultData) {
		    	        	  	  		 $.toast({ 
		    	    	    	  	    	  heading: 'Success',
		    	    	    	  	    	  text : 'Item Deleted !!!', 
		    	    	    	  	    	  icon : 'success',
		    	    	    	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
		    	    	    	  	    	  hideAfter: 5000,
		    	    	    	  	    	  position: 'top-right',
		    	    	    	  	    	});
		    	        	  	  		  displayOrderItem(resultData);
		    	        	  	  	  }
		    	       			 
		    	       		});
    		           	}else if(action == "edit"){
    		           		$.ajax({
	    	        	  	      type: 'POST',
	    	        	  	      url: "agent/edit-order-item/"+orderid+"?"+serialize,
	    	        	  	      //dataType: "json",
	    	        	  	  	  success: function(resultData) {
	    	        	  	  		 $.toast({ 
	    	    	    	  	    	  heading: 'Success',
	    	    	    	  	    	  text : 'Item Updated !!!', 
	    	    	    	  	    	  icon : 'success',
	    	    	    	  	    	  showHideTransition : 'slide',  // It can be plain, fade or slide
	    	    	    	  	    	  hideAfter: 5000,
	    	    	    	  	    	  position: 'top-right',
	    	    	    	  	    	});
	    	        	  	  	 		displayOrderItem(resultData);
		    	  	    	  	    	
	    	        	  	  	  }
	    	       			 
	    	       			});
    		           	}
    		        }
    			});
       		}
       		
       		function toggle(type,orderId){
       			console.log(type + ' ' + orderId);
       			var tagValue = '';
       			if(type == 0){
       				if($('#0-'+orderId).hasClass("badge-danger")){
       					$('#0-'+orderId).removeClass("badge-danger");
           				$('#0-'+orderId).addClass("badge-secondary");
       				}else{
       					$('#0-'+orderId).addClass("badge-danger");
           				$('#0-'+orderId).removeClass("badge-secondary");
       				}
       			}else if(type == 1){
       				if($('#1-'+orderId).hasClass("badge-warning")){
       					$('#1-'+orderId).removeClass("badge-warning");
           				$('#1-'+orderId).addClass("badge-secondary");
       				}else{
       					$('#1-'+orderId).addClass("badge-warning");
           				$('#1-'+orderId).removeClass("badge-secondary");
       				}
       			}
       			if($('#0-'+orderId).hasClass("badge-danger")){
       				tagValue = 'Redial';
       			}
       			if($('#1-'+orderId).hasClass("badge-warning")){
       				tagValue += ',Unreachable';
       			}
       			console.log(tagValue);
       			
       			$.ajax({
      	  	      type: 'POST',
      	  	      url: "agent/edit-tag-for-order/"+orderId+"?tagValue="+tagValue,
      	  	      //dataType: "json",
      	  	  	  success: function(resultData) {
						console.log(resultData);	        	  	  		
      	  	  	  }
     			});
       		}
       		
       		
    	</script>  
    </body>
</html>