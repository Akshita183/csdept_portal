<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	String q1="CREATE TABLE course(course_id INT NOT NULL AUTO_INCREMENT,cname VARCHAR(45) NOT NULL,cdes VARCHAR(45) NOT NULL,pic VARCHAR(500) NULL,temail VARCHAR(45) NOT NULL,price INT NULL,rating INT(1) NULL DEFAULT 0,category VARCHAR(45) NOT NULL,PRIMARY KEY (course_id))";
    System.out.println(q1);
    st.execute(q1);
    System.out.println("Table created");
    con.close();
}
catch(Exception e)
{
	System.out.println("Table created");
}
%>