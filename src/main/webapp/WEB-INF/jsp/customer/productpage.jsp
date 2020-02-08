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
		       	<%@ include file="product.jspf" %>
		    	</div>
  			</div>
		</div>
</div>
<script src="${pageContext.request.contextPath}/vendors/js/vendor.bundle.base.js"></script>
<script type="text/javascript">
 	 var vProductPageNumber = 1;
     $(document).ready(function(){
         loadProducts(vProductPageNumber);
       
         $('#product-next-btn').click(function(){
       	  vProductPageNumber = vProductPageNumber + 1;
       	  loadProducts(vProductPageNumber);
       	  $('#pagenumber').html(vProductPageNumber + ' of ' + $('#totalRecord').val());
         });
         
	  $('#product-prev-btn').click(function(){
		  vProductPageNumber = vProductPageNumber- 1;
		  loadProducts(vProductPageNumber);
		  $('#pagenumber').html(vProductPageNumber + ' of ' + $('#totalRecord').val());
         });
     });
      
     function loadProducts(page) {
 		$.ajax({type : "GET", url : 'customer/get-product-data?productPageNumber='+ page,dataType : "json",
 			success : function(data) {
 				var products = data.products;
 				var totalRecord = Math.ceil(parseInt(data.totalRecord)/12);
 				console.log(totalRecord);
 				var html = '';
 				$.each(products,function(key, val) {
 					html += '<tr class="Polaris-DataTable__TableRow">' 
 		             +      '<td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--text" scope="row" style="height:15px;padding:1rem">'+ val.title +'</td>'
 		             +      '      <td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--text" style="height: 15px;padding:1rem">'+ val.productType +'</td>'
 		             +      '      <td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--text" style="height: 15px;padding:1rem">'+ val.vendor +'</td>';
 		             console.log(val.amazonListingStatus);

 		            
 		            
 		             
 		             if(val.amazonListingStatus!= null && val.amazonListingStatus == 'Linked'){           	 
 		          	 	html +='<td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--text" style="height: 20px;padding:1rem"><button role="tab" type="button" tabindex="-1" class="Polaris-Button Polaris-Button--primary" style="min-height:auto">'+ val.amazonListingStatus +'</button></td>';

 		             }		

 		            

 		            if(val.amazonListingStatus!= null && val.amazonListingStatus == 'Not Linked'){
 		           		html +='<td class="Polaris-DataTable__Cell Polaris-DataTable__Cell--text" style="height: 20px;padding:1rem"><button role="tab" type="button" tabindex="-1" class="Polaris-Button Polaris-Button" style="min-height:auto">'+ val.amazonListingStatus +'</button></td>';
 		            }	

 		            
 		           html +='</tr>';


 		           
 		           $('#totalRecord').val(totalRecord);
 		           console.log("From hidden : " + $('#totalRecord').val());

 		          //console.log(html);
 				});
 				$('#pagenumber').html(vProductPageNumber + ' of ' + $('#totalRecord').val());
 				$('#productDataTable tbody').html(html);
 				if(vProductPageNumber == 1) {
 					$('#product-prev-btn').attr("disabled",true);
 				} else {
 					$('#product-prev-btn').attr("disabled",false);
 				}
 				var vCurrent = vProductPageNumber * 12;
 				
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

