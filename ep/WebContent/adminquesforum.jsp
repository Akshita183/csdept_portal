<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Question Forum</title>
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://kit.fontawesome.com/502af4205e.js" crossorigin="anonymous"></script>  
    
    <link rel="stylesheet" href="css/forumstyle.css"> 
</head>

<body>
<%String email = session.getAttribute("email").toString(); %>

<div id="navbarsec">
					
</div>


<div class="search-box">
    <div id="inside-search">
    	<input type="text" placeholder="Search">
        <button><i class="fa fa-search"></i></button>
     </div>
</div>

<div class="nextcon">
<div class="insidecon">
        <%
        try{
	  	Connection con=ConnectionProvider.getcon();
		Statement st=con.createStatement();
		ResultSet rs = st.executeQuery("select * from quesforum");
		while(rs.next()){ %>
        <div class="que">
        <div class="quefront">
        	<div class="box1">
                <a href="delquesadmin.jsp?quesid=<%= rs.getString(1)%>"><button type="button" class="fa fa-ellipsis-v"></button></a>
                <h5>Posted by <u><%= rs.getString(4)%></u></h5>
            </div>
            <div class="box2">
                <h3><%= rs.getString(2)%></h3>
                <p><%= rs.getString(3)%></p>
            </div>
        </div>
        <div class="queback">
            <div class="viewans">
            <a href="adminanspage.jsp?quesid=<%= rs.getString(1)%>"><button>View Answers</button></a>
            </div>
        </div> 
        <div class="background"></div>
        </div>
     <%
		}
	}catch(Exception e){System.out.println(e);}
  	%>       
    </div>
    
</div>

<div id="contact-footer">

</div>

<script>
    $(function() {
    	$("#navbarsec").load("navbaradmin.jsp");
        $("#contact-footer").load("footer.html");
    });
</script>

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



