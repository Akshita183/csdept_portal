<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*"%>
<%
String email=session.getAttribute("email").toString();
String Class=request.getParameter("class");
String rollno=request.getParameter("roll_no");
String phn=request.getParameter("phn");
String secques=request.getParameter("sec_ques");
String answer=request.getParameter("answer");
if(email != null)
{	
try
{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement ps=con.prepareStatement("update student set class='"+Class+"',roll_no='"+rollno+"',phn='"+phn+"',sec_ques='"+secques+"',sec_ans='"+answer+"' where email='"+email+"' "); 
	
	int i = ps.executeUpdate();
	if(i > 0)
	{
		response.sendRedirect("updateprofile_s.jsp?msg=valid");
	}
	else
	{
		response.sendRedirect("updateprofile_s.jsp?msg=invalid");
	}
	
	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("updateprofile_s.jsp?msg=invalid");
}
}
%>