<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Course</title>
<script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/addcourse.css">
</head>
<body>

<script>
function show1(){
	  document.getElementById('ddlViewBy').style.display = 'none';
	}
	function show2(){
	  document.getElementById('ddlViewBy').style.display = 'block';
	}
	</script>


<div class="container">
<%String email=session.getAttribute("email").toString(); 

  		try{
   			Connection con=ConnectionProvider.getcon();
  			Statement st=con.createStatement();
  			//ResultSet rs=st.executeQuery("select * from teacher where email='"+email+"'");
 			
%>
<h1 class="text-primary"><span class="glyphicon glyphicon-user"></span>ADD NEW COURSE ADMIN</h1>
<hr>
<div class="container rounded bg-white mt-5 mb-5" style="padding:10px;">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
            	  <div class="pic"><img class="profpic" src="tpics/admin.jpg" alt=""></div>
        
           
            
            <span class="font-weight-bold">ADMIN</span>
           
            </div>
        </div>
        <div class="col-md-7">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Enter Course Details</h4>
                </div>
                <form action="UploadCourseAdmin" method="post" enctype="multipart/form-data">
                <div class="col-md-12"><label class="labels">Select Teacher</label>
                <select class ="form-control" name="tname">
				<option value="" disabled selected hidden>Select Teacher's name</option>
   <%
       
       Statement st2=con.createStatement();
       ResultSet rs1=st2.executeQuery("select name from teacher");
       while(rs1.next())
       {
       %>
       <option value="<%= rs1.getString(1)%>"><%= rs1.getString(1)%></option>
      <% } %>           
</select>
</div>
        <br>
                
                    <div class="col-md-12"><label class="labels">Course Title</label><input type="text" name="cname" class="form-control" placeholder="Enter Course name" required></div>
                    	
                 
                    <div class="col-md-12"><label class="labels">Description</label><textarea name="cdes" id="cdes" class="form-control" placeholder="Please Enter A Brief Description"></textarea></div>
                  <!--  <div class="col-md-12"><label class="labels">Choose Course Category</label>
                    	<select name="category" class="form-control" id="category" required>
 	 						<option>Subject Course</option>
  	 						<option>Certificate Course</option>
  	 					</select>
                    </div> 
                    
                     <div class="col-md-12"><label class="labels">Specify Price of the Course (if any)</label><input type="text" name="price" class="form-control" placeholder="Enter Price" ></div> -->
                     
                       
                     <div class="col-md-12"><label class="labels">Choose Course Category</label>
                  
                     
       <div class="col-md-12">
                  <br>
           <div class="ra">
<input type="radio" name="category" value="Subject Course" onclick="show1()">
<span>Subject Course</span>
<input type="radio" name="category" value="Certificate Course" onclick="show2()">
<span>Certificate Course</span>
</div>
            <br>
            </div>
            </div>
           
             
            
             <div class="col-md-12" id="ddlViewBy"><label class="labels">Specify Price of the Certificate Course</label><input type="text" name="price" class="form-control" placeholder="Enter Price"></div>
            
                 
                    
                    <div class="col-md-12"><label class="labels">Upload a Course Picture</label><input type="file" name="file" class="form-control" ></div>
                </div>
               
                <div class="mt-5 text-center" ><button class="btn btn-primary profile-button" type="submit">Add Course</button></div>
                
                </form>
            </div>
        </div>
    </div>
<div>
<% String msg=request.getParameter("msg");

if("done".equals(msg))
{
%>
<div class="alert alert-success" role="alert">
  Course Added Successfully!
</div>
<% response.sendRedirect("adminlanding.jsp");%>
<% 
}
%>
<% 
if("wrong".equals(msg))
{
%>
	<h3 class="alert alert-danger">Course Could Not Be Added! Try Again!</h3>
<%
}
%>
</div>

<%
  			
}
catch(Exception e){
	System.out.println(e);
}
%>
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