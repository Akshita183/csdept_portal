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
    <link rel="stylesheet" href="css/course11.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/addstudymaterial.css">
	
  
</head>
<body>
<%String email=session.getAttribute("email").toString(); %>
 
<div id="navbaradmin">
 </div>   
             
        
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
                <form action="StudyMaterialAdmin" method="post" enctype="multipart/form-data">
                
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
    	$("#navbaradmin").load("navbaradmin.jsp");
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