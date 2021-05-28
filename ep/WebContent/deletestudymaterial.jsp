<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="project.UploadServlet"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Course</title>
</head>
<body>

<%String email=session.getAttribute("email").toString();
String cid=request.getParameter("cid");
String sid=request.getParameter("sid");
try{
	

Connection con= ConnectionProvider.getcon();
Statement st= con.createStatement();
st.executeUpdate("delete from studymaterial where sm_id='"+sid+"'");
response.sendRedirect("viewstudymat_t.jsp?cid="+cid);
}
catch(Exception e)
{
	response.sendRedirect("viewstudymat_t.jsp?msg=notremoved");
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