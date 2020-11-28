<!DOCTYPE html>
<html>
	<head>
	<script>document.write('<base href="' + location.protocol + '//' + location.host + '${pageContext.request.contextPath}/' + '" />');</script>
	  <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <title>Blood Net | Log in</title>
	  <!-- Tell the browser to be responsive to screen width -->
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	
	  <!-- Font Awesome -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/plugins/fontawesome-free/css/all.min.css">
	  <!-- Ionicons -->
	  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	  <!-- icheck bootstrap -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
	  <!-- Theme style -->
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/adminlte/dist/css/adminlte.min.css">
	  <!-- Google Font: Source Sans Pro -->
	  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	</head>
	<body class="hold-transition login-page">
	<div class="login-box">
	  <div class="login-logo">
	    <b>Blood</b>Net
	  </div>
	  <!-- /.login-logo -->
	  <div class="card">
	    <div class="card-body login-card-body">
	      <p class="login-box-msg">Enter OTP sent to your mail to reset password</p>
	      
	      <form action="/shristationery/bloodnet/password-recovery" method="post">
	        <div class="input-group mb-3">
	          <input class="col-12" type="text" name="otp" class="form-control" placeholder="Enter OTP" required>
	        </div>
	        <div class="row">
	          <div class="col-4">
	            <button type="submit" class="btn btn-primary btn-block">Submit</button>
	          </div>
	        </div>
	       </form>
		   <!-- jQuery -->
		   <script src="${pageContext.request.contextPath}/adminlte/plugins/jquery/jquery.min.js"></script>
		   <!-- Bootstrap 4 -->
		   <script src="${pageContext.request.contextPath}/adminlte/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		   <!-- AdminLTE App -->
		   <script src="${pageContext.request.contextPath}/adminlte/dist/js/adminlte.min.js"></script>
	</body>
</html>

