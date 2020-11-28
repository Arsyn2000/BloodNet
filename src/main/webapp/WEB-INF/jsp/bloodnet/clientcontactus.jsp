<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "cssfiles.jsp" %>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<%@ include file = "fixedbodycontent.jsp" %>
	
	<section class="content">
      <div>
        <div class="row">
          <div class="col-md-12">
            <div  style="padding-left:300px">
              <div>
                <h3>Fill the following form to submit your query</h3>
              </div>
              <form role="form" action="/shristationery/adminnotification/client-contact-us-notification" method="get">
                <div class="card-body">
                  <div class="form-group">
                    <label>Email Address</label>
                    <input type="text" name="sender" class="form-control" id="email_id" placeholder="${email}">
                  </div>
                  <div class="form-group">
                	<label>Textarea</label>
                	<textarea class="form-control" name="notification_data" rows="3" placeholder="I'm interested in learning more about..."></textarea>
                  </div>
                </div>
                <div>
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
    <br>
    <br>
    <br>
    <br>
    <h6 style="padding-left:300px" class="footer">We'll get to you soon.Keep checking your notifications.</h6>
    
	
	<%@ include file = "scripts.jsp" %>
</body>
</html>