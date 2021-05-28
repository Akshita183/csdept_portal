<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String quesid = session.getAttribute("quesid").toString();
String ansid = request.getParameter("ansid"); 
try{
	Connection con = ConnectionProvider.getcon();
	Statement st = con.createStatement();
	String emailid = "cs.bvdept@gmail.com";
	if(email.equals(emailid)){
		st.executeUpdate("Delete from ansforum  where ansid = '"+ansid+"'");
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("select countans from quesforum where quesid = '"+quesid+"'");
		rs1.next();
		int countans = rs1.getInt(1);
		countans = countans-1;
		
		Statement stmt = con.createStatement();
		stmt.executeUpdate("update quesforum set countans='"+countans+"' where quesid='"+quesid+"'");
		response.sendRedirect("adminanspage.jsp");
	}

}
catch(Exception e){
}
%>