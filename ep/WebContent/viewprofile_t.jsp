<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Your Profile</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/viewprofile.css" />
</head>
<body>
<% 
String email= session.getAttribute("email").toString();
try{
	Connection con = ConnectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from teacher where email='"+email+"'");
	while(rs.next()){
%>
    <div class="card">
        <div class="card-header">
            <img src="filestuff/tpics/<%= rs.getString(5)  %>" alt="Profile Image" class="profile-img">
        </div>
        <div class="card-body">
            <p class="full-name"><%=rs.getString(1)%></p>
            <p class="email"><%=rs.getString(3)%></p>
            <p class="class"><b>Designation:&nbsp;</b> <%=rs.getString(2)%></p>
            <p class="class"><b>Phone No:&nbsp;</b> <%=rs.getString(4)%></p>
            
            
        </div>
        <div class="card-footer">
            <div class="col vr">
                <a href="teacherlanding.jsp"><button type="button" class="btn btn-danger">Close</button></a>
            </div>
            <div class="col">
                <a href="updateprofile_t.jsp"><button type="button" class="btn btn-success">Update</button></a>
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