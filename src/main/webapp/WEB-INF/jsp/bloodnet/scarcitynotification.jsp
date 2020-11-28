<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "cssfiles.jsp" %>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<%@ include file = "hospitalfixedbodycontent.jsp" %>
	<h1 style="padding-left:300px">Scarcity of Blood.Do you want to send a notification?(Notification goes to the admin and to the people in the hospital's proxomity)</h1>
	<table style=" margin-left: auto;margin-right: auto;">
		<tr>
			<td><a class="btn btn-info btn-sm" href="/shristationery/adminnotification/scarcity-notification?notification_data=${notificationdata}&type=${type}&sender=${email}">Yes</a></td>
			<td><a class="btn btn-info btn-sm" href="/shristationery/bloodnet/hospital-home?email=${email}">Cancel</a></td>
		</tr>
	</table>
	
	
	<%@ include file = "scripts.jsp" %>
	
</body>
</html>