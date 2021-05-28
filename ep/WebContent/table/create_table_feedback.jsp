<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	String q1="Create table feedback(f_id INT NOT NULL AUTO_INCREMENT, course_id INT NOT NULL, s_email VARCHAR(45) NOT NULL, ans1 VARCHAR(45) NULL, ans2 VARCHAR(45) NULL, ans3 VARCHAR(45) NULL, rating DOUBLE NOT NULL, PRIMARY KEY (f_id), CONSTRAINT fk_feedback-course FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE CASCADE ON UPDATE CASCADE, CONSTRAINT fk_feedback_studemail FOREIGN KEY (s_email) REFERENCES student(email) ON DELETE CASCADE )";
    //System.out.println(q1);
    st.execute(q1);
    System.out.println("Table created");
    con.close();
}
catch(Exception e)
{
	System.out.println(e);
}
%>