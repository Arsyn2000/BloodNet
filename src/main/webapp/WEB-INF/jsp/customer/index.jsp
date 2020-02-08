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
                <div id="page-title">
                    <h1 class="page-header text-overflow">Orders</h1>
                </div>
                
                <div id="page-content">
						<div class="panel">
					    <div class="panel-body">
					        <table id="demo-dt-delete" class="table table-striped table-bordered" cellspacing="0" width="100%">
					            <thead>
					                <tr>
					                	<th data-hide="phone">#</th>
					                	<th>Order Number</th>
					                    <th>Date</th>
					                    <th>Customer Name</th>
					                    <th>Source</th>
					                    <th>Customized ?</th>
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
        <script type="text/javascript">
        
        function format ( d ) {
			var txtData = '';
			txtData =  '<table class=\'table table-striped table-bordered table-hover dataTable\'>'+
	        '<tr>'+
            '<th>Title</td>'+
            '<th>SKU</td>'+
            '<th>Quantity</td>'+
            '<th>Price</td>'+
        '</tr>';
        
        $.each(d.items, function(index, item) {
        	txtData += '<tr role=\'row\' >';
        	txtData += '<td>'+item.title+ '</td>';
        	if(item.sku) {
        		txtData += '<td>'+ item.sku + '</td>';	
        	} else {
        		txtData += '<td></td>';
        	}
        	
        	txtData += '<td>'+item.quantity+ '</td>';
        	txtData += '<td>'+item.price+ '</td>';
			txtData += '</tr>';
		});
        
        txtData += '</table>';
	     return txtData;
		        		        
		    
		}
        
        var rowDeletion = $('#demo-dt-delete').DataTable({
            "responsive": true,
            "language": {
                "paginate": {
                  "previous": '<i class="demo-psi-arrow-left"></i>',
                  "next": '<i class="demo-psi-arrow-right"></i>'
                }
            },
            "dom": '<"toolbar">frtip',
            "sPaginationType": "full_numbers",
            "bServerSide": true,
            "bPaginate": true,
            "bProcessing": true,
            "sAjaxSource": "customer/getAllOrdersForDataTable",
            "bDestroy": true,
            "aaSorting": [[ 1, "desc" ]],
            "aoColumns": [
 	    	   {
	                "className":      'details-control',
	                "orderable":      false,
	                "data":           null,
	                "defaultContent": ''
	            },
            	{"mData": "orderNumber"},
                {"mData": "orderDate"},
                {"mData": "customerName"},
                {"mData": "orderSource"},
                {"mData": "containsCustomization"}
            ] 
        });
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

        $('#demo-dt-delete-btn').click( function () {
            rowDeletion.row('.selected').remove().draw( false );
        } );

        $('#demo-dt-addrow-btn').on('click', function(){
       		$.niftyNoty({
                   type: 'info',
                   container: 'floating',
                   html: 'Work is in progress !!',
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
        </script>
    </div>
</body>
</html>
		