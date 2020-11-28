<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "cssfiles.jsp" %>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<%@ include file = "hospitalfixedbodycontent.jsp" %>
 	<!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Update your password</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <div class="card card-info">
    	<form action="/shristationery/hospital/hospital-password-update?email=${email}" method="post" class="form-horizontal" >
            <div class="input-group mb-3">
				<input type="password" class="form-control" name="password" id="password" placeholder="Enter your current password" required>
            </div>
            <div class="input-group mb-3">
				<input type="password" class="form-control" name="new_password1" id="new_password1" placeholder="Enter new password" required>
            </div>
            <div class="input-group mb-3">
				<input type="password" class="form-control" name="new_password2" id="new_password2" placeholder="Re-enter new password" required>
            </div>
            <div class="card-footer">
                <input type="submit" name="update" class="btn btn-info" value="Update" />
				<a style="font-size: 19px;" class="btn btn-info btn-sm" href="/shristationery/bloodnet/cancel-button?email=${email}">Cancel</a>
            </div>
    	</form>
    	
    </div>
    <%@ include file = "scripts.jsp" %>
	
</body>
</html>