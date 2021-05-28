<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<% 
String ansid = request.getParameter("ansid");
String quesid = request.getParameter("quesid");
int upvote;
try{
	Connection con = ConnectionProvider.getcon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select upvote from ansforum where ansid = '"+ansid+"'");
	rs.next();
	upvote = rs.getInt(1);
	upvote = upvote+1;
	
	Statement stmt = con.createStatement();
	stmt.executeUpdate("update ansforum set upvote='"+upvote+"' where ansid='"+ ansid+"'");
	response.sendRedirect("anspage.jsp?quesid="+quesid);
}
catch(Exception e){
	System.out.println(e);
	//response.sendRedirect("anspage.jsp");
}

%>