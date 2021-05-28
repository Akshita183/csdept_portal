<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
	String description = request.getParameter("description");
	String quesid = session.getAttribute("quesid").toString();
	String email = session.getAttribute("email").toString();
	int countans;
		Connection con = ConnectionProvider.getcon();
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery("select countans from quesforum where quesid = '"+quesid+"'");
		rs1.next();
		countans = rs1.getInt(1);
		countans = countans+1;
		
		Statement stmt = con.createStatement();
		stmt.executeUpdate("update quesforum set countans='"+countans+"' where quesid='"+quesid+"'");
	
	try{
		PreparedStatement ps = con.prepareStatement("insert into ansforum(description,quesid,email) values(?,?,?)");
		ps.setString(1, description);
		ps.setString(2, quesid);
		ps.setString(3, email);
		ps.executeUpdate();
		response.sendRedirect("anspage.jsp?quesid="+quesid);
	}
	catch(Exception ex){
		System.out.println(ex);
		response.sendRedirect("anspage.jsp?addans=notadded");
		
	}

%>