<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>teacher</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
  
<link href="css/coursestyle.css" rel="stylesheet">
  
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>



<% String msg=request.getParameter("msg");

if("removed".equals(msg))
{
%>
<div class="alert alert-success" role="alert">
  Course Deleted Successfully!
  <% response.sendRedirect("adminlanding.jsp"); %>
</div>
<% 
}
if("notremoved".equals(msg))
{
%>
	<h3 class="alert alert-danger">Sorry Course could not be deleted! Try Again!</h3>
<% } %>

<div class="containercourse">
  <%
  String email=session.getAttribute("email").toString();
  try{
	  Connection con=ConnectionProvider.getcon();
		Statement st1=con.createStatement();
		Statement st2=con.createStatement();
		ResultSet rs=st1.executeQuery("select * from course");
		while(rs.next())
		{ 
	%>
	
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
            <span class="A"><a href="viewstudymatadmin.jsp?cid=<%= rs.getInt(1) %>"><i class="fa fa-book fa-2x" aria-hidden="true"></i></a></span>
            <span class="B"><i class="fa fa-star fa-2x" aria-hidden="true"></i></span>
            <span class="C"><a href="viewfeedback.jsp?cid=<%= rs.getInt(1) %>"><i class="fa fa-comment fa-2x" aria-hidden="true"></i></a></span>
   			<span class="d-inline-block" tabindex="0" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="Delete Course">
 <a href="deletecourseadmin.jsp?cid=<%=rs.getString(1) %>" onclick="checkdelete();"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="27" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
</svg></a></span>
            <div><button type="button" class="btn-lg btn-close" data-bs-dismiss="modal" aria-label="Close"></button> </div>
          </div>
          <div class="modal-body">
            <div class="modal-title"><%= rs.getString(2) %></div><hr>
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
            <a href="addstudymatadmin.jsp?cid=<%= rs.getInt(1) %>"><button type="button" class="btn btn-primary">Add Study Material</button></a>
            <% }
            else
            {
            %>
            <% } %>
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
   function checkdelete()
   {
	   return confirm('Are you sure you want to delete this course? All the course content will be erased on doing so.');
   }
   
   //For Delete Popover
   $(document).ready(function(){
     $('[data-toggle="popover"]').popover();
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