<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "cssfiles.jsp" %>
	<style>
		
	</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<%@ include file = "hospitalfixedbodycontent.jsp" %>
	
	<h3 style="padding-left:270px">Notifications about requirement of specific blood type can be sent to the hospitals and clients in your area</h3>
	<br><br>
	
	<form action="/shristationery/client-notification/blood-donation-notification"  method="get">
		<p style="padding-left:270px">->Check the blood type required</p>
		<p style="padding-left:300px"><input type="checkbox" name="type" value="a"> A</p>
		<p style="padding-left:300px"><input type="checkbox" name="type" value="b"> B </p>
		<p style="padding-left:300px"><input type="checkbox" name="type" value="ab"> AB </p>
		<p style="padding-left:300px"><input type="checkbox" name="type" value="o"> O  </p>
		<input type="hidden" value="${email}" name="email">
		
		<p style="padding-left:300px"><input type="submit" value="Submit"></p>
	</form>
	
	
	<%@ include file = "scripts.jsp" %>
</body>
</html>