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
            <h1 class="m-0 text-dark">Update your Email</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <div class="card card-info">
    	<form action="/shristationery/hospital/hospital-email-id-update" method="post" class="form-horizontal" >
    		<div class="input-group mb-3">
				<input type="text" class="form-control" name="phone_number" id="phone_number" placeholder="Enter phone number" required>
            </div>
    		<div class="input-group mb-3">
				<input type="email" class="form-control" name="email_id" id="email_id" placeholder="Enter your current email" required>
            </div>
            <div class="input-group mb-3">
				<input type="email" class="form-control" name="email_id1" id="email_id1" placeholder="Enter new email" required>
            </div>
            <div class="input-group mb-3">
				<input type="email" class="form-control" name="email_id2" id="email_id2" placeholder="Re-enter new email" required>
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