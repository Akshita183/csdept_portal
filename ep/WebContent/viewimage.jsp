<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Image Document</title>
</head>
<body>
<%
String sid=request.getParameter("sid").toString();
try{
	  Connection con=ConnectionProvider.getcon();
		Statement st1=con.createStatement();
		
		ResultSet rs=st1.executeQuery("select * from studymaterial where sm_id= '"+sid+"'");
		rs.next();

%>
<img src="filestuff/studymaterial/<%= rs.getString(4) %>" alt="<%= rs.getString(2) %>">
<%
}
catch(Exception e)
{
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