<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Study Material Student</title>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="css/viewstudymaterial.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  
</head>
<body>
<div>
<div id="navbarcourse">

</div>
<% String email=session.getAttribute("email").toString();%>
<%
  String cid=request.getParameter("cid");
  try{
	  Connection con=ConnectionProvider.getcon();
		Statement st1=con.createStatement();
		Statement st2=con.createStatement();
		ResultSet rs1=st2.executeQuery("select * from course where course_id='"+cid+"' "); 
            rs1.next();
%>

<div class="card">

  <img src="filestuff/courseimages/<%= rs1.getString(4) %>" class="card-img" alt="..." width="300px" height="250px">
  <div class="card-img-overlay">
    <h5 class="card-course-title" ><%= rs1.getString(2) %></h5>
    <br>
    <p class="card-course-description" ><%= rs1.getString(3) %></p>
    <!-- <p class="card-text" >Last updated 3 mins ago</p> -->
  </div>
  <!-- TRYING SM CARDS -->

<div class="container">
 <%  
   ResultSet rs=st1.executeQuery("select * from studymaterial where course_id= '"+cid+"' order by sm_time desc");
		while(rs.next())
		{String sid=rs.getString(1).toString();    
            String stype=rs.getString(6);
            System.out.println("stype is " +stype);
%> 

    <div class="card mb-3" style="max-width: 540px;">
    <div class="card-header"><span><%= rs.getString(2)%></span>
    
    </div>
  <div class="row g-0">
    <div class="col-md-4">
    <% 
    if("PDF".equals(stype))
    {
    %>
    <img src="testimages/pdfimage.png" alt="..." height="100%" width="100%">
    <%
    }
      %>
      <% 
     if("Image".equals(stype))
    {
    	%>
    	<img src="testimages/picimage.png" alt="..." height="100%" width="100%">
    <% 	
    }
      %>
      <% 
     if("Video".equals(stype))
    {
    	%>
    	<img src="testimages/videoimage.png" alt="..." height="100%" width="100%">
    <%
		}
    %>
      <!--  <img src="testimages/videoimage.png" alt="..." height="100%" width="100%">-->
    </div>
    <div class="col-md-8">
      <div class="card-body">
         <%
       
    if("PDF".equals(stype))
    {
    %>
    <h5 class="card-title"><a href="viewpdf.jsp?sid=<%= rs.getString(1)%>" target="_blank"><%= rs.getString(4) %></a></h5>
    <%
    }
      %>
      <% 
     if("Image".equals(stype))
    {
    	%>
    	<h5 class="card-title"><a href="viewimage.jsp?sid=<%= rs.getString(1)%>" target="_blank"><%= rs.getString(4) %></a></h5>
    <% 	
    }
      %>
      <% 
     if("Video".equals(stype))
    {
    	%>
    	<h5 class="card-title"><a href="viewvideo.jsp?sid=<%= rs.getString(1)%>" target="_blank"><%= rs.getString(4) %></a></h5>
    <%
		}
    %>
        <!--  <h5 class="card-title"><a href="viewpdf.jsp?sid="rs1" target="_blank">rs4</a></h5>  -->
        <p class="card-text"><%= rs.getString(3)%></p>
        
      </div>
      <div class="card-footer">
            <p class="card-text"><small class="text-muted"><%= rs.getString(7)%></small></p>
          </div>
    </div>
  </div>
</div>

<% }//end of while
	
	
}//end of try
catch(Exception e)
  {
	  System.out.println(e);
  } %>
   
  </div>
  
  
  <!--  end of trying SM CARDS -->
</div>
<div id="contact-footer">
</div>
</div>
<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
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
       $("#navbarcourse").load("navbarsm_s.jsp");
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
