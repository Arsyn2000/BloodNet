<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "cssfiles.jsp" %>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<%@ include file = "fixedbodycontent.jsp" %>
	
	<form action="/shristationery/bloodnet/blood-donation-notification"  method="get">
		<p style="padding-left:270px">->Check the blood type required</p>
		<p style="padding-left:300px"><input type="radio" name="type" value="a"> A</p>
		<p style="padding-left:300px"><input type="radio" name="type" value="b"> B </p>
		<p style="padding-left:300px"><input type="radio" name="type" value="ab"> AB </p>
		<p style="padding-left:300px"><input type="radio" name="type" value="o"> O  </p>
		<input type="hidden" value="${email}" name="email">
		
		<p style="padding-left:300px"><input type="submit" value="Submit"></p>
	</form>
	
	<%@ include file = "scripts.jsp" %>
	</body>
</html>