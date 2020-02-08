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
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Ultimate Parcel</a></li>
                                            <li class="breadcrumb-item active">Dashboard </li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">Dashboard </h4>
                                </div>
                            </div>
                        </div>     
                        <!-- end page title --> 


                        

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="float-right d-none d-md-inline-block">
                                            <div class="btn-group mb-2">
                                                <button type="button" class="btn btn-xs btn-secondary" id="order-today">Today</button>
                                                <button type="button" class="btn btn-xs btn-light" id="order-weekly">Weekly</button>
                                                <button type="button" class="btn btn-xs btn-light" id="order-monthly">Monthly</button>
                                            </div>
                                        </div>
                                        <h4 class="header-title">Orders</h4>
                                        
                                        <div class="mt-3 chartjs-chart">
                                            <canvas id="line-chart-example" height="300"></canvas>
                                        </div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col -->

                            <div class="col-lg-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="float-right d-none d-md-inline-block">
                                            <div class="btn-group mb-2">
                                                <button type="button" class="btn btn-xs btn-secondary" id="sales-today">Today</button>
                                                <button type="button" class="btn btn-xs btn-light" id="sales-weekly">Weekly</button>
                                                <button type="button" class="btn btn-xs btn-light" id="sales-monthly">Monthly</button>
                                            </div>
                                        </div>
                                        <h4 class="header-title">Sales</h4>
                                        
                                        <div class="mt-3 chartjs-chart">
                                            <canvas id="bar-chart-example" height="300"></canvas>
                                        </div>
                                    </div>
                                </div> <!-- end card-->
                            </div> <!-- end col -->
                        </div>
                    </div> <!-- container -->

                </div> <!-- content -->
                <%@ include file="footer.jspf"%>
            </div>
        </div>
    	<%@ include file="scripts.jspf"%>
    	    <script src="${pageContext.request.contextPath}/assets/libs/chart-js/Chart.bundle.min.js"></script>
    	   <script>
    	   var ordersChart;
    	   var salesChart;
    	   
    	   function respChart(selector, type, data, options) {

    	        // get selector by context
    	        var ctx = selector.get(0).getContext("2d");
    	        // pointing parent container to make chart js inherit its width
    	        var container = $(selector).parent();

    	        // this function produce the responsive Chart JS
    	        function generateChart() {
    	            // make chart width fit with its container
    	            var ww = selector.attr('width', $(container).width());
    	            var chart;
    	            switch (type) {
    	                case 'Line':
    	                    chart = new Chart(ctx, { type: 'line', data: data, options: options });
    	                    break;
    	                case 'Doughnut':
    	                    chart = new Chart(ctx, { type: 'doughnut', data: data, options: options });
    	                    break;
    	                case 'Pie':
    	                    chart = new Chart(ctx, { type: 'pie', data: data, options: options });
    	                    break;
    	                case 'Bar':
    	                    chart = new Chart(ctx, { type: 'bar', data: data, options: options });
    	                    break;
    	                case 'Radar':
    	                    chart = new Chart(ctx, { type: 'radar', data: data, options: options });
    	                    break;
    	                case 'PolarArea':
    	                    chart = new Chart(ctx, { data: data, type: 'polarArea', options: options });
    	                    break;
    	            }
    	            return chart;
    	        };
    	        // run function - render chart at first load
    	        return generateChart();
    	    }
    	   
    	   		$(document).ready(function(){
	 	   				managebuttonClics();
		                    $.ajax({
	  	         	  	      type: 'POST',
	  	         	  	      url: "admin/dashboard/sales-today",
	  	         	  	      dataType: "json",
	  	         	  	  	  success: function(resp) {
	  	         	  	  		ordersChart = respChart($("#line-chart-example"), 'Line', resp.lineChart, resp.lineOpts);	
	  	         	  	  	  }
	   	       			});
	 	                    
		                    $.ajax({
	    	         	  	      type: 'POST',
	    	         	  	      url: "admin/dashboard/order-today",
	    	         	  	      dataType: "json",
	    	         	  	  	  success: function(resp) {
	    	         	  	  		salesChart = respChart($("#bar-chart-example"), 'Bar', resp.lineChart, resp.lineOpts);	
	    	         	  	  	  }
	     	       		});
      	                    
    	                    
    	   		});
    	   
    	   		
    	   		
    	   		
    	   		function managebuttonClics() {
    	   			$('#order-today').click(function(){
    	   				$('#order-today').addClass("btn-secondary").removeClass("btn-light");
    	   				$("#order-weekly").removeClass("btn-secondary").addClass("btn-light");
    	   				$("#order-monthly").removeClass("btn-secondary").addClass("btn-light");
    	   				
    	   				$.ajax({
    	         	  	      type: 'POST',
    	         	  	      url: "admin/dashboard/sales-today",
    	         	  	      dataType: "json",
    	         	  	  	  success: function(resp) {
    	         	  	  		ordersChart.destroy();
    	         	  	  		ordersChart = respChart($("#line-chart-example"), 'Line', resp.lineChart, resp.lineOpts);	
    	         	  	  	  }
    	       			});
    	   			});
    	   			
					$('#order-weekly').click(function(){
						$('#order-today').removeClass("btn-secondary").addClass("btn-light");
    	   				$("#order-weekly").addClass("btn-secondary").removeClass("btn-light");
    	   				$("#order-monthly").removeClass("btn-secondary").addClass("btn-light");
    	   				
    	   				$.ajax({
  	         	  	      type: 'POST',
  	         	  	      url: "admin/dashboard/sales-weekly",
  	         	  	      dataType: "json",
  	         	  	  	  success: function(resp) {
  	         	  	  			ordersChart.destroy();
         	  	  				ordersChart = respChart($("#line-chart-example"), 'Line', resp.lineChart, resp.lineOpts);		
  	         	  	  	  }
  	       				});
    	   			});
					
					$('#order-monthly').click(function(){
						$('#order-today').removeClass("btn-secondary").addClass("btn-light");
    	   				$("#order-weekly").removeClass("btn-secondary").addClass("btn-light");
    	   				$("#order-monthly").addClass("btn-secondary").removeClass("btn-light");
    	   				
    	   				$.ajax({
  	         	  	      type: 'POST',
  	         	  	      url: "admin/dashboard/sales-monthly",
  	         	  	      dataType: "json",
  	         	  	  	  success: function(resp) {
  	         	  	  			ordersChart = respChart($("#line-chart-example"), 'Line', resp.lineChart, resp.lineOpts);	
  	         	  	  	  }
  	       				});
    	   			});
					
					
					$('#sales-today').click(function(){
    	   				$("#sales-today").addClass("btn-secondary").removeClass("btn-light");
    	   				$("#sales-weekly").removeClass("btn-secondary").addClass("btn-light");
    	   				$("#sales-monthly").removeClass("btn-secondary").addClass("btn-light");
    	   				
    	   				$.ajax({
  	         	  	      type: 'POST',
  	         	  	      url: "admin/dashboard/order-today",
  	         	  	      dataType: "json",
  	         	  	  	  success: function(resp) {
		  	         	  	  	salesChart.destroy();
		  	         	  	salesChart = respChart($("#bar-chart-example"), 'Bar', resp.lineChart, resp.lineOpts);		
  	         	  	  	  }
	  	       			});	
    	   			});
    	   			
					$('#sales-weekly').click(function(){
    	   				$("#sales-today").removeClass("btn-secondary").addClass("btn-light");
    	   				$("#sales-weekly").addClass("btn-secondary").removeClass("btn-light");
    	   				$("#sales-monthly").removeClass("btn-secondary").addClass("btn-light");
    	   				
    	   				$.ajax({
  	         	  	      type: 'POST',
  	         	  	      url: "admin/dashboard/order-weekly",
  	         	  	      dataType: "json",
  	         	  	  	  success: function(resp) {
  	         	  	  	salesChart.destroy();
	  	         	  	salesChart = respChart($("#bar-chart-example"), 'Bar', resp.lineChart, resp.lineOpts);	
  	         	  	  	  }
  	       				});
    	   			});
					
					$('#sales-monthly').click(function(){
    	   				$("#sales-today").removeClass("btn-secondary").addClass("btn-light");
    	   				$("#sales-weekly").removeClass("btn-secondary").addClass("btn-light");
    	   				$("#sales-monthly").addClass("btn-secondary").removeClass("btn-light");
    	   				
    	   				$.ajax({
  	         	  	      type: 'POST',
  	         	  	      url: "admin/dashboard/order-monthly",
  	         	  	      dataType: "json",
  	         	  	  	  success: function(resp) {
  	         	  	  	salesChart.destroy();
	  	         	  	salesChart = respChart($("#bar-chart-example"), 'Bar', resp.lineChart, resp.lineOpts);		
  	         	  	  	  }
  	       				});
    	   			});
    	   		}
    	   		
    	   		
    	   </script>
    </body>
</html>