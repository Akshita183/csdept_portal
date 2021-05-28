<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("pass");
try
{
	int z=0;
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from teacher where email='"+email+"' and pass='"+password+"' ");
	while(rs.next())
	{
		z=1;
		session.setAttribute("email",email);
		response.sendRedirect("teacherlanding.jsp");
	}
	if(z==0)
	{
		response.sendRedirect("loginteacher.jsp?msg=not exist");
	}
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("loginteacher.jsp?msg=invalid");
}
%>