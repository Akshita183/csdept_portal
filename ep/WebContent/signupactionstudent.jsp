<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat" %>

<%

String name=request.getParameter("name");
String Class=request.getParameter("class");
String rollno=request.getParameter("rollno");
String yoj = request.getParameter("yoj");
String email=request.getParameter("email");
String phn=request.getParameter("phn");
String pic=request.getParameter("pic");
String pass=request.getParameter("pass");
String cpass=request.getParameter("cpass");
String secques=request.getParameter("secques");
String answer=request.getParameter("answer");

if(cpass.equals(pass)==false)
{
	response.sendRedirect("signupstudent.jsp?msg=password does not match");
}

else
{
try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement ps=con.prepareStatement("insert into student(name,class,roll_no,yoj,email,phn,pass,sec_ques,sec_ans) values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, Class);
	ps.setString(3, rollno);
	ps.setDate(4, java.sql.Date.valueOf(yoj));
	ps.setString(5, email);
	ps.setString(6, phn);
	ps.setString(7, pass);
	ps.setString(8, secques);
	ps.setString(9, answer);
	ps.executeUpdate();
	session.setAttribute("email",email);
	response.sendRedirect("studentlanding.jsp");	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("signupstudent.jsp?msg=invalid");
}
}
%>