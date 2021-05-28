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
<% 
String quesid = request.getParameter("quesid");
String email = session.getAttribute("email").toString();
String addans = request.getParameter("addans");
%>
<div class = container>
<%try{
	Connection con = ConnectionProvider.getcon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from quesforum where quesid = '"+quesid+"'");
	while(rs.next()){ 
	session.setAttribute("quesid", quesid);	
%>

	<div class="quesbox">
		<h2><%= rs.getString(2)%></h2>
		<br>
        <h3><%= rs.getString(3)%></h3>
        <hr> <br>
        <button type="button" class="far fa-edit" onclick="location.href='addans.jsp'">Write Answer</button>  
        <h4 id="num"> <%= rs.getString(5)%> Answers</h4>
    </div>
    <br>
<%} %>
  
    <div class="body">
    <% Statement st1 = con.createStatement();
    ResultSet rs1=st1.executeQuery("select * from ansforum where quesid = '"+quesid+"'");
    while(rs1.next()){
    %>
    <div class="ansbox">
    <div class=box1>
    	<a href="deleteans.jsp?ansid=<%= rs1.getString(1)%>"><button id="Button" type="button" title= "Delete" class="fa fa-ellipsis-v"></button></a>
    	<h5>Posted by <u><%= rs1.getString(6)%></u></h5>
    </div>
    
    <div class="box2">
    	<div class="upper">
            <p><%= rs1.getString(2)%> </p>
		</div>
        <div class="lower">
        <div id="upvote">
        	<a href="upvote_ans.jsp?ansid=<%= rs1.getString(1)%> &quesid=<%=quesid%>"><button id="upbtn" title="Upvote" class="fas fa-arrow-up"></button></a>
           	<h4><%= rs1.getString(3)%></h4>	
        </div>
        <div id="downvote">
            <a href="downvote_ans.jsp?ansid=<%= rs1.getString(1)%> &quesid=<%=quesid%>"><button id="downbtn" title="Downvote" class="fas fa-arrow-down"></button></a>
            <h4><%= rs1.getString(4)%></h4>	
        </div>
        
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