<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "cssfiles.jsp" %>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<%@ include file = "fixedbodycontent.jsp" %>
	<!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Update your profile</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
	
	<!-- Horizontal Form -->
    <div class="card card-info">
        <form action="/shristationery/client/client-update?email=${email}" method="post" class="form-horizontal" >
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="first_name" id="first_name" placeholder="First Name : ${fname}">
            </div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="last_name" id="last_name" placeholder="Last Name : ${lname}">
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="phone_number" id="phone_number" placeholder="Phone Number : ${phno}">
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="blood_group" id="blood_group" placeholder="Blood Group(Ex. A,B,AB,O) : ${blood_group}">
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="birth_date" id="birth_date" placeholder="Birth Date(yyyy/MM/dd) : ${birth_date}">
			</div>
			<div class="card-footer">
                <input type="submit" name="update" class="btn btn-info" value="Update" />
				<a style="font-size: 19px;" class="btn btn-info btn-sm" href="/shristationery/bloodnet/client-cancel-button?email=${email}">Cancel</a>
            </div>
        </form>
    </div>
    <div class="card card-info">
    	<a href="/shristationery/bloodnet/update-password?email=${email}">Update Password</a>
    	<a href="/shristationery/bloodnet/update-email?email=${email}">Update Email</a>
    	<a href="/shristationery/client/delete-client?email=${email}" onclick="return confirm('Are you sure you want to delete account?');">Delete Account</a>
    </div>
    
	
	<%@ include file = "scripts.jsp" %>
	
</body>
</html>