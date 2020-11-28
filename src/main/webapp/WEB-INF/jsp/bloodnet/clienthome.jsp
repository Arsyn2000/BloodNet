<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "cssfiles.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<style>
		.top-left {
  			position: absolute;
			top: 15px;
			left: 300px;
			
		}
	</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<%@ include file = "fixedbodycontent.jsp" %>
	<div class="card card-info">
        <img src = "${pageContext.request.contextPath}/adminlte/dist/img/blood-donation-month.jpg" height="530" width="1350" style="opacity:0.6">
        <div class="top-left">
        	<div class="card card-info">
        		“To the young and healthy it’s no loss. To sick it’s hope of life. Donate Blood to give back life.”
        	</div>
        </div>
    </div>
	<%@ include file = "scripts.jsp" %>
</body>
</html>
