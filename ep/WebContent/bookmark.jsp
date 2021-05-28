
	<%@page errorPage="errorfile.jsp" %>
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bookmark Course</title>
 <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css'>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.4/css/tether.min.css'>
    <link rel="stylesheet" href="css/bookmark.css">
    <!-- Google	Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css' />
</head>
<body>
<%String email=session.getAttribute("email").toString(); %>
 

<div id="page-content-wrapper">
 
<div id="navbar">	
</div>       

	<%
	String delete=request.getParameter("delete");
	
    if(delete!=null)
    {
    	%>
    	<h1>Course Deleted</h1>
    	<%
    }
           
            String msg=request.getParameter("msg");
            if(msg!=null){
            if("invalid".equals(msg))
            {
            %>
	<h1>Cannot Add!!!Already present in Bookmarked Courses!</h1>
	<% }
            if("valid".equals(msg)){
                %>
	        <h1>Course Added to Bookmarked Courses!</h1>
	        <div class="containercourse">
		<%
            }
            } 
	    Connection con=ConnectionProvider.getcon();
		Statement st1=con.createStatement();
		Statement st2=con.createStatement();
		Statement st3=con.createStatement();
        Statement st4=con.createStatement();
        String search=request.getParameter("search");
		
            %>
            <div class="containercourse">
		<%
		ResultSet rs=st1.executeQuery("select * from bookmark where email='"+email+"' ");
		int zii=0;
		while(rs.next())
		{ 
			zii=zii+1;
                ResultSet rs1=st2.executeQuery("select * from course where course_id='"+rs.getString(2)+"' "); 
                rs1.next();
                ResultSet rs2=st3.executeQuery("select * from teacher where email='"+rs1.getString(5)+"' "); 
                rs2.next();
                %>

		<div class="course">
			<img class="course-image" src="filestuff/courseimages/<%= rs1.getString(4) %>" alt="">

			<div class="category-flex">
				<div class="category"><%= rs1.getString(8) %></div>
				<div class="course-user">
					<img src="filestuff/tpics/<%= rs2.getString(5)%>" alt=""
						class="course-user-image">
					<div class="course-user-details">
						<h1 class="title">
							<%= rs1.getString(2)  %>
						</h1>
						<p class="name">
							by
							<%= rs2.getString(1)  %>
						</p>
					</div>
				</div>
			</div>

			<div class="metrics">
				<div class="A">
					<a href="viewstudymat_s.jsp?cid=<%= rs1.getString(1)%>"><i class="fa fa-book fa-lg" aria-hidden="true"></i></a>
				</div>
				<div class="rat">
					<i class="fa fa-star fa-lg" aria-hidden="true"></i><%= rs1.getString(7) %></div>
				<div class="A" onclick="location.href ='givefeedback.jsp?cid=<%=rs1.getString(1)%>'">
					<i class="fa fa-comment fa-lg" aria-hidden="true"></i></div>
				<div class="C" onclick="location.href ='bookmarkdelete.jsp?mssg=<%=rs.getString(2)%>'">
					<i class="fa fa-trash fa-lg" aria-hidden="true"></i>
				</div>
			</div>
		</div>
		<% }
		%>
	</div>
	<%
	if(zii==0)
		{
		%>
		<h1>No Course present!</h1>
		<% } 
		%>
   </div>
 
 <div id="contact-footer">

</div>  
</div>

<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
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
        $('[data-bs-toggle="popover"]').popover();
        $("#navbar").load("navbarsm_s.jsp");
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
        