<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%String email = session.getAttribute("email").toString(); %>
<html>
<head>
	<title>Change Password</title>
	<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'>
	<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
	<link rel='stylesheet' href="css/Changepassword.css">
</head>
<body>
<div id='container'>
<div class="row">
    <div class="col-md-5 mx-auto p-0">
        <div class="card" style="margin-top:-20px;">
            <div class="box">
            <a href="studentlanding.jsp" class="close"></a>
            <h3 class="text-center" style="border-bottom: 3px solid #07294d;">RESET PASSWORD</h3>
            <div class="snip">
            <div class="space">
            	<div class="change">
                <form action="changepasswordaction_s.jsp" method="post">
                <div class="group"> 
                <label for="oldpass" class="label">Current Password</label> 
                <input id="oldpass" name="oldpass" type="password" class="input" data-type="password" placeholder="Enter Old Password" required> 
                </div>
                <div class="group"> 
                <label for="newpass" class="label">New Password</label> 
                <input id="newpass" name="newpass" type="password" class="input" data-type="password" placeholder="Enter New password" required> 
                </div>
                <div class="group"> 
                <label for="confirmpass" class="label">Confirm New Password</label>
                <input id="confirmpass" name="confirmpass" type="password" class="input" data-type="password" placeholder="Repeat Password" required>
                </div>                           
                <button type="submit" >Reset</button>
                </form>
                <div>
<%String msg=request.getParameter("msg");
if("notmatch".equals(msg)){ %>
	<h3 class="text-center">New password and Confirm password does not match!</h3>
<%}
if("wrong".equals(msg)){ %>
	<h3 class="text-center">Your old Password is wrong!</h3>
<%}
if("done".equals(msg)){ %>
	<h3 class="text-center">Password changed successfully!</h3>
<%}
if("invalid".equals(msg)){ %>
	<h3 class="text-center">Some thing went wrong! Try again!</h3>
<%}%>
                </div>
                </div>
            </div>
        	</div>
    		</div>
		</div>
	</div>
</div>
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