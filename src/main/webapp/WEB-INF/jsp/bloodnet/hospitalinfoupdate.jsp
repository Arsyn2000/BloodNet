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
            <h1 class="m-0 text-dark">Update your profile</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
	
	<!-- Horizontal Form -->
    <div class="card card-info">
        <form action="/shristationery/hospital/hospital-update?email=${email}" method="post" class="form-horizontal" >
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="name" id="name" placeholder="Name : ${name}">
            </div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="phone_number" id="phone_number" placeholder="Phone Number : ${phno}">
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="qty_a" id="qty_a" placeholder="Qty of type A : ${qtyA}">
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="qty_b" id="qty_b" placeholder="Qty of type B : ${qtyB}">
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="qty_ab" id="qty_ab" placeholder="Qty of type AB : ${qtyAB}">
			</div>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="qty_o" id="qty_o" placeholder="Qty of type O : ${qtyO}">
			</div>
			<div class="card-footer">
                <input type="submit" name="update" class="btn btn-info" value="Update" />
				<a style="font-size: 19px;" class="btn btn-info btn-sm" href="/shristationery/bloodnet/cancel-button?email=${email}">Cancel</a>
            </div>
        </form>
    </div>
    <div class="card card-info">
    	<a href="/shristationery/bloodnet/update-hospital-password?email=${email}">Update Password</a>
    	<a href="/shristationery/bloodnet/update-hospital-email?email=${email}">Update Email</a>
    	<a href="/shristationery/hospital/delete-hospital?email=${email}" onclick="return confirm('Are you sure you want to delete account?');">Delete Account</a>
    </div>
    
	
	<%@ include file = "scripts.jsp" %>
	
</body>
</html>