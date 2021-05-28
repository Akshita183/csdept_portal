<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	String q1="CREATE TABLE teacher_timetable(period VARCHAR(1) NOT NULL,day VARCHAR(10) NOT NULL,details VARCHAR(500) NULL,teacher_name VARCHAR(500) NOT NULL,PRIMARY KEY (period, day, teacher_name));";
    System.out.println(q1);
    st.execute(q1);
    System.out.println("Table created");
    con.close();
}
catch(Exception e)
{
	System.out.println(e);
}
%>