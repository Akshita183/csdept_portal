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
    <script src="https://kit.fontawesome.com/502af4205e.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/course11.css">
</head>
<body>

<%String email=session.getAttribute("email").toString();
String search=request.getParameter("search"); 
String msg=request.getParameter("msg");

if("removed".equals(msg))
{
%>
<div class="alert alert-success" role="alert">
Course Deleted Successfully!
</div>
<% }
if("notremoved".equals(msg))
{ %>
<h3 class="alert alert-danger">Sorry Course could not be deleted! Try Again!</h3>
<% } %>

<div id="navbarcourse">	
</div>


<div class="containercourse">
  <%

  try{
	  String valu=request.getParameter("valu");
	  Connection con=ConnectionProvider.getcon();
		Statement st1=con.createStatement();
		Statement st2=con.createStatement();		
		
		if(search!=null)
		{
			ResultSet rs=st1.executeQuery("select * from course where temail= '"+email+"' AND (cname like '%"+search+"%' or category like '%"+search+"%') ");
			if(valu!=null)
			{
				if(valu.equals("AZ"))
				{
					rs=st1.executeQuery("select * from course where temail= '"+email+"' AND (cname like '%"+search+"%' or category like '%"+search+"%') order by cname");
				}
				else if(valu.equals("ZA"))
				{
					rs=st1.executeQuery("select * from course where temail= '"+email+"' AND (cname like '%"+search+"%' or category like '%"+search+"%') order by cname DESC");
				}
			}
		
		
		int count=0;
		while(rs.next())
		{ 
	%>
	            <% count=count+1;%>
	            <div class="course">
                <img class="course-image" src="filestuff/courseimages/<%=rs.getString(4) %>" alt="">   <!--   ${pageContext.request.contextPath} -->
                <div class="category"><%= rs.getString(8) %></div>
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
                      by <%= rs1.getString(2)  %>
                    </p>
                  </div>
                </div>
                  <div class="metrics">
                    <div class="rat">
                      <i class="fa fa-star-o" aria-hidden="true"></i> <%= rs.getInt(7) %>
                    </div>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal<%= rs.getString(1)%>">View Course</button>
                    
              </div>
            </div>
 
    
	<div class="modal fade" id="modal<%= rs.getString(1) %>" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
          <div class="modal-header">
            <span class="A"><a href="viewstudymaterialteacher.jsp?cid=<%= rs.getInt(1) %>"><i class="fa fa-book fa-2x" aria-hidden="true"></i></a></span>
            <span class="B"><i class="fa fa-star fa-2x" aria-hidden="true"></i></span>
            <span class="C"><a href="viewfeedback.jsp?cid=<%= rs.getInt(1) %>"><i class="fa fa-comment fa-2x" aria-hidden="true"></i></a></span>
   			<span class="C"><a href="deletecourse.jsp?cid=<%=rs.getString(1) %>" onclick="checkdelete();"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="27" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
</svg></a></span>
            <div><button type="button" class="btn-lg btn-close" data-bs-dismiss="modal" aria-label="Close"></button> </div>
          </div>
          <div class="modal-body">
          <div class="cent">
            <div class="modal-title"><%= rs.getString(2) %></div>
            </div>
            <hr>
            <div class="container-fluid">
                <img src="filestuff/courseimages/<%= rs.getString(4) %>" alt="">
                <div class="des"><p> <%= rs.getString(3) %></p></div>
                </div>
                 <div class="l-category"><span><%= rs.getString(8) %></span></div>
              </div>
          <div class="modal-footer">
          
            <div class="user"><i class="fa fa-user-circle" aria-hidden="true"> by <%=rs1.getString(2) %></i></div>
            <% if(rs.getString(6)!=null)
            {
            %>
            <button class="price">Price : Rs <%= rs.getString(6) %></button>
            <a href="addstudymaterial1.jsp?cid=<%= rs.getInt(1) %>"><button type="button" class="btn btn-primary">Add Study Material</button></a>
            <% }
            else
            {
            %>
            <button type="button" class="btn btn-primary">Bookmark</button>
            <% } %>
          </div>
        </div>
      </div>
    </div>
 	<% }
		if(count==0)
		{
			System.out.println(count);
		%>
		<h1 style="color:white">NO course present!<br></h1>
	<div class="course">
		<%
		}
		else
		{ %>
			<div class="course">
		<%}
	}}
  catch(Exception e){
	  System.out.println(e);
  }
  %>
   <svg xmlns="http://www.w3.org/2000/svg" width="250" height="200" fill="#f5fffa" class="bi bi-file-plus-fill" viewBox="0 0 16 16">
   <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM8.5 6v1.5H10a.5.5 0 0 1 0 1H8.5V10a.5.5 0 0 1-1 0V8.5H6a.5.5 0 0 1 0-1h1.5V6a.5.5 0 0 1 1 0z"/>
   </svg>   <!--   ${pageContext.request.contextPath} -->
    <div class="category"></div>
    <div class="btn-right">
    <a href="addcourse1.jsp"> <button type="button" class="btn btn-dark btn-lg">ADD COURSE</button></a>
    </div> 
   </div>                                 
 </div>              
</div>


<div id="contact-footer">

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
   function checkdelete()
   {
	   return confirm('Are you sure you want to delete this course? All the course content will be erased on doing so.');
   }
</script>  
<script>
    $(function() {
        $("#navbarcourse").load("navbarcourse_t.jsp");
        $("#contact-footer").load("footer.html");
    });
</script>  
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>

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