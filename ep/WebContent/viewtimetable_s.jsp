<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<%String email=session.getAttribute("email").toString(); %>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Time Table</title>
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css'>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.4/css/tether.min.css'>
    <link rel="stylesheet" href="css/navbarcoursestyle.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/viewtimetable.css">
	<link href="css/flexslider.css" rel="stylesheet" />
    <link href="css/footer.css" rel="stylesheet" />
</head>
<body>
 <!--First navbar-->
    <nav class="navbar navbar-expand-lg" id="firstnavbar">
  
        <img src="http://www.sar-group.com/assets/frontend/images/aim-act-logo.jpg" width="100" height="40">
  		<div class="collapse navbar-collapse" 
                id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                	<div class="dropdown">
                    <a class="nav-link" href="#">Welcome&nbsp; <%= email %>&nbsp;&nbsp<i class="fa fa-user-circle fa-2x" aria-hidden="true"></i></a>
                    <div class="dropdown-content">
    					<a href="viewprofile_s.jsp" data-toggle="modal" data-target="#exampleModalCenter">View Profile</a>
    					<a href="updateprofile_s.jsp">Update Profile</a>
    					<a href="changepassword_s.jsp">Change Password</a>
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
      <li><a href="#index.html#contact-sec">Contact</a></li>
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
                     
        				
                    </div>
               </nav>
               
               
               <div class="box" id="box"> 
<br>
<%        
          Connection con=ConnectionProvider.getcon();
          Statement st=con.createStatement();
         
          ResultSet r=st.executeQuery("select class from student where email='"+email+"' ");
          r.next();
          String value=r.getString(1);
          System.out.println(value);
          Statement st1=con.createStatement();
          String w[]=new String[5];
          for(int i=0; i<=4;i++)
          {
          ResultSet rs=st1.executeQuery("select details from student_timetable where period='"+(i+1)+"' AND day='Wednesday' AND class='"+value+"' ");
          rs.next();
          w[i]=rs.getString(1);
          }
          String thur[]=new String[5];
          for(int i=0; i<=4;i++)
          {
          ResultSet rs=st1.executeQuery("select details from student_timetable where period='"+(i+1)+"' AND day='Thursday' AND class='"+value+"' ");
          rs.next();
          thur[i]=rs.getString(1);
          }
          String fri[]=new String[5];
          for(int i=0; i<=4;i++)
          {
          ResultSet rs=st1.executeQuery("select details from student_timetable where period='"+(i+1)+"' AND day='Friday' AND class='"+value+"' ");
          rs.next();
          fri[i]=rs.getString(1);
          }
          String sat[]=new String[5];
          for(int i=0; i<=4;i++)
          {
          ResultSet rs=st1.executeQuery("select details from student_timetable where period='"+(i+1)+"' AND day='Saturday' AND class='"+value+"' ");
          rs.next();
          sat[i]=rs.getString(1);
          }
          String sun[]=new String[5];
          for(int i=0; i<=4;i++)
          {
          ResultSet rs=st1.executeQuery("select details from student_timetable where period='"+(i+1)+"' AND day='Sunday' AND class='"+value+"' ");
          rs.next();
          sun[i]=rs.getString(1);
          }
          String mon[]=new String[5];
          for(int i=0; i<=4;i++)
          {
          ResultSet rs=st1.executeQuery("select details from student_timetable where period='"+(i+1)+"' AND day='Monday' AND class='"+value+"' ");
          rs.next();
          mon[i]=rs.getString(1);
          }
          %>
          <h1 id="head">Student Timetable</h1>
        <table class="container">
            <thead>
                <tr>
                    <th>
                        <h1>DAYS</h1>
                    </th>
                    <th>
                        <h1>09:00-10:10</h1>
                        <h1 class="period">1</h1>
                    </th>
                    <th>
                        <h1>10:20-11:30</h1>
                        <h1 class="period">2</h1>
                    </th>
                    <th>
                        <h1>11:40-12:50</h1>
                        <h1 class="period">3</h1>
                    </th>
                
                    <th>
                        <h1>02:00-03:10</h1>
                        <h1 class="period">5</h1>
                    </th>
                    <th>
                        <h1>03:20-4:30</h1>
                        <h1 class="period">6</h1>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Wednesday</td>
                    
                    
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%= w[j]%>
                    </td>
                     <% } %>
                </tr>
                <tr>
                    <td>Thursday</td>
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%= thur[j]%>
                    </td>
                     <% } %>
                </tr>
                <tr>
                    <td>Friday</td>
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%= fri[j]%>
                    </td>
                     <% } %>
                    
                </tr>
                <tr>
                    <td>Saturday</td>
                   <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%= sat[j]%>
                    </td>
                     <% } %>
                </tr>
                <tr>
                    <td>Sunday</td>
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%= sun[j]%>
                    </td>
                     <% } %>
                </tr>
                <tr>
                    <td>Monday</td>
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%= mon[j]%>
                    </td>
                     <% } %>
                </tr>
            </tbody>
        </table>

       
        <br><br>
</div>
          
        </div>     
               
        </div>
        <!-- /#page-content-wrapper -->
<div id="contact-footer">

</div>
</div>
    <!-- /#wrapper -->

  
    <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.4/js/tether.min.js'></script>
    <script  src="js/script.js"></script>
    <script src='https://code.jquery.com/jquery-3.5.1.slim.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
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




