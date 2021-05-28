<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%

String name=request.getParameter("name");
String desig=request.getParameter("desig");
String email=request.getParameter("email");
String phn=request.getParameter("phn");
String pic=request.getParameter("pic");
String pass=request.getParameter("pass");
String cpass=request.getParameter("cpass");
String secques=request.getParameter("secques");
String ans=request.getParameter("answer");

if(cpass.equals(pass)==false)
{
	response.sendRedirect("signupteacher.jsp?msg=password does not match");
}
else
{


try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement ps=con.prepareStatement("insert into teacher(name,desig,email,phn,pic,pass,sec_ques,sec_ans) values(?,?,?,?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, desig);
	ps.setString(3, email);
	ps.setString(4, phn);
	ps.setString(5, pic);
	ps.setString(6, pass);
	ps.setString(7, secques);
	ps.setString(8, ans);
	ps.executeUpdate();
	session.setAttribute("email",email);
	response.sendRedirect("teacherlanding.jsp");
	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("signupteacher.jsp?msg=invalid");
}
}
%>