<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%

String Nid=request.getParameter("Nid");
String Nname=request.getParameter("Nname");
String Ndes=request.getParameter("Ndes");
String N_date=request.getParameter("N_date");

try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement ps=con.prepareStatement("insert into notice(Nid,Nname,Ndes,N_date) values(?,?,?,?)");
	ps.setString(1, Nid);
	ps.setString(2, Nname);
	ps.setString(3, Ndes);
	ps.setDate(4, java.sql.Date.valueOf(N_date));
	
	ps.executeUpdate();
	response.sendRedirect("adminlanding.jsp?msg=Notice Successfully Added!");
	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("addnotice.jsp?msg=Invalid");
}
%>