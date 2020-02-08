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
                        <div class="row" style="padding-top:18px;">
                            <div class="col-12">
                                <div class="card-box">
                                	<h2 class="header-title" style="padding-bottom:20px">Products </h2>
                                	
                                    <table class="table table-hover m-0 table-centered dt-responsive nowrap w-100" id="products-table">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Store</th>
                                            <th>Title</th>
                                            <th>Vendor</th>
                                            <th>Product Type</th>
                                            <th>Details</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div><!-- end col -->
                        </div>
                        <!-- end row -->
                    </div> <!-- container -->
				</div> <!-- content -->
                
                <!--  TOAST -->
                <div class="toast fade" role="alert" aria-live="assertive" aria-atomic="true"  data-autohide="true" style="position: absolute; top: 12%; right: 1%;z-index:-1" >
					  <div class="toast-header">
					    <strong class="mr-auto text-primary">Agents</strong>
					    <small class="text-muted"></small>
					    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
					  </div>
					  <div class="toast-body">
					    Some text inside the toast body
					  </div>
				</div>
                <!--  TOAST END -->
                <%@ include file="productdetails.jspf"%>
                <%@ include file="footer.jspf"%>
            </div>
        </div>
    	<%@ include file="scripts.jspf"%>    
    	<script src="${pageContext.request.contextPath}/assets/js/pages/jquery.validate.min.js"></script>
    	<script src="${pageContext.request.contextPath}/assets/js/pages/jquery-form.min.js"></script>
    	
    <script>
    		
    	$(document).ready(function(){
    		
    		var t = $("#products-table").DataTable({
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
    			 		{"data":"id"},
    			 		{"data":"storeUrl","render": function ( data, type, row ) {return data.replace('.myshopify.com','')}},
    			 		{"data":"title"},
    			 		{"data":"vendor"},
    			 		{"data":"productType"},
    			 		{"data":"productType", "bSortable": false ,"render": function ( data, type, row ) {
         	        		return '<div class="col-6"><div class="avatar-sm bg-success shadow-lg rounded" style="background-color:#7c8a87!important"><a href="javascript:void(0)"  onClick="showProductDetail(' + row.id + ')"  class="edit"><i class="fe-eye avatar-title font-22 text-white"></i></a></div></div>';
                        }}],
                    ajax: {"url": "agent/get-products-for-datatable","type":"POST", "contentType": "application/json","data": function(d) {
            	            return JSON.stringify(d);
            	    }}
    			});
    	});
    	//End of document.ready
    	
    	
    	function showProductDetail(productid){
    		console.log(productid);
    		$.ajax({
      	  	      type: 'GET',
      	  	      url: "agent/get-product-details/"+productid,
      	  	     //dataType: "json",
      	  	  	  success: function(resultData) {
      	  	  		html = '';
      	  	  		$('#title').text(resultData.title);
      	  	  		$('#vendor').html('<b>Vendor : </b>' + resultData.vendor);
      	  	  		$('#productType').html('<b>Product Type : </b>' + resultData.productType);
      	  	  		$('#description').html(resultData.description);
      	  	  		var i = 1;
      	  	  		var images = resultData.images;
      	  	  		  $.each(images,function(key,val){
      	  	  			if(i==1){
      	  	  				html += '<div class="carousel-item active">';
      	  	  				i++;
      	  	  			}else{
      	  	  				html += '<div class="carousel-item">';
      	  	  			}
      	  	  			html +=	'	<img class="d-block" src="' + val + '" alt="Product Image" style="max-height:400px"/>'
                    		 + 	'</div>';
      	  	  		  });
      	  	  		$('#carouselData').html(html);
      	  	  	var variant = resultData.variant;
      	  	  	console.log('variant ' + variant);
      	  	  	i=1;
      	  	  	html='';
      	  	  	 $.each(variant,function(key,val){
      	  	  		console.log('val ' + val.id);
      	  	  		console.log('val ' + val.title);
      	  	  		console.log('val ' + val.price);
      	  	  		html += '<tr>'
		  				 + '    <td>'+ i + '</td>'
		  				 + '	<td>'+ val.title +'</td>'
		  				 + '	<td>'+ val.price +'</td>'
		  				 + '	<td>'+ val.inventoryQuantity +'</td>'
       	  	 		  	 + '</tr>';
       	  	 		  	 ++i;
   	  	  		  });
      	  	  	 	console.log(html);
		      	  	$('#productVariants tbody').html('');
			  		$('#productVariants tbody').html(html);
      	  	  		$('#productdetailsModal').modal('toggle');
      	  	  		}
    			});
  			}
    	</script>  
    </body>
</html>