<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
session.removeAttribute("code");
String email=session.getAttribute("email").toString();
String CID=request.getParameter("CID");

try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement ps=con.prepareStatement("insert into enroll(email,course_id) values(?,?)");
	ps.setString(1, email);
	ps.setString(2, CID);
	ps.executeUpdate();
	response.sendRedirect("enroll.jsp?msg=valid");
	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("enroll.jsp?msg=invalid");
}
%>