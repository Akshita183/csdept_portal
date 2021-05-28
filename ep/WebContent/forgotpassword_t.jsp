
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel='stylesheet' href='css/forgotpassword.css'>
<title>Forgot Password</title>
</head>
<body>

<div class="panel">
		<div class="state"><br><i class="fa fa-key"></i><br><h1>Forgot Password</h1></div>
		<div class="form">
		<form action="forgotpasswordaction_t.jsp" method="post">
			<input type="email" name="email" placeholder="Enter Email" required>
			<select name="sec_ques">
				<option value="What is the name of your first pet?">What is the name of your first pet?</option>
				<option value="What is your birthday month?">What is your birthday month?</option>
				<option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
			</select>
			<input type="text" name="sec_ans" placeholder="Enter Answer" required>
			<input type="password" name="newpass" placeholder="Enter New Password" required>
    		<button type="submit" class="btn btn-info btn-block btn-round">Save</button>
		</form>
		</div>
		<br>
		<h2>Back to&nbsp;&nbsp;&nbsp;&nbsp;<a href="loginteacher.jsp">SIGN IN</a></h2>
		<div >
		<br>
	<% String msg = request.getParameter("msg");
	if("done".equals(msg)){
	%>
		<h3>Password Changed successfully</h3>
	<%}%>
	<%if("invaild".equals(msg)){
	%>
		<h3>Incorrect Details! Try Again</h3>
	<%} %>
	
	</div>
	</div>	

</body>
</html>