<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	String q1="CREATE TABLE student_timetable(period VARCHAR(10) NOT NULL,day VARCHAR(45) NOT NULL,details VARCHAR(500) NULL,class VARCHAR(45) NOT NULL,PRIMARY KEY (class, period, day))";
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