<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String mssg=request.getParameter("mssg");
System.out.println(mssg);
Connection con=ConnectionProvider.getcon();
Statement st1=con.createStatement();
String sql = "DELETE FROM student_timetable WHERE class='"+mssg+"' ";
st1.executeUpdate(sql);
response.sendRedirect("timetableadmin_s.jsp");
%>