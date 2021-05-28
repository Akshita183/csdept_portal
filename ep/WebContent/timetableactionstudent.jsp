<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String value=request.getParameter("mssg");
String w[]=new String[5];
for(int i=0;i<=4;i++){
	w[i]=request.getParameter("w"+i);
}
String thur[]=new String[5];
for(int i=0;i<=4;i++){
	thur[i]=request.getParameter("thur"+i);
}
String fri[]=new String[5];
for(int i=0;i<=4;i++){
	fri[i]=request.getParameter("fri"+i);
}
String sat[]=new String[5];
for(int i=0;i<=4;i++){
	sat[i]=request.getParameter("sat"+i);
}
String sun[]=new String[5];
for(int i=0;i<=4;i++){
	sun[i]=request.getParameter("sun"+i);
}
String mon[]=new String[5];
for(int i=0;i<=4;i++){
	mon[i]=request.getParameter("mon"+i);
}

Connection con=ConnectionProvider.getcon();
Statement st1=con.createStatement();
for(int i=0;i<=4;i++)
{
if(!w[i].equals(""))
{
st1.executeUpdate("Update student_timetable set details='"+w[i]+"' where period='"+(i+1)+"' AND day='Wednesday' AND class='"+value+"'");
}
}
for(int i=0;i<=4;i++)
{
	if(!thur[i].equals(""))
	{
	st1.executeUpdate("Update student_timetable set details='"+thur[i]+"' where period='"+(i+1)+"' AND day='Thursday' AND class='"+value+"'");
    }
}
for(int i=0;i<=4;i++)
{
	if(!fri[i].equals(""))
	{
	st1.executeUpdate("Update student_timetable set details='"+fri[i]+"' where period='"+(i+1)+"' AND day='Friday' AND class='"+value+"'");
    }
}
for(int i=0;i<=4;i++)
{
	if(!sat[i].equals(""))
	{
	st1.executeUpdate("Update student_timetable set details='"+sat[i]+"' where period='"+(i+1)+"' AND day='Saturday' AND class='"+value+"'");
	}
}
for(int i=0;i<=4;i++)
{
	if(!sun[i].equals(""))
	{
	st1.executeUpdate("Update student_timetable set details='"+sun[i]+"' where period='"+(i+1)+"' AND day='Sunday' AND class='"+value+"'");
	}
}
for(int i=0;i<=4;i++)
{
	if(!mon[i].equals(""))
	{
	st1.executeUpdate("Update student_timetable set details='"+mon[i]+"' where period='"+(i+1)+"' AND day='Monday' AND class='"+value+"'");
    }
}
response.sendRedirect("timetableadmin_s.jsp");
%>