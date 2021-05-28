<%@page errorPage="errorfile.jsp" %>    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Admin Landing</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/adminlanding.css">
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <img src="http://www.sar-group.com/assets/frontend/images/aim-act-logo.jpg" width="100" height="40">
    </div>
    <ul class="nav navbar-nav">
      <li><a href="index.html">HOME</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">VIEW<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="admincourse.jsp">Courses</a></li>
          <li><a href="adminquesforum.jsp">Q/A Forum</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">ADD<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="addcourseadmin.jsp">Courses</a></li>
          <li><a href="addnotice.jsp">Notices</a></li>
          <li><a href="addtimetable_s.jsp">Student TimeTable</a></li>
          <li><a href="addtimetable_t.jsp">Teacher TimeTable</a></li>
          
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">EDIT<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="timetableadmin_s.jsp">Student TimeTable</a></li>
          <li><a href="timetableadmin_t.jsp">Teacher TimeTable</a></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    <a href="logout.jsp"><button class="btn btn-danger my-2 my-sm-0" id="logbut" type="submit">Logout</button></a>
    </ul>
  </div>
</nav>


<div class="welcome" style="background-image:url(images/weladmin.jpg);" >
<h1><strong>WELCOME ADMIN</strong></h1>
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
