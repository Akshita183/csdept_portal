
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<script src="js/bootstrap.js"></script>
	<link rel="stylesheet" type="text/css" href="css/signupstyle.css">
	<title>SignUP Teacher</title>
</head>
<body>
<div id='container'>
  <div class="col-md-3"></div>
			<div class="col-md-5" style= "margin-right:50px; box-shadow: 0px 0px 15px 4px rgb(54, 69, 79, 0.8)">
				<h1 class="text-center" style="border-bottom: 2px solid red;">REGISTER HERE</h1>
      			<form action="TeacherProfile" method="post" enctype="multipart/form-data">
      				<label class="label col-md-3 control-label">Name</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="name" placeholder="Name" required>
					</div>
      				<label class="label col-md-3 control-label">Designation</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="desig" placeholder="Designation" required>
					</div>
					<label class="label col-md-3 control-label">E-mail</label>
					<div class="col-md-9">
						<input type="email" class="form-control" name="email" placeholder="E-mail Id" required>
					</div>
					<label class="label col-md-3 control-label">Mobile Number</label>
					<div class="col-md-9">
						<input type="tel" class="form-control" name="phn" placeholder="0123456789" pattern="[0-9]{10}" required>
				</div>
					<label class="label col-md-3 control-label">Profile Photo</label>
					<div class="col-md-9">
      					<input type="file" class="form-control" name="pic" placeholder="Insert pic">
      				</div>
      				<label class="label col-md-3 control-label">Password</label>
					<div class="col-md-9">
						<input type="password" class="form-control" name="pass" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
						<small>Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters</small>
					</div>
					<label class="label col-md-3 control-label">Confirm Password</label>
					<div class="col-md-9">
						<input type="password" class="form-control" name="cpass" placeholder="Confirm Password" required>
					</div>
      				<label class="label col-md-3 control-label">Security Question</label>
					<div class="col-md-9">
					<select name="secques" class="form-control" id="secques" required>
 	 					<option value="What is the name of your first pet?">What is the name of your first pet?</option>
  	 					<option value="What is your birthday month?">What is your birthday month?</option>
  	 					<option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
  	 				</select>
					</div>
				
					<label class="label col-md-3 control-label">Security Answer</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="answer" placeholder="Enter Answer" required>
					</div>
				
				<div class="btn btn-info"><input type="submit" value="SIGN UP"></div>
      			</form>
      
     			<p>Already a Member?<a href="loginteacher.jsp">Sign in</a></p>
     			<div class='whysign'>
<% 
String msg=request.getParameter("msg");
if("password does not match".equals(msg))
{
%>
<h3 class="text-center">Confirm Password doesn't match with Password</h3>
<% } %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="text-center">Some thing Went Wrong! Try Again !</h3>
<% } %>
  </div>
			</div>
			<div class="col-md-3"></div>  
</div>

<script>
window.addEventListener( "pageshow", function ( event ) {
  var historyTraversal = event.persisted || 
                         ( typeof window.performance != "undefined" && 
                              window.performance.navigation.type === 2 );
  if ( historyTraversal ) {
    // Handle page restore.
    window.location.reload();
  }
});
</script>

</body>
</html>