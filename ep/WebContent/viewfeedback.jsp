<%@page errorPage="errorfile.jsp" %>    
    <%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Feedback</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

<link href="css/viewfeedback.css" rel="stylesheet">
</head>
<body>

<% String cid=request.getParameter("cid"); 
float totalFeedbacks;
float c11=0, c12=0,c13=0,c14=0,c15=0;
float c21=0, c22=0,c23=0;
int r2=0,r3=0,r4=0,r5=0,r6=0,r7=0,r8=0,r9=0,r10=0,r11=0;
float y=0, n=0;
try{
	  Connection con=ConnectionProvider.getcon();
	  Statement stat=con.createStatement();
	  ResultSet res=stat.executeQuery("select * from course where course_id='"+cid+"'");
	  res.next();
%>
  <h1 class="course"> FEEDBACK OF COURSE:<br><%=res.getString(2) %></h1>

<%
	 
		Statement st=con.createStatement();
		Statement st1=con.createStatement();
		Statement st2=con.createStatement();
		Statement st3=con.createStatement();
		Statement st4=con.createStatement();
		Statement st5=con.createStatement();
		
		
		
		ResultSet rs1=st1.executeQuery("select * from feedback where course_id='"+cid+"' and ans1='Very Easy'");
		while(rs1.next())
		{ 
			c11++;	
		}
		ResultSet rs2=st2.executeQuery("select * from feedback where course_id='"+cid+"' and ans1='Easy'");
		while(rs2.next())
		{ 
			c12++;	
		}
		ResultSet rs3=st3.executeQuery("select * from feedback where course_id='"+cid+"' and ans1='Moderate'");
		while(rs3.next())
		{ 
			c13++;	
		}
		ResultSet rs4=st4.executeQuery("select * from feedback where course_id='"+cid+"' and ans1='Difficult'");
		while(rs4.next())
		{ 
			c14++;	
		}
		ResultSet rs5=st5.executeQuery("select * from feedback where course_id='"+cid+"' and ans1='Very Difficult'");
		while(rs5.next())
		{ 
			c15++;	
		}
		//Calculating Percentages for ans1
		
		System.out.println("c11="+ c11 +"%");
				System.out.println("c12="+ c12 +"%");
				System.out.println("c13="+ c13 +"%");
				System.out.println("c14="+ c14 +"%");
				System.out.println("c15="+ c15 +"%");
				
				totalFeedbacks=c11+c12+c13+c14+c15;
		float p1, p2, p3, p4, p5;
				p1=(c11 / totalFeedbacks)*100;
				p2=(c12/totalFeedbacks)*100;
				p3=(c13/totalFeedbacks)*100;
				p4=(c14/totalFeedbacks)*100;
				p5=(c15/totalFeedbacks)*100;
				
				System.out.println("p1="+ p1 +"%");
				System.out.println("p2="+ p2 +"%");
				System.out.println("p3="+ p3 +"%");
				System.out.println("p4="+ p4 +"%");
				System.out.println("p5="+ p5 +"%");
				int total=(int)totalFeedbacks;
				
%>

<h3> Total Number of Student Feedbacks Received for the Course: <%=total %> </h3>

<div class="container">
  <!--for demo wrap-->
  <h1>Q1. How easy or difficult was it to understand the concepts?</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>S.No.</th>
          <th>Student Remark</th>
          <th>Percentage</th>
         
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <tr>
          <td>1</td>
          <td>Very Easy</td>
          <td><%=p1 %>%</td>
        </tr>
        <tr>
          <td>2</td>
          <td>Easy</td>
          <td><%=p2 %>%</td>
         
        </tr>
        <tr>
          <td>3</td>
          <td>Moderate</td>
          <td><%=p3 %>%</td>
          
        </tr>
        <tr>
          <td>4</td>
          <td>Difficult</td>
          <td><%=p4 %>%</td>
          
        </tr>
        <tr>
          <td>5</td>
          <td>Very Difficult</td>
          <td><%=p5 %>%</td>
         
        </tr>
      </tbody>
    </table>
  </div>
</div>
<%		
		Statement st6=con.createStatement();
		Statement st7=con.createStatement();
		Statement st8=con.createStatement();
		
		
		ResultSet rs6=st6.executeQuery("select * from feedback where course_id='"+cid+"' and ans2='Not Confident'");
		while(rs6.next())
		{ 
			c21++;	
		}
		ResultSet rs7=st7.executeQuery("select * from feedback where course_id='"+cid+"' and ans2='Moderately Confident'");
		while(rs7.next())
		{ 
			c22++;	
		}
		ResultSet rs8=st8.executeQuery("select * from feedback where course_id='"+cid+"' and ans2='Very Confident'");
		while(rs8.next())
		{ 
			c23++;	
		}
		
		//calculating percentages for ans2
		System.out.println("c21="+ c21 +"%");
				System.out.println("c22="+ c22 +"%");
				System.out.println("c23="+ c23 +"%");
				totalFeedbacks=c21+c22+c23;
				System.out.println("totalFeedbacks"+ totalFeedbacks );
		
		float p6, p7, p8, p9, p10;
				p6=(c21/totalFeedbacks)*100;
				p7=(c22/totalFeedbacks)*100;
				p8=(c23/totalFeedbacks)*100;
				System.out.println("p6="+ p6 +"%");
				System.out.println("p7="+ p7 +"%");
				System.out.println("p8="+ p8 +"%");
%>



<div class="container">
  <!--for demo wrap-->
  <h1>Q2. How confident are you in applying what you have learnt?</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>S.No.</th>
          <th>Student Remark</th>
          <th>Percentage</th>
         
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <tr>
          <td>1</td>
          <td>	Not Confident</td>
          <td><%=p6 %>%</td>
        </tr>
        <tr>
          <td>2</td>
          <td>Moderately Confident</td>
          <td><%=p7 %>%</td>
         
        </tr>
        <tr>
          <td>3</td>
          <td>Very Confident</td>
          <td><%=p8 %>%</td>
          
        </tr>
       
      </tbody>
    </table>
  </div>
</div>

<% 
				
		
		Statement st9=con.createStatement();
		Statement st10=con.createStatement();
		
		ResultSet rs9=st9.executeQuery("select * from feedback where course_id='"+cid+"' and ans3='Yes'");
		while(rs9.next())
		{ 
			y++;	
		}
		ResultSet rs10=st10.executeQuery("select * from feedback where course_id='"+cid+"' and ans3='No'");
		while(rs10.next())
		{ 
			n++;	
		}
		//calculating percentages for ans2
		System.out.println("y="+ y +"%");
				System.out.println("n="+ n +"%");
		
		p9=(y/totalFeedbacks)*100;
		p10=(n/totalFeedbacks)*100;
				System.out.println("p9="+ p9 +"%");
				System.out.println("p10="+ p10 +"%");
				
%>



<div class="container">
  <!--for demo wrap-->
  <h1>Q3. Would you recommend this course to other students?</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>S.No.</th>
          <th>Student Remark</th>
          <th>Percentage</th>
         
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <tr>
          <td>1</td>
          <td>	YES</td>
          <td><%=p9 %>%</td>
        </tr>
        <tr>
          <td>2</td>
          <td>NO</td>
          <td><%=p10 %>%</td>
         
        </tr>
       
      </tbody>
    </table>
  </div>
</div>
<%
}//end of try
catch(Exception e)
{
	System.out.println(e);
}

%>

<script>
window.addEventListener( "pageshow", function ( event ) {
  var historyTraversal = event.persisted || 
                         ( typeof window.performance != "undefined" && 
                              window.performance.navigation.type === 2 );
  if ( historyTraversal ) {
    // Handle page restore.
    window.location.reload();
  }
});
</script>

</body>
</html>