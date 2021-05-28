<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%

String email = request.getParameter("email");
String password = request.getParameter("pass");

 if(email.equals("cs.bvdept@gmail.com") && password.equals("admin_22")){
	 session.setAttribute("email",email);
	 response.sendRedirect("adminlanding.jsp");
 }
 else{
	 response.sendRedirect("loginadmin.jsp?msg=invalid");
}

 %>