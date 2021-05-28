<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	String q1="CREATE TABLE Calendar(hol_id INT NOT NULL PRIMARY KEY,holiday VARCHAR(100) NOT NULL,date DATE NOT NULL,des VARCHAR(500) NOT NULL, everyYr VARCHAR(10) NOT NULL)";
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