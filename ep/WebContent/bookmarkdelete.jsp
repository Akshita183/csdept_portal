<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String mssg=request.getParameter("mssg");
System.out.println(mssg);
Connection con=ConnectionProvider.getcon();
Statement st1=con.createStatement();
String sql = "DELETE FROM bookmark WHERE email='"+email+"' AND course_id='"+mssg+"' ";
st1.executeUpdate(sql);
response.sendRedirect("bookmark.jsp?delete=yes");
%>
