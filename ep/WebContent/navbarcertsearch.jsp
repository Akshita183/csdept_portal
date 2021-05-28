<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Navigation bar</title>
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css'>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.4/css/tether.min.css'>
    <link rel="stylesheet" href="css/navbarcoursestyle.css">
	
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
                    <a class="nav-link" href="#">Welcome&nbsp; <%= email %>&nbsp;&nbsp;<i class="fa fa-user-circle fa-2x" aria-hidden="true"></i></a>
                    <div class="dropdown-content">
    					<a href="viewprofile_s.jsp">View Profile</a>
    					<a href="updateprofile_s.jsp">Update Profile</a>
    					<a href="changepassword_s.jsp">Change Password</a>
  					</div>
                    </div>
                </li>
            </ul>
  		<a href="logout.jsp"><button class="btn btn-danger my-2 my-sm-0" type="submit">Logout</button></a>
        </div>
    </nav>
 <!-- Second navbar--> 
<div id="wrapper">
    
        <!-- Sidebar -->
    <nav class="navbar navbar-inverse fixed-top" id="sidebar-wrapper" role="navigation">
     <ul class="nav sidebar-nav">
       <div class="sidebar-header">
       <div class="sidebar-brand">
         <img src="http://www.sar-group.com/assets/frontend/images/aim-act-logo.jpg" width="100" height="40"></div></div>
       <li><a href="index.html">Home</a></li>
       <li><a href="index.html#faculty-sec">About</a></li>
       <li class="dropdown">
       <a href="#courses" class="dropdown-toggle"  data-toggle="dropdown">Courses <span class="caret"></span></a>
     <ul class="dropdown-menu animated fadeInLeft" role="menu">
      <li><a href="certificate.jsp">Certificate Courses</a></li>
      <li><a href="subject.jsp">Subject Courses</a></li>
      </ul>
      </li>
      <li><a href="bookmark.jsp">Bookmarked Courses</a></li>
      <li><a href="enroll.jsp">Enrolled Courses</a></li>
       <li><a href="notice_s.jsp">Notices</a></li>
        <li><a href="viewtimetable_s.jsp">TimeTable</a></li>
        <li><a href="quesforum_s.jsp">Q/A Forum</a></li> 
      <li><a href="index.html#contact-sec">Contact</a></li>
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
                                <a class="nav-link" href="studentlanding.jsp">COURSES</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="notice_s.jsp">NOTICES</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="viewtimetable_s.jsp">TIMETABLE</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="quesforum_s.jsp">Q/A FORUM</a>
                            </li>
                        </ul>
                        <div class="search">
            				<form action="searchcertcourse.jsp">
                				<input type="text" placeholder=" Search Courses" name="search">
                				<button>
                    			<i class="fa fa-search" style="font-size: 18px;"></i>
                			</button>
            				</form>
        				</div>
        				<form action="" id="sel" method="post" style="display:contents">
    						<select class = "select-css" name="valu" onchange = "this.form.submit();">
                            <option value="" disabled selected hidden>SORT</option>
                            <option value="AZ">A-Z Course Name</option>   
                            <option value="ZA">Z-A Course Name</option>  
                            </select>
                        </form>
                    </div>
               </nav>
               
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
  </body>
</html>