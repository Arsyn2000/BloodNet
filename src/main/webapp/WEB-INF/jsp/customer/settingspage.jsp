<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.taim.conduire.common.CommonHelper"%>
<%@page import="com.taim.conduire.constants.ConstantCodes"%>
<html lang="en">
<script src="https://cdn.shopify.com/s/assets/external/app.js"></script>
<script>document.write('<base href="' + location.protocol + '//' + location.host + '${pageContext.request.contextPath}/' + '" />');
</script>
<%@ include file="head.jspf" %>
<body>
	<div>
  		<div style="--top-bar-background:#00848e; --top-bar-color:#f9fafb; --top-bar-background-lighter:#1d9ba4;">
  			<div class="Polaris-Card">
    			<div>
		       	<%@ include file="nav.jspf" %>
		       	<%@ include file="banners.jspf" %>
		       	<%@ include file="settings.jspf" %>
		    	</div>
  			</div>
		</div>
</div>

<%@ include file="footer.jspf" %>

<script type="text/javascript">
     $(document).ready(function(){
   	 <%--  ShopifyApp.ready(function() {
             ShopifyApp.Bar.initialize({
                 title: 'Welcome',
                 apiKey: '<%=ConstantCodes.SHOPIFY_CLIENT_ID%>',
                 shopOrigin: '<%=CommonHelper.getAccount().getShopifyStoreUrl()%>'
             })
         }); --%>
         $('#settings_form').validate({
             rules: {
                 username: {required: true},
                 apiKey: {required: true}
             },
             messages: {
                 username: {required: 'This field is required'},
                 apiKey: {required: 'This field is required'}
             },
             errorPlacement: function(error, element) {
                 error.insertAfter(element.parent());
             },
             submitHandler: function(form) {
                 $(form).ajaxSubmit(function(resp) {                	 
                     $('#span_message').html(resp);
                     $('#success_banner').css('display','block');
                     setTimeout(function() {
                         $('#success_banner').fadeOut('fast');
                         window.location.reload();
                     }, 2000);
                 });
             }
         });
      /* $('#connect_disconnect').click(function(){
        	 $.ajax({type : "GET", 
        		 	url : ('customer/connect-iconic/'+ 'connect') ,
      				success : function(resp) {    			
      				console.log("resp:" + resp);
                    $('#span_message').html(resp);
                    $('#success_banner').css('display','block');
                    setTimeout(function() {
                        $('#success_banner').fadeOut('fast');
                   
                    }, 2000);
                }
         	}); 
    	});*/
}); 

</script>
</body>
</html>

