<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
String quesid=request.getParameter("quesid");
String title=request.getParameter("title");
String des=request.getParameter("des");
String email = session.getAttribute("email").toString();
String countans=request.getParameter("countans");

try{
	Connection con = ConnectionProvider.getcon();
	PreparedStatement ps = con.prepareStatement("insert into quesforum values(?,?,?,?,?)");
	ps.setString(1, quesid);
	ps.setString(2, title);
	ps.setString(3, des);
	ps.setString(4, email);
	ps.setString(5, countans);
	ps.executeUpdate();
	response.sendRedirect("quesforum_s.jsp");
}
catch(Exception e){
	response.sendRedirect("quesforum_s.jsp?askques=invalid");
}
%>

