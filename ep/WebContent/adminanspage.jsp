<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="refresh" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Answer Page</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://kit.fontawesome.com/502af4205e.js" crossorigin="anonymous"></script>
 	<link rel="stylesheet" href="css/ansstyle.css">
</head>

<body>
<% String quesid = request.getParameter("quesid"); 
String email = session.getAttribute("email").toString();
%>
<div class = container>
<%try{
	Connection con = ConnectionProvider.getcon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from quesforum where quesid = '"+quesid+"'");
	while(rs.next()){ 
	session.setAttribute("quesid", quesid);	
%>
<button id="arrow" class="fas fa-arrow-circle-left" onclick="window.open('adminquesforum.jsp')"></button>
	<div class="quesbox">
		<h4><%= rs.getString(2)%></h4>
        <p><%= rs.getString(3)%></p>
        <hr> <br>
        <p id="num"> <%= rs.getString(5)%> Answers</p> 
    </div>
<%} %>
  
    <div class="body">
    <% Statement st1 = con.createStatement();
    ResultSet rs1=st1.executeQuery("select * from ansforum where quesid = '"+quesid+"'");
    while(rs1.next()){
    %>
    <div class="ansbox">
    <div class=box1>
    	 <h5>Posted by <u><%= rs1.getString(6)%></u></h5>
    </div>
    
    <div class="box2">
    	<div class="left">
            <p><%= rs1.getString(2)%> </p>
		</div>
        <div class="right">
        <div id="upvote">
        	<i id="upbtn" class="fas fa-arrow-up"></i>
           	<h4><%= rs1.getString(3)%></h4>	
        </div>
        <div id="downvote">
            <i id="downbtn" class="fas fa-arrow-down"></i>
            <h4><%= rs1.getString(4)%></h4>	
        </div>
        <a href="delansadmin.jsp?ansid=<%= rs1.getString(1)%>"><button type="button" class="fa fa-ellipsis-h"></button></a>
        </div>
	</div>
	</div>
	<%} %>
	
	</div>
	
</div>
<% 
}
catch(Exception e){ System.out.println(e);}
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