<html>
<head>
</head>
<body>
<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String quesid = session.getAttribute("quesid").toString();
String ansid = request.getParameter("ansid"); 
try{
	Connection con = ConnectionProvider.getcon();
	Statement s = con.createStatement();
	Statement st = con.createStatement();
	ResultSet rs = s.executeQuery("select email from ansforum where ansid = '"+ansid+"'");
	rs.next();
	String emailid = rs.getString(1);
	if(email.equals(emailid)){
		st.executeUpdate("Delete from ansforum  where ansid = '"+ansid+"'");
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("select countans from quesforum where quesid = '"+quesid+"'");
		rs1.next();
		int countans = rs1.getInt(1);
		countans = countans-1;
		
		Statement stmt = con.createStatement();
		stmt.executeUpdate("update quesforum set countans='"+countans+"' where quesid='"+quesid+"'");
		response.sendRedirect("anspage.jsp?quesid="+quesid);
	}
	else{ %>
		<h2>You Can not delete this answer!!!</h2>
<%	}

}
catch(Exception e){
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
