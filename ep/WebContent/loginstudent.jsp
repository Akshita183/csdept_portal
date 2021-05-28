<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="css/loginstyle.css">
	<title>Login</title>
</head>
<body>

<div id='container'>
  <div class="row">
  
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="row" style="margin-top: 10px; margin-right:-20px; box-shadow: -1px 1px 10px 10px #07294d;">
					<div class="col-md-6">
						<h1 class="text-center" style="border-bottom: 3px solid #07294d;">SIGN IN</h1>
						<form action="loginactionstudent.jsp" method="post">
						<label class="label control-label">Email ID</label>
						<input type="email" class="form-control" name="email" placeholder="EmailID" required>
						<label class="label control-label">Password</label>
						<input type="password" class="form-control" name="pass" placeholder="Password" required>
						
						<br>
						<button type="submit" class="btn btn-info">SIGN IN</button>
						</form>
						<p class="text-center"> <a href="forgotpassword_s.jsp">FORGOT PASSWORD?</a>
						<br>
						New Member?<a href="signupstudent.jsp">Sign Up</a></p>
						<div >
  						<%
  							String msg=request.getParameter("msg");
  							if("not exist".equals(msg))
  							{
  						%>
  								<h3 class="text-center">Incorrect Email Or Password</h3>
  							<%} %>
  						<%
  							if("invalid".equals(msg))
  							{
  						%>
								<h3 class="text-center">Something went wrong! Try Again</h3>
							<%} %>
						</div>
					</div>
					 
					<div class="col-md-6">
						<img src="images/side.jpg">
					</div>
				</div>
			</div>
			<div class="col-md-3"></div>
	</div>
 
</div>

</body>
</html>