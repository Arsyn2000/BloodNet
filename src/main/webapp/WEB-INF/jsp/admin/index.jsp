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
		        	<%@ include file="dashboard.jspf"%>
		        </div>
		        <%@ include file="footer.jspf"%>
	        </div>
		</div>		
	</div>
	
	 <%@ include file="scripts.jspf" %>
    <script>
    	$(document).ready(function() {
    		$('#exampleModal').modal('toggle');
    	});

    </script>
    
</body>
</html>
