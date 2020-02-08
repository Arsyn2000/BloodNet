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
		       	<%@ include file="faq.jspf" %>
		    	</div>
  			</div>
		</div>
</div>
<%@ include file="footer.jspf" %>
<script type="text/javascript">
 	 var vFaqPageNumber = 1;
     $(document).ready(function(){
   	 <%--  ShopifyApp.ready(function() {
             ShopifyApp.Bar.initialize({
                 title: 'Welcome',
                 apiKey: '<%=ConstantCodes.SHOPIFY_CLIENT_ID%>',
                 shopOrigin: '<%=CommonHelper.getAccount().getShopifyStoreUrl()%>'
             })
         }); --%>
       
         loadFaQ(vFaqPageNumber);
         
         $('#product-next-btn').click(function(){
        	 vFaqPageNumber = vFaqPageNumber + 1;
       		loadFaQ(vFaqPageNumber);
         });
         
	  	$('#product-prev-btn').click(function(){
	  		vFaqPageNumber = vFaqPageNumber- 1;
		  loadFaQ(vFaqPageNumber);
        });
     });
      
     function loadFaQ(page) {
  		$.ajax({type : "GET", url : 'customer/get-faq?productPageNumber='+ page,dataType : "json",
  			success : function(data) {
  				var products = data.faqs;
  				var html = '';
  				$.each(products,function(key, val) {
  					
                     html += '<tr class="Polaris-DataTable__TableRow">' 
     		             +      '<td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--text" scope="row" style="height:40px;">'+ val.question +'</td>'
     		             +      '     <td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--text" style="height: 40px; white-space:pre-wrap;">'+ val.answer +'</td>'
     		             +      '    </tr>';
  				});
  				$('#faqdata tbody').html(html);
  				if(vFaqPageNumber == 1) {
  					$('#product-prev-btn').attr("disabled",true);
  				} else {
  					$('#product-prev-btn').attr("disabled",false);
  				}
  				var vCurrent = vFaqPageNumber * 12;
  				
  				if(data.totalRecord > vCurrent ) {
  					$('#product-next-btn').attr("disabled",false);
  				} else {
  					$('#product-next-btn').attr("disabled",true);
  				}
  			}
  		});
     }
    </script>
</body>
</html>

