<!DOCTYPE html>
<html lang="en">
<%@ include file="head.jspf"%>
<body>
	<div class="container-scroller">
		<%@ include file="nav.jspf"%>
		<div class="container-fluid page-body-wrapper">
			<%@ include file="sidebar.jspf"%>
			<div class="main-panel">
		        <div class="content-wrapper">
		        	<%@ include file="shopifyorderlist.jspf"%>
		        </div>
		        <%@ include file="footer.jspf"%>
	        </div>
		</div>		
	</div>
	 <script src="${pageContext.request.contextPath}/vendors/jquery-validation/jquery.validate.min.js"></script>
		  <script src="${pageContext.request.contextPath}/vendors/jquery-form/jquery-form.min.js"></script>
  		<script src="${pageContext.request.contextPath}/vendors/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
		 <script src="${pageContext.request.contextPath}/vendors/datatables.net/jquery.dataTables.js"></script>
  		<script src="${pageContext.request.contextPath}/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  		 <!-- plugin js for toast notification -->
  			<script src="${pageContext.request.contextPath}/vendors/jquery-toast-plugin/jquery.toast.min.js"></script>
  	  <!-- End plugin js for this page -->
    <script>
    	$(document).ready(function() {
    		var t = $('#order-listing').DataTable({
    	        "columns":[{"data":"shopifyStoreUrl"},{"data":"orderNumber"},{"data":"createdAt"},{"data":"customerName"},{"data":"financialStatus"},{"data":"fulfillmentStatus"},{"data":"totalLineItemsPrice"},{"data":"agentName"}],
    	        "responsive": true,
    	        "sPaginationType": "full_numbers",
    	        "bServerSide": true,
    	        "bDestroy": true,
    	        "bPaginate": true,
    	        "bProcessing": true,
    	        "ajax": {"url": "admin/get-orders-for-datatable","type":"POST", "contentType": "application/json","data": function(d) {
    	            return JSON.stringify(d);
    	        },
    			"dom":'<\'row\'<\'col-sm-4\'l><\'col-sm-3\'f>>rt<\'col-sm-6\'i>p'
    	        
    	        }
    	    });
    	});

    </script>
    
</body>
</html>
