<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%

String email=session.getAttribute("email").toString();
String CID=request.getParameter("CID");

try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement ps=con.prepareStatement("insert into bookmark(email,course_id) values(?,?)");
	ps.setString(1, email);
	ps.setString(2, CID);
	ps.executeUpdate();
	response.sendRedirect("bookmark.jsp?msg=valid");
	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("bookmark.jsp?msg=invalid");
}
%>