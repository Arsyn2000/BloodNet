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
		        	<%@ include file="stores.jspf"%>
		    	</div>
		      <%@ include file="footer.jspf"%>
	        </div>
		</div>		
	</div>
	
		<%@ include file="editstoreform.jspf"%>
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
    	
    		var t = $('#store-listing').DataTable({
    	        "columns":[{"data":"shopifyStoreUrl"},{"data":"fname"},{"data":"wphone"},{"data":"email"},{"data":"isCallFacility"},{"data":"accountstatus"}],
    	        "responsive": true,
    	        "sPaginationType": "full_numbers",
    	        "bServerSide": true,
    	        "bDestroy": true,
    	        "bPaginate": true,
    	        "bProcessing": true,
    	        "ajax": {"url": "admin/get-store-for-datatable","type":"POST", "contentType": "application/json","data": function(d) {
    	            return JSON.stringify(d);
    	        }},
    			"dom":'<\'row\'<\'col-sm-4\'l><\'col-sm-3\'f>>rt<\'col-sm-6\'i>p',
    			language:{
   					paginate:{
   						previous:"<i class='mdi mdi-chevron-left'>",
   						next:"<i class='mdi mdi-chevron-right'>"
   					},
   					"infoFiltered": ""
   			 	},
    	    });
    		
    		
    		$('#callfacility').on('change', function() {
    			if(this.checked){
    				console.log("Checked");
    				$('#ddagents').prop("disabled", false);
    			}else{
    				console.log("Un-Checked");
    				$('#ddagents').prop("disabled", true);
    			}
    			
    			
    		});
    		
    		
    		
    		$('#store-listing').on( 'click', 'tr', function () {
    	        if ( $(this).hasClass('selected') ) {
    	            $(this).removeClass('selected');
    	        }
    	        else {
    	            t.$('tr.selected').removeClass('selected');
    	            $(this).addClass('selected');
    	        }
    	    } );
    	    
    	    $('#store-listing').on( 'dblclick', 'tr', function () {
    	    	t.$('tr.selected').removeClass('selected');
	            $(this).addClass('selected');
	            $('#btn-edit-store').trigger('click');
    	    } );
    		
    	    $('#btn-edit-store').on('click',function(){
    	    	var vstorecode = t.rows('.selected').data()[0].id;
    			$.ajax({
      	  	      type: 'POST',
      	  	      url: "admin/get-store/"+vstorecode,
      	  	      dataType: "json",
      	  	  	  success: function(resultData) {
      	  	  		$('#storeid').val(resultData.account.id);
      	  	  		$('#storename').val(resultData.account.shopifyStoreUrl);
      	  	  		$('#ownername').val(resultData.account.fname);
      	  	  		$('#wphone').val(resultData.account.wphone);
      	  	  		$('#emailaddress').val(resultData.account.email);
      	  	  		if(resultData.account.isCallFacility == "Yes"){
      	  	  			$('#callfacility').attr( 'checked', true );
      	  	  		}
      	  	  		if(resultData.account.accountstatus == "ACTIVE"){
      	  	  			$('#storestatus').attr( 'checked', true );	
      	  	  		}
      	  	  		
      	  	  		var agents = resultData.agents;
      	  	  		var selected = [];
      	  	  		var i = 0;
      	  	  		$.each(agents,function(a,val){
      	  	  			selected[i] = val.id; 	
      	  	  			i = i +1;
      	  	  		});
      	  	  		$('#ddagents').val(selected).trigger('change');
      	  	  		$('#editstore').modal('toggle');
      	  	  	}
    			});
    	    });
    		
    		 $('#btn-add-agent').on('click',function(){
     			$('#storeModal').modal('toggle');	
     		});
    		 
    		 
    		 loadAgents();
    		 //loadStores();
    		 
    		 $('#btn-submit').on('click',function(){
    			 console.log("Inside submit");
    			 var agentdata = $('#ddagents').val();
    			 var storedata = $('#storeid').val();
    			 var iscallcenter;
    			 if($('#callfacility').prop("checked") == true){
    	                iscallcenter = "Yes";
    	         }else{
    	        	   iscallcenter = "No";
    	         }
    			 var status;
    			 if($('#storestatus').prop("checked") == true){
    				 status = "Yes";
	 	         }else{
	 	        	status = "No";
	 	         }
    			 var data=JSON.stringify(agentdata);
    			 console.log(agentdata);
    			 console.log(storedata);
    			 $.ajax({
         	  	      type: 'POST',
         	  	      url: "admin/store-agent-mapping",
         	  	      data:{'agentdata':data,'storedata':storedata,'iscallcenter':iscallcenter,'status':status},
         	  	      success: function(resultData) {
         	  	  	 		 $.toast({
		       	    		    heading: 'Success',
		       	    		    text: resultData,
		       	    		    showHideTransition: 'slide',
		       	    		    icon: 'success',
		       	    		    hideAfter: 3000,
		       	    		    position: 'top-right'	    	    	    		    
		       	    		});	 
         	  	  		$('#editstore').modal('toggle');
         	  	  	t.ajax.reload(); 
         	  	  	},
         	  	  	error:function(resultData){
         	  	 		console.log("Inside error" + resultData);
         	  	  	}
       			});
    		 })
    		 
    		 
    	});
    	
    	function loadAgents(){
    		 console.log("Inside loadAgents");
    		 $.ajax({type : "GET", url : 'admin/get-agents',
    			    success : function(data) {
    			      var html = '';

    			      html += '<label>Agents</label>';
    			      html +=  '<select id="ddagents" name="ddagents" class="js-example-basic-multiple" multiple="multiple" style="width:100%">';
    			     
    			      html+= '<option value="Select">Select Agent(s)</option>';

    			      $.each(data,function(key, val) {
    			    	  console.log(key + " " + val);
    			        html += '<option value=' + key + '>' + val + '</option>';
    			      });

    			      html += "</select>"
    			       $('#agent-div')
    			          .empty()
    			          .append(html)
    			          ;

    			      if ($(".js-example-basic-multiple").length) {
    	    			    $(".js-example-basic-multiple").select2({
    	    			    	placeholder: "Select Agent(s)"
    	    			    });
    	    			  } 
    	    		
    			  }
    			});
    	}
    	
    	function loadStores(){
   		 $.ajax({type : "GET", url : 'admin/get-stores',dataType : "json",
   			    success : function(data) {
   			      var html = '';

   			   	  html += '<label>Stores</label>';
   			      html +=  '<select id="ddstores" id="ddstores" class="js-example-basic-single" style="width:100%">';
   			      
   			      html+= '<option value="">Select Store</option>';
				
   			      $.each(data,function(key, val) {
   			    	  console.log(key + " " + val);
   			        html += '<option value=' + key + '>' + val + '</option>';
   			      });

   			      html += "</select>"
   			       $('#store-div')
   			          .empty()
   			          .append(html)
   			          ;
				
   			   if ($(".js-example-basic-single").length) {
   			    $(".js-example-basic-single").select2({
   			    	placeholder: "Select a store",
   			    });
   			  }
   			      
   			      
   			  }
   			});
   	}
    	
    </script>
    
</body>
</html>
