<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	String q1="CREATE TABLE student(stud_id INT NOT NULL AUTO_INCREMENT,name VARCHAR(45) NOT NULL,class VARCHAR(45) NOT NULL,roll_no VARCHAR(45) NOT NULL,yoj INT(4) NOT NULL,email VARCHAR(45) NOT NULL,phn VARCHAR(10) NOT NULL,pass VARCHAR(45) NOT NULL,sec_ques VARCHAR(500) NOT NULL,sec_ans VARCHAR(500) NOT NULL,PRIMARY KEY (stud_id))";
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