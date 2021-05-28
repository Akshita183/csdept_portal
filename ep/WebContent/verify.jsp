<%@page errorPage="errorfile.jsp" %>    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verify</title>
</head>
<body>
<%
int z=0;
String email=session.getAttribute("email").toString();
String CID=request.getParameter("CID");
%>

        <span>We already send a verification  code to your email.</span>
        
        <form action="verifyaction.jsp?CID=<%=CID %>" method="post">
            <input type="text" name="authcode" >
            <input type="submit" value="verify">
        </form>
    </body>
</html>
	
<%
String msg=request.getParameter("msg");
if("correct code".equals(msg))
{
	response.sendRedirect("enrollaction.jsp?CID="+CID);
}
if("incorrect code".equals(msg))
{
%>
<h1>Verification Code doesn't match.Please try again.</h1>
<% 
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