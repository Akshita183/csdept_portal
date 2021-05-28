<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Profile Teacher</title>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/updateprofile.css">
</head>
<body>
<div class="container">
<%
String email=session.getAttribute("email").toString();
try{
   		Connection con=ConnectionProvider.getcon();
  		Statement st=con.createStatement();
  		ResultSet rs=st.executeQuery("select * from teacher where email = '"+email+"'");
		while(rs.next()){ %>
<h1 class="text"><span class="glyphicon glyphicon-user"></span>Edit Profile</h1>
<hr>
<div class="container rounded bg-white mt-8 mb-8">
 
    <div class="row">
   
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
           <!--  <i class="fa fa-user-circle fa-5x" aria-hidden="true"></i>--> 
             <div class="pic"><img class="profpic" src="filestuff/tpics/<%=rs.getString(5)%>" alt=""></div>
            <span class="font-weight-bold"><%=rs.getString(1)%></span>
            <!-- <span class="text-black-50">rs.getString(5)</span> -->
            </div>
        </div>
        <div class="col-md-7">
        <a href="teacherlanding.jsp" class="close"></a>
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                    
                </div>
                <form action="UpdateProfileTeacher" method="post" enctype="multipart/form-data">
                <div class="row mt-2 mb-2">
                <input type="hidden" name="email" value="<%=rs.getString("email") %>">
                    
                    <div class="col-md-12"><label class="labels">Designation</label><input type="text" name="desig" class="form-control" value="<%=rs.getString("desig") %>"  ></div>
                    <div class="col-md-12"><label class="labels">Phone</label><input type="text" name="phn" class="form-control" value="<%=rs.getString("phn") %>"></div>
                    
                     <div class="col-md-12"><label class="labels">Change Profile Picture</label><input type="file" name="file" class="form-control" ></div>
                    
                    <div class="col-md-12"><label class="labels">Security Question</label>
                    	<select name="sec_ques" class="form-control" id="secques">
                    	<option value="" disabled selected hidden>Select Security Question</option>
 	 						<option>What is the name of your first pet?</option>
  	 						<option>What is your birthday month?</option>
  	 						<option>What is the name of the town where you were born?</option>
  	 					</select>
                    </div>
                    <div class="col-md-12"><label class="labels">Security Answer</label><input type="text" name="answer" class="form-control" value="<%=rs.getString("sec_ans") %>"></div>
                </div>
                
                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Update Profile</button></div>
                </form>
                <div>
<%
String msg = request.getParameter("msg");
if("valid".equals(msg)){
%>
	<h3 class="text-center">Profile Updated successfully</h3>
<%}
if("invalid".equals(msg)){
%>
	<h3 class="text-center">Something went wrong!</h3>
<%}%>
</div>
            </div>
        </div>
    </div>

</div>
<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
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