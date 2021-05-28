<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String quesid = request.getParameter("quesid"); 
try{
	Connection con = ConnectionProvider.getcon();
	Statement st = con.createStatement();
	String emailid = "cs.bvdept@gmail.com";
	if(email.equals(emailid)){
		st.executeUpdate("Delete from quesforum  where quesid = '"+quesid+"'");
		response.sendRedirect("adminquesforum.jsp");
	}
	else{
		response.sendRedirect("adminquesforum.jsp");
	}
	
}
catch(Exception e){
}
%>