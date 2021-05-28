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
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css'>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.4/css/tether.min.css'>
    <link rel="stylesheet" href="css/navbarcoursestyle.css">
    <link rel="stylesheet" href="css/coursestyle.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/addstudymaterial.css">
	
  
</head>
<body>
<%String email=session.getAttribute("email").toString(); %>
 <!--First navbar-->
    <nav class="navbar navbar-expand-lg" id="firstnavbar">
  
        <img src="http://www.sar-group.com/assets/frontend/images/aim-act-logo.jpg" width="100" height="40">
  		<div class="collapse navbar-collapse" 
                id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                	<div class="dropdown">
                    <a class="nav-link" href="#">Welcome <%= email %>&nbsp;&nbsp;<i class="fa fa-user-circle fa-2x" aria-hidden="true"></i></a>
                    <div class="dropdown-content">
    					<a href="#examplemodalcenter" data-toggle="modal" data-target="#exampleModalCenter">View Profile</a>
    					<a href="updateprofile.jsp">Update Profile</a>
    					<a href="changepassword.jsp">Change Password</a>
  					</div>
                    </div>
                </li>
            </ul>
  		<button class="btn btn-danger my-2 
                my-sm-0" type="submit" onclick="location.href ='logout.jsp'">
                Logout
            </button>
        </div>
    </nav>
 <!-- Second navbar--> 
<div id="wrapper">
    
        <!-- Sidebar -->
    <nav class="navbar navbar-inverse fixed-top" id="sidebar-wrapper" role="navigation">
     <ul class="nav sidebar-nav">
       <div class="sidebar-header">
       <div class="sidebar-brand">
         <img src="http://www.sar-group.com/assets/frontend/images/aim-act-logo.jpg" id="logo" width="100" height="40"></div></div>
       <li><a href="index.html">Home</a></li>
       <li><a href="index.html#faculty-sec">About</a></li>
       <li><a href="teacherlanding.jsp">My Courses</a></li>
       <li><a href="#notices">Notices</a></li>
        <li><a href="viewteachertimetable.jsp">TimeTable</a></li>
         <li><a href="#calendar">Holiday Calendar</a></li>
      <li><a href="#contactus">Contact</a></li>
     </ul>
      
  </nav>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
        <nav class="navbar navbar-expand-lg" id="topnavbar-wrapper">
            <button type="button" class="hamburger animated fadeInLeft is-closed" data-toggle="offcanvas">
                <span class="hamb-top"></span>
    			<span class="hamb-middle"></span>
				<span class="hamb-bottom"></span>
            </button>
            
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="index.html">HOME</a>
                            </li>
                           
                            
                            <li class="nav-item">
                                <a class="nav-link" href="teacherlanding.jsp">MY COURSES</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">NOTICES</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="viewteachertimetable.jsp">TIMETABLE</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">QUORA</a>
                            </li>
                         
                        </ul>
                        
        				
                    </div>
               </nav>


<div class="container">
<% 
String cid= request.getParameter("cid");


  		try{
   			Connection con=ConnectionProvider.getcon();
  			Statement st=con.createStatement();
  			ResultSet rs=st.executeQuery("select * from course where course_id='"+cid+"'");
 			while(rs.next())
  			{ 
%>
<h1 class="text-primary"><span class="glyphicon glyphicon-user"></span>Upload Study Material</h1>
<hr>
<div class="container rounded bg-white mt-5 mb-5" style="padding:10px;">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
           
        
             <div class="pic"><img src="filestuff/courseimages/<%=rs.getString(4)%>" class="ss" alt=""></div>
        
          
            <span class="font-weight-bold"><%=rs.getString(2)%></span>
            <span class="text-black-50"><%=rs.getString(3)%></span>
            </div>
        </div>
        <div class="col-md-7">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Study Material Details</h4>
                </div>
                <form action="StudyMaterialServlet" method="post" enctype="multipart/form-data">
                
                    <div class="col-md-12"><label class="labels">Lecture Name</label><input type="text" name="sname" class="form-control" placeholder="Enter Lecture Name" required></div>
                    	
                 
                    <div class="col-md-12"><label class="labels">Lecture Description</label><textarea name="sdes" id="sdes" class="form-control" placeholder="Please Enter A Brief Description of the Material"></textarea></div>
                     <input type="hidden" name="cid" value="<%=cid %>">
                    <div class="col-md-12"><label class="labels">What type of Study Material would you like to upload?</label>
                    <select name="stype" class="form-control" id="stype" required>
 	 						<option>Image</option>
  	 						<option>PDF</option>
  	 						<option>Video</option>
  	 					</select>
  	 					</div>
                    <div class="col-md-12"><label class="labels">Upload Document</label><input type="file" name="file" class="form-control" placeholder="Upload Lecture Documents"></div>
               
                
                  <span><div class="mt-5 text-center"><input class="uploadbutton" value="Upload --->" type="submit"></div></span>
                <!-- <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Upload Study Material</button></div>-->
                
                </form>
            </div>
        </div>
    </div>
     </div>
<div>
<% String msg=request.getParameter("msg"); 
if("wrong".equals(msg))
{
%>
	<h3 class="alert alert-danger">Study Material Could Not Be Added! Try Again!</h3>
<%
}
%>
</div>

<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
</div>

<div id="contact-footer">
</div>

         </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->
<!-- partial -->


<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.4/js/tether.min.js'></script>
    <script  src="js/script.js"></script>  
           <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
    
    
                <!--  Jquery Core Script -->
    <script src="js/jquery-1.10.2.js"></script>
<!--  Core Bootstrap Script -->
    <script src="js/bootstrap.js"></script>
<!--  Flexslider Scripts --> 
    <script src="js/jquery.flexslider.js"></script>
<!--  Scrolling Reveal Script -->
    <script src="js/scrollReveal.js"></script>
<!--  Scroll Scripts --> 
    <script src="js/jquery.easing.min.js"></script>
<!--  Custom Scripts --> 
    <script src="js/custom.js"></script>      
       
       <script>
    $(function() {
        $("#contact-footer").load("footer.html");
    });
</script>  

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