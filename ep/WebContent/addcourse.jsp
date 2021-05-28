<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.4/css/tether.min.css'>
    <link rel="stylesheet" href="css/navbarcoursestyle.css">
    <link rel="stylesheet" href="css/addcourse.css">
    <link rel="stylesheet" href="css/footer.css"> 
</head>

<body>
<script>
function show1(){ document.getElementById('ddlViewBy').style.display = 'none'; }
function show2(){ document.getElementById('ddlViewBy').style.display = 'block'; }
</script>

<% String email=session.getAttribute("email").toString();%>
<div>
<div id="navbarcourse">	</div>
    
<div class="container">
<%	try{
   		Connection con=ConnectionProvider.getcon();
  		Statement st=con.createStatement();
  		ResultSet rs=st.executeQuery("select * from teacher where email='"+email+"'");
 		while(rs.next()){ %>
<h1 class="text-primary"><span class="glyphicon glyphicon-user"></span>ADD NEW COURSE</h1>
<hr>
<div class="container rounded bg-white mt-5 mb-5" style="padding:10px;">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
            <% if(rs.getString(5)==null) { %>
            	<i class="fa fa-user-circle fa-5x" aria-hidden="true"></i><div class="pic"><img class="profpic" src="filestuff/tpics/<%=rs.getString(5)%>" alt=""></div>
            <% }
            else { %>
            	<div class="pic"><img class="profpic" src="filestuff/tpics/<%=rs.getString(5)%>" alt=""></div>
			<% } %>
            
            <span class="font-weight-bold"><%=rs.getString(1)%></span>
            <span class="text-black-50"><%=rs.getString(3)%></span>
            </div>
        </div>
        <div class="col-md-7">
        <div class="p-3 py-5">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 class="text-right">Enter Course Details</h4>
            </div>
            <form action="UploadServlet" method="post" enctype="multipart/form-data">                
            <div class="col-md-12"><label class="labels">Course Title</label><input type="text" name="cname" class="form-control" placeholder="Enter Course name" required></div>                    	                 
            <div class="col-md-12"><label class="labels">Description</label><textarea name="cdes" id="cdes" class="form-control" placeholder="Please Enter A Brief Description"></textarea></div>
                 
            <div class="col-md-12"><br>
            <div class="ra">
				<input type="radio" name="category" value="Subject Course" onclick="show1()">
				<span>Subject Course</span>
				<input type="radio" name="category" value="Certificate Course" onclick="show2()">
				<span>Certificate Course</span>
			</div>
            <br></div>
            <div class="col-md-12" id="ddlViewBy"><label class="labels">Specify Price of the Certificate Course</label><input type="text" name="price" class="form-control" placeholder="Enter Price"></div>
   			<div class="col-md-12"><label class="labels">Upload a Course Picture</label><input type="file" name="file" class="form-control" ></div>
            <div class="mt-5 text-center" ><button class="btn btn-primary profile-button" type="submit">Add Course</button></div>
            </form>
        </div>
        </div>
    </div>
<div>
<% String msg=request.getParameter("msg");
if("done".equals(msg)){ %>
<div class="alert alert-success" role="alert">
	Course Added Successfully!
</div>
<% response.sendRedirect("teacherlanding.jsp"); }

if("wrong".equals(msg)){ %>
	<h3 class="alert alert-danger">Course Could Not Be Added! Try Again!</h3>
<% } %>
</div>

<%  		} }
catch(Exception e){
	System.out.println(e); }
%>
</div>
</div>

<div id="contact-footer"> </div>
</div>

<script  src="js/script.js"></script>  
<script  src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>    
<script> function checkdelete() {
	return confirm('Are you sure you want to delete this course? All the course content will be erased on doing so.'); } </script>
<script> $(function() {
    $("#navbarcourse").load("navbarcourse_t.jsp");
    $("#contact-footer").load("footer.html"); }); </script> 
    
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
