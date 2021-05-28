<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
String email=request.getParameter("email");
String sec_ques=request.getParameter("sec_ques");
String sec_ans=request.getParameter("sec_ans");
String newpass=request.getParameter("newpass");

int check=0;
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from teacher where email='"+email+"' and sec_ques='"+sec_ques+"' and sec_ans='"+sec_ans+"'");
	while(rs.next())
	{
		check = 1;
		st.executeUpdate("update teacher set pass='"+newpass+"' where email='"+email+"' ");
		response.sendRedirect("forgotpassword_t.jsp?msg=done");
	}
	if(check==0)
	{
		response.sendRedirect("forgotpassword_t.jsp?msg=invalid");
	}
	
}
catch(Exception e)
{
	System.out.println(e);
}
%>