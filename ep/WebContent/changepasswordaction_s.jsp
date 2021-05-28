<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String oldpass= request.getParameter("oldpass");
String newpass=request.getParameter("newpass");
String confirmpass=request.getParameter("confirmpass");

if(!confirmpass.equals(newpass)){
	response.sendRedirect("changepassword_s.jsp?msg=notmatch");
}
else{
	int check=0;
	try{
		Connection con=ConnectionProvider.getcon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select* from student where email='"+email+"' and pass='"+oldpass+"'");
		while(rs.next())
		{
			check = 1;
			st.executeUpdate("update student set pass='"+newpass+"' where email='"+email+"' ");
			response.sendRedirect("changepassword_s.jsp?msg=done");
		}
		if(check==0)
		{
			response.sendRedirect("changepassword_s.jsp?msg=wrong");
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
}
%>