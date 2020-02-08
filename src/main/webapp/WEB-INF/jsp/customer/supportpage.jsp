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
		       	<%@ include file="support.jspf" %>
		    	</div>
  			</div>
		</div>
</div>


<script type="text/javascript">
 	 var vSupportPageNumber = 1;
     $(document).ready(function(){    	    	 
   	 <%--  ShopifyApp.ready(function() {
             ShopifyApp.Bar.initialize({
                 title: 'Welcome',
                 apiKey: '<%=ConstantCodes.SHOPIFY_CLIENT_ID%>',
                 shopOrigin: '<%=CommonHelper.getAccount().getShopifyStoreUrl()%>'
             })
         }); --%>          	 
         loadSupports(vSupportPageNumber);         
         $('#product-next-btn').click(function(){
       	  vSupportPageNumber = vSupportPageNumber + 1;
       	  loadSupports(vSupportPageNumber);
         });
         
	  $('#product-prev-btn').click(function(){
		  vSupportPageNumber = vSupportPageNumber- 1;
		  loadSupports(vSupportPageNumber);
         });
     });           
     function loadSupports(page) {
 		$.ajax({type : "GET", url : 'customer/get-support?supportPageNumber='+ page,dataType : "json",
 			success : function(data) {
 				var support = data.support;
 				var html = '';
 				$.each(support,function(key, val) {
 					html += '<tr class="Polaris-DataTable__TableRow">' 
			             +      '      <td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--text" scope="row" style="height: 45px;">'+ val.status +'</td>'
			             +      '      <td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--text" style="height: 45px;">'+ val.ticketNo +'</td>'
			             +      '      <td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--text" style="height: 45px;">'+ val.subject +'</td>'
			             +      '      <td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--text" style="height: 45px;">'+ val.createdAt +'</td>'
			             +		'	   <td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--text" style="height: 45px;"> ' 
			            
			             +		'		</td>'
			             +      '</tr>'  
 		             
 				});
 				$('#helpDataTable tbody').html(html);
 				if(vSupportPageNumber == 1) {
 					$('#product-prev-btn').attr("disabled",true);
 				} else {
 					$('#product-prev-btn').attr("disabled",false);
 				}
 				var vCurrent = vSupportPageNumber * 10;
 				
 				if(data.totalRecord > vCurrent ) {
 					$('#product-next-btn').attr("disabled",false);
 				} else {
 					$('#product-next-btn').attr("disabled",true);
 				}
 			}
 		});
 	}
</script>
<%@ include file="footer.jspf" %>
</body>
</html>