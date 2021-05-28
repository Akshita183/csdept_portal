<%@page errorPage="errorfile.jsp" %>
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AIM & ACT</title>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
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
 
<div>
	<div id="navbar">
	
	</div>
        <div class="containercourse" id="course">  	
		<%
		String valu=request.getParameter("valu");
		Connection con=ConnectionProvider.getcon();
        Statement st1=con.createStatement();
		Statement st2=con.createStatement();
		Statement st3=con.createStatement();
			ResultSet rs=st1.executeQuery("select * from course");
			int count=0;
			if(valu!=null){
				if(valu.equals("AZ")){
					rs=st1.executeQuery("select * from course order by cname");
				}
				if(valu.equals("ZA")){
					rs=st1.executeQuery("select * from course order by cname DESC");
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

                <%if(rs.getString(6)!=null)
	            { %> 
				<div class="category">Certificate Course</div>
				<% }
                if(rs.getString(6)==null)
                { %>
				<div class="category">Subject Course</div>
				<% } %>
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
					<%= rs.getString(7) %>
				</div>
				<button type="button" class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#modal<%= rs.getString(1)%>">View Course</button>
			</div>
		</div>
		

		<% if(rs.getString(6)!=null)   //if price!=null i.e Certificate course
          {
          int z=0;
          ResultSet rs2=st3.executeQuery("select * from enroll where course_id='"+rs.getString(1)+"' and email='"+email+"'");
          while(rs2.next()){
          z=1;
          }
          if(z==1)
          {   //modal popup in case Certificate Course is already enrolled
          %>
		<div class="modal fade" id="modal<%= rs.getString(1) %>" tabindex="-1"
			role="dialog">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<a href="viewstudymat_s.jsp?cid=<%= rs.getString(1)%>"><span class="A" onclick=" "><i
								class="fa fa-book fa-2x" aria-hidden="true"></i></span></a>
								<span class="B"><%= rs.getString(7) %><i
							class="fa fa-star fa-2x" aria-hidden="true"></i></span> 
							<span class="C"><i
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
							<span>Certificate Course</span>
						</div>
					</div>
					<div class="modal-footer">
						<div class="user">
							<i class="fa fa-user-circle" aria-hidden="true"> by <%=rs1.getString(1) %></i>
						</div>
						<button class="price">
							Price : Rs
							<%= rs.getString(6) %></button>
							
							<a tabindex="0" class="btn btn-primary"
							data-bs-toggle="popover" data-bs-placement="right"
							data-bs-trigger="focus"
							data-bs-content="Can't enroll!! Already present in Enrolled Courses">Enroll</a>
					</div>
				</div>
			</div>
		</div>
		<%
          }
          if(z==0)   //modal popup incase the course is not enrolled
          {
        	  
          %>
		<div class="modal fade" id="modal<%= rs.getString(1) %>" tabindex="-1"
			role="dialog">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<a id="A" tabindex="0" class="fa fa-book fa-2x"
							data-bs-toggle="popover" data-bs-placement="top"
							data-bs-trigger="focus"
							data-bs-content="Study Material can be accessed only after enrolling"></a>
						<a id="B" tabindex="0" class="fa fa-star fa-2x" role="button"
							data-bs-toggle="popover" data-bs-placement="top"
							data-bs-trigger="focus"
							data-bs-content="Rating can be given only after enrolling"></a>
					    <a id="C" tabindex="0" class="fa fa-comment fa-2x" role="button"
							data-bs-toggle="popover" data-bs-placement="top"
							data-bs-trigger="focus"
							data-bs-content="Feedback can be given only after enrolling"></a>

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
							<span>Certificate Course</span>
						</div>
					</div>
					<div class="modal-footer">
						<div class="user">
							<i class="fa fa-user-circle" aria-hidden="true"> by <%=rs1.getString(1) %></i>
						</div>
						<button class="price">
							Price : Rs <%= rs.getString(6) %></button>
						<button type="button" class="btn btn-primary"
							onclick="location.href ='email.jsp?CID=<%= rs.getString(1)%>'">Enroll</button>
					</div>
				</div>
			</div>
		</div>


		<% }
     } 
     if(rs.getString(6)==null)  // if price==null i.e It's a subject Course
    { // modal popup for subject courses
    %>
		<div class="modal fade" id="modal<%= rs.getString(1) %>" tabindex="-1"
			role="dialog">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<a href="viewstudymat_s.jsp?cid=<%= rs.getString(1)%>"><span class="A" onclick=" "><i
								class="fa fa-book fa-2x" aria-hidden="true"></i></span></a>
							<span class="B"><%= rs.getString(7) %><i
							class="fa fa-star fa-2x" aria-hidden="true"></i></span> 
							<span class="C"><i
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

		<%
        } }

		if(count==0)
		{
		%>
		<h1>No Course Present!</h1>
  <% } %> 
</div>

<div id="contact-footer">

</div>
    

</div>
<!-- /#wrapper -->
 
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous">
    </script>
		
    
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
        $("#navbar").load("navbarcourse_s.jsp");
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