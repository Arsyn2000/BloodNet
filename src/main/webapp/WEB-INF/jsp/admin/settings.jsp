<!DOCTYPE html>
<html lang="en">
    <%@ include file="head.jspf"%>
    <body>
        <div id="wrapper">
    		<%@ include file="topnavbar.jspf"%>        
            <%@ include file="leftsidemenu.jspf"%>
           
            <div class="content-page">
                <div class="content">

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <h4 class="page-title">Settings</h4>
                                </div>
                            </div>
                        </div>     
                        
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <form action="admin/update-settings" method="post" name="settings-form" id="settings-form">
                                        	<c:forEach items="${settings}" var="setting"> 
											   <div class="form-group">
                                                <label for="exampleInputEmail1">${setting.name}</label>
                                                <input type="text" class="form-control" id="${setting.alias}" name="${setting.alias}" value="${setting.paramvalue}" aria-describedby="emailHelp" >
                                                <small id="emailHelp${setting.alias}" class="form-text text-muted">${setting.description}</small>
                                            </div>
											</c:forEach>
                                           
                                            <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
                                        </form>

                                    </div>
                                </div> 
                            </div>
                        </div>
                    </div> 
					<div class="toast fade" role="alert" aria-live="assertive" aria-atomic="true"  data-autohide="true" style="position: absolute; top: 12%; right: 1%;" >
					  <div class="toast-header">
					    <strong class="mr-auto text-primary">Settings</strong>
					    <small class="text-muted">Now</small>
					    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
					  </div>
					  <div class="toast-body">
					    Some text inside the toast body
					  </div>
					</div>

                </div>
                <%@ include file="footer.jspf"%>
            </div>
        </div>
    	<%@ include file="scripts.jspf"%>
    	<script src="${pageContext.request.contextPath}/assets/js/pages/jquery.validate.min.js"></script>
    	<script src="${pageContext.request.contextPath}/assets/js/pages/jquery-form.min.js"></script>
    	
    	<script>
    		$(document).ready(function(){
    			$('#settings-form').validate({
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
    	                
    	            },
    				errorPlacement : function(error, element) {
    					error.insertAfter(element.parent());
    				}
    			});
    			
    			$('.form-control').each(function() {
    			    $(this).rules('add', {
    			        required: true
    			    });
    			});
    		});
    	</script>    
    </body>
</html>