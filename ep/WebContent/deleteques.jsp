<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String quesid = request.getParameter("quesid"); 
try{
	Connection con = ConnectionProvider.getcon();
	Statement s = con.createStatement();
	Statement st = con.createStatement();
	ResultSet rs = s.executeQuery("select email from quesforum where quesid = '"+quesid+"'");
	rs.next();
	String emailid = rs.getString(1);
	if(email.equals(emailid)){
		st.executeUpdate("Delete from quesforum  where quesid = '"+quesid+"'");
		response.sendRedirect("quesforum_s.jsp");
	}
	else{
		%>
		<h2>You Can not delete this Question!!!</h2>
<%		
	}
	
}
catch(Exception e){
}
%>