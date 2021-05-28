
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
     <link rel="stylesheet" href="css/coursestyle.css">
    
   
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
	
	
	<link href="css/flexslider.css" rel="stylesheet" />
    <link href="css/footer.css" rel="stylesheet" />    
    <!-- Google	Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css' />
  
</head>
<body>
<%String email=session.getAttribute("email").toString(); %>
    
 <!-- Second navbar--> 
<div id="wrapper">
    
<div id="navbar">
	
	</div>
      
             <div class="containercourse" id="course">  	

		<%
		String valu=request.getParameter("valu");
		Connection con=ConnectionProvider.getcon();
        Statement st1=con.createStatement();
		Statement st2=con.createStatement();
		Statement st3=con.createStatement();
			ResultSet rs=st1.executeQuery("SELECT * FROM course WHERE price IS NULL");
			int count=0;
			if(valu!=null)
			{
				if(valu.equals("AZ"))
				{
					rs=st1.executeQuery("select * from course WHERE price IS NULL order by cname");
				}
				if(valu.equals("ZA"))
				{
					rs=st1.executeQuery("select * from course WHERE price IS NULL order by cname DESC");
				}
			}
		
		
		while(rs.next())
		{ 
			count=count+1;
			//Viewing all courses
	%>

		<div class="course">
			<img class="course-image" src="filestuff/courseimages/<%= rs.getString(4) %>" alt="">

			<div class="category-flex">
<div class="category">Subject Course</div>
				<div class="course-user">

					<%
                ResultSet rs1=st2.executeQuery("select * from teacher where email='"+rs.getString(5)+"' "); 
                rs1.next();
                %>
                <img src="filestuff/tpics/<%= rs1.getString(5)  %>" alt="" class="course-user-image">
					<div class="course-user-details">
						<h1 class="title">
							<%= rs.getString(2)  %>
						</h1>
						<p class="name">
							by
							<%= rs1.getString(1)  %>
						</p>
					</div>
				</div>
			</div>

			<div class="metrics">
				<div class="rat">
					<i class="fa fa-star-o" aria-hidden="true"></i>
					<%= rs.getInt(7) %>
				</div>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#modal<%= rs.getString(1)%>">View Course</button>
			</div>
		</div>
		


		<div class="modal fade" id="modal<%= rs.getString(1) %>" tabindex="-1"
			role="dialog">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<a href="viewstudymat_s.jsp?cid=<%= rs.getString(1)%>"><span class="A" onclick=" "><i
								class="fa fa-book fa-2x" aria-hidden="true"></i></span></a>
								<span class="B"><i
							class="fa fa-star fa-2x" aria-hidden="true"></i>
							</span> <span class="C"><i
							class="fa fa-comment fa-2x" aria-hidden="true"></i></span>

						<div>
							<button type="button" class="btn-lg btn-close"
								data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
					</div>
					<div class="modal-body">
						<div class="cent"><div class="modal-title"><%= rs.getString(2) %></div>
							<hr></div>
							
						<div class="container-fluid">
							<img src="filestuff/courseimages/<%= rs.getString(4) %>" alt="">
							<div class="des">
								<p>
									<%= rs.getString(3) %></p>
							</div>
						</div>
						<div class="l-category">
							<span>Subject Course</span>
						</div>
					</div>
					<div class="modal-footer">
						<div class="user">
							<i class="fa fa-user-circle" aria-hidden="true"> by <%=rs1.getString(1) %></i>
						</div>
						    <button class="btn btn-primary"
							onclick="location.href ='bookmarkaction.jsp?CID=<%= rs.getString(1)%>'">Bookmark</button>
							
					</div>
				</div>
			</div>
		</div>
		


		<% } 
		
		if(count==0)
		{
		%>
		<h1 style="color:white">No Subject Course Present!</h1>
  <% }
		%>
	</div>


    </div>
    
    <div id="contact-footer">

</div>
    <!-- /#wrapper -->
<!-- partial -->

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
        $("#navbar").load("navbarsubsearch.jsp");
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