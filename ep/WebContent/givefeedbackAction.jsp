<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
String email=session.getAttribute("email").toString();

String a1=request.getParameter("q1");
String a2=request.getParameter("q2");
String a3=request.getParameter("q3");
String cid=request.getParameter("cid");
String rating=request.getParameter("rating");


try{
	Connection con=ConnectionProvider.getcon();
	PreparedStatement ps=con.prepareStatement("insert into feedback(course_id,s_email, ans1, ans2 ,ans3, rating) values(?,?,?,?,?,?)");
	ps.setString(1, cid);
	ps.setString(2, email);
	ps.setString(3, a1);
	ps.setString(4, a2);
	ps.setString(5, a3);
	ps.setString(6, rating);
	
	ps.executeUpdate();
	
	//updating rating of the course in the course table according to given feedback
	 
	double r=0;
	double totalFeedbacks=0;
Statement st12=con.createStatement();


ResultSet rs12=st12.executeQuery("select * from feedback where course_id='"+cid+"'");
while(rs12.next())
{ 
r=r+ rs12.getDouble(7);
totalFeedbacks=totalFeedbacks+1;
}

double avgRating;
avgRating = r/totalFeedbacks;

PreparedStatement ps2=con.prepareStatement("update course set rating='"+avgRating+"' where course_id='"+cid+"'");

ps2.executeUpdate();

	response.sendRedirect("givefeedback.jsp?msg=valid");
	
}

catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("givefeedback.jsp?msg=invalid");
}

%>