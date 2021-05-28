<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String value=request.getParameter("value");
System.out.println(value);
Connection con=ConnectionProvider.getcon();
Statement st1=con.createStatement();
String sql = "DELETE FROM teacher_timetable WHERE teacher_name='"+value+"' ";
st1.executeUpdate(sql);
response.sendRedirect("timetableadmin_t.jsp");
%>