<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<%@ include file="head.jspf" %>

<body>
    <div id="container" class="effect aside-float aside-bright mainnav-lg">
		<%@ include file="header.jspf" %>
        <div class="boxed">
            <div id="content-container">
                              
                <div id="page-content">
						<div class="panel">
							<div class="panel-heading">
					        	<h3 class="panel-title">Products</h3>
					    	</div>
					    	<!-- <div id="demo-custom-toolbar" class="table-toolbar-left col-sm-4" >
						    	<button id="demo-dt-addrow-btn" class="btn btn-primary dt-list-on-amazon"><i class="demo-pli-plus"></i> List on Amazon</button>
						    	<button id="demo-dt-addrow-btn" class="btn btn-primary download-flat-file"><i class="demo-pli-plus"></i> Download Flat File</button>
						    	<button id="demo-dt-addrow-btn" class="btn btn-primary download-response-file"><i class="demo-pli-plus"></i> Download Response File</button>
						    </div> -->
						    <div  class="panel-body">
						        <table id="demo-dt-delete" class="table table-striped table-bordered" cellspacing="0" width="100%">
						            <thead>
						                <tr>
						                	<th data-hide="phone">#</th>
						                	<th>Product Id</th>
						                    <th>Title</th>
						                    <th>Vendor</th>
						                    <th>Product Type</th>
						                </tr>
						            </thead>
						            <tbody>
						                
						            </tbody>
						        </table>
						    </div>
					</div>                    
                </div>

            </div>
        	<%@ include file="aside.jspf" %>    
            <%@ include file="menu.jspf" %>
        </div>
        <%@ include file="footer.jspf" %>
        <button class="scroll-top btn">
            <i class="pci-chevron chevron-up"></i>
        </button>
        <form name="link-product" id="link-product" method="get" action="">
        </form>
         <form name="download-flat-file" id="download-flat-file" method="post" action="">
        </form>
        <script type="text/javascript">
        var rowDeletion;
        
        function takeaction(productid) {
        	$.ajax({
                type: 'POST',
                url: 'link-or-list/isconnected'
            }).done(function (data, textStatus, jqXHR) {
            	console.log(data);
            	if(data == 'Error') {
            		$.niftyNoty({
                        type: 'success',
                        container: 'floating',
                        html: 'Please configure/connect amazon account first',
                        floating: {
                            position: "top-right",
                            animationIn: 'bounceIn',
                            animationOut: 'bounceOut'
                        },
                        closeBtn: false,
                        focus: true,
                        timer: 2500
                    });
            	} else {
                	$('#link-product').attr('action','link-or-list/link/' + productid);
                	$('#link-product').submit();
            	}
            	
            }).fail(function (jqXHR, textStatus, errorThrown) {
            	$.niftyNoty({
                    type: 'success',
                    container: 'floating',
                    html: 'Something goes wrongs.',
                    floating: {
                        position: "top-right",
                        animationIn: 'bounceIn',
                        animationOut: 'bounceOut'
                    },
                    closeBtn: false,
                    focus: true,
                    timer: 2500
                });
            });
        }
        
        function format ( d ) {
			var txtData = '';
			txtData =  '<table class=\'table table-striped table-bordered table-hover dataTable\'>'+
	        '<tr>'+
            '<td>Title</td>'+
            '<td>SKU</td>'+
            '<td>Quantity</td>'+
            '<td>Price</td>'
        '</tr>';
        
        $.each(d.variants, function(index, item) {
        	txtData += '<tr role=\'row\' >';
        	txtData += '<td>'+item.title+ '</td>';
        	if(item.sku) {
        		txtData += '<td>'+ item.sku + '</td>';	
        	} else {
        		txtData += '<td></td>';
        	}
        	
        	txtData += '<td>'+item.inventoryQuantity+ '</td>';
        	txtData += '<td>'+item.price+ '</td>';
			txtData += '</tr>';
		});
        
        txtData += '</table>';
	     return txtData;
		        		        
		    
		}
        
        
        
        $(document).ready( function () {
        	$.fn.dataTable.ext.pager.numbers_length = 15;
        	rowDeletion = $('#demo-dt-delete').DataTable({
                "responsive": true,
                "language": {
                    "paginate": {
                      "previous": '<i class="demo-psi-arrow-left"></i>',
                      "next": '<i class="demo-psi-arrow-right"></i>'
                    }
                },
                "dom": '<"toolbar"><"col-sm-4"l><"col-sm-4"f>rt<"col-sm-6"i><"col-sm-6"p>',
                "sPaginationType": "full_numbers",
                "bServerSide": true,
                "bProcessing": true,
                "sAjaxSource": "customer/getAllProductsForDataTable",
                "bDestroy": true,
                "pageLength": 50,
                "aaSorting": [[ 1, "desc" ]],
                "aoColumns": [
      	    	   {
     	                "className":      'details-control',
     	                "orderable":      false,
     	                "data":           null,
     	                "defaultContent": ''
     	            },
     	            {"mData": "id",  "visible": false},
     	            {"mData": "title"},
     	           	{"mData": "vendor"},
     	          	{"mData": "productType"}
                 ]
     
            });	
        	setInterval (function test() {
        		 rowDeletion.ajax.reload();
            }, 30000);
        	
        	  $('#demo-custom-toolbar').appendTo($("div.toolbar"));
      		
              $('#demo-dt-delete tbody').on( 'click', 'tr', function () {
                  if ( $(this).hasClass('selected') ) {
                      $(this).removeClass('selected');
                  }
                  else {
                  	rowDeletion.$('tr.selected').removeClass('selected');
                      $(this).addClass('selected');
                  }
              } );
              
              $('#demo-dt-delete tbody').on('click', 'td.details-control', function () {
      	        var tr = $(this).closest('tr');
      	        var row = rowDeletion.row( tr );
      	 
      	        if ( row.child.isShown() ) {
      	            // This row is already open - close it
      	            row.child.hide();
      	            tr.removeClass('shown');
      	        }
      	        else {
      	            // Open this row
      	            row.child( format(row.data()) ).show();
      	            tr.addClass('shown');
      	        }
      	    } );
      		
              $('.dt-list-on-amazon').on('click', function(){
              	if(rowDeletion.$('tr.selected').length == 1) {
              		var vRow = rowDeletion.$('tr.selected')[0];
              		var a = $('td:nth-child(2)', vRow).text();
              		
              		$.ajax({
                          type: 'POST',
                          url: 'link-or-list/isunique/'+a
                      }).done(function (data, textStatus, jqXHR) {
                      	if(data == 'Success') {
                      		takeaction(a);
                      	} else {
                      		var errorMessage=data;
                      		if(data == "Error") errorMessage="Something goes wrongs.";
                      		$.niftyNoty({
                                  type: 'success',
                                  container: 'floating',
                                  html: errorMessage,
                                  floating: {
                                      position: "top-right",
                                      animationIn: 'bounceIn',
                                      animationOut: 'bounceOut'
                                  },
                                  closeBtn: true,
                                  focus: true
                              });
                      	}
                      	
                      }).fail(function (jqXHR, textStatus, errorThrown) {
                      	$.niftyNoty({
                              type: 'success',
                              container: 'floating',
                              html: 'Something goes wrongs.',
                              floating: {
                                  position: "top-right",
                                  animationIn: 'bounceIn',
                                  animationOut: 'bounceOut'
                              },
                              closeBtn: false,
                              focus: true,
                              timer: 2500
                          });
                      });
              		
              	} else {
              		$.niftyNoty({
                          type: 'info',
                          container: 'floating',
                          html: 'Please select row to list on amazon',
                          floating: {
                              position: "top-right",
                              animationIn: 'bounceIn',
                              animationOut: 'bounceOut'
                          },
                          closeBtn: false,
                          focus: true,
                          timer: 2500
                      });
              	}
              });     
              
              
              $('.download-flat-file').on('click', function(){
                	if(rowDeletion.$('tr.selected').length == 1) {
                		var vRow = rowDeletion.$('tr.selected')[0];
                		var productId = $('td:nth-child(2)', vRow).text();
                		var amazonStatus = $('td:nth-child(4)', vRow).text();
                		var feedStatus = $('td:nth-child(5)', vRow).text();
                		
                		$('#download-flat-file').attr('action','feeds/rowfile/'+productId);
           	            $('#download-flat-file').submit();
           	           
                	} else {
                		$.niftyNoty({
                            type: 'info',
                            container: 'floating',
                            html: 'Please select row to list on amazon',
                            floating: {
                                position: "top-right",
                                animationIn: 'bounceIn',
                                animationOut: 'bounceOut'
                            },
                            closeBtn: false,
                            focus: true,
                            timer: 2500
                        });
                	}
                });     
                
              
              $('.download-response-file').on('click', function(){
              	if(rowDeletion.$('tr.selected').length == 1) {
              		var vRow = rowDeletion.$('tr.selected')[0];
              		var productId = $('td:nth-child(2)', vRow).text();
              		var amazonStatus = $('td:nth-child(4)', vRow).text();
              		var feedStatus = $('td:nth-child(5)', vRow).text();
              		
              		$('#download-flat-file').attr('action','feeds/responsefile/'+productId);
         	        $('#download-flat-file').submit();
         	           
              	} else {
              		$.niftyNoty({
                          type: 'info',
                          container: 'floating',
                          html: 'Please select row to list on amazon',
                          floating: {
                              position: "top-right",
                              animationIn: 'bounceIn',
                              animationOut: 'bounceOut'
                          },
                          closeBtn: false,
                          focus: true,
                          timer: 2500
                      });
              	}
              });
        });
        
               
      
        
        </script>
    </div>
</body>
</html>
		