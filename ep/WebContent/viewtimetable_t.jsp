<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Teacher TimeTable</title>
    <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css'>
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.4/css/tether.min.css'>
    <link rel="stylesheet" href="css/navbarcoursestyle.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/viewtimetable.css">
    
    
    <link href="css/flexslider.css" rel="stylesheet" />
    <link href="css/footer.css" rel="stylesheet" />
  
</head>
<body>
<%String email=session.getAttribute("email").toString(); %>
 
<div id="navbarcourse">
	
</div>

<div class="box"> 
<br>
<%        try{
          Connection con=ConnectionProvider.getcon();
          Statement st=con.createStatement();
          ResultSet r=st.executeQuery("select name from teacher where email='"+email+"' ");
          r.next();
          String value=r.getString(1);
          Statement st1=con.createStatement();
          String w[]=new String[5];
          for(int i=0; i<=4;i++)
          {
          ResultSet rs=st1.executeQuery("select details from teacher_timetable where period='"+(i+1)+"' AND day='Wednesday' AND teacher_name='"+value+"' ");
          rs.next();
          w[i]=rs.getString(1);
          }
          String thur[]=new String[5];
          for(int i=0; i<=4;i++)
          {
          ResultSet rs=st1.executeQuery("select details from teacher_timetable where period='"+(i+1)+"' AND day='Thursday' AND teacher_name='"+value+"' ");
          rs.next();
          thur[i]=rs.getString(1);
          }
          String fri[]=new String[5];
          for(int i=0; i<=4;i++)
          {
          ResultSet rs=st1.executeQuery("select details from teacher_timetable where period='"+(i+1)+"' AND day='Friday' AND teacher_name='"+value+"' ");
          rs.next();
          fri[i]=rs.getString(1);
          }
          String sat[]=new String[5];
          for(int i=0; i<=4;i++)
          {
          ResultSet rs=st1.executeQuery("select details from teacher_timetable where period='"+(i+1)+"' AND day='Saturday' AND teacher_name='"+value+"' ");
          rs.next();
          sat[i]=rs.getString(1);
          }
          String sun[]=new String[5];
          for(int i=0; i<=4;i++)
          {
          ResultSet rs=st1.executeQuery("select details from teacher_timetable where period='"+(i+1)+"' AND day='Sunday' AND teacher_name='"+value+"' ");
          rs.next();
          sun[i]=rs.getString(1);
          }
          String mon[]=new String[5];
          for(int i=0; i<=4;i++)
          {
          ResultSet rs=st1.executeQuery("select details from teacher_timetable where period='"+(i+1)+"' AND day='Monday' AND teacher_name='"+value+"' ");
          rs.next();
          mon[i]=rs.getString(1);
          }
          %>
        <table class="container">
            <thead>
                <tr>
                    <th>
                        <h1>DAYS</h1>
                    </th>
                    <th>
                        <h1>09:00-10:10</h1>
                        <h1 class="period">1</h1>
                    </th>
                    <th>
                        <h1>10:20-11:30</h1>
                        <h1 class="period">2</h1>
                    </th>
                    <th>
                        <h1>11:40-12:50</h1>
                        <h1 class="period">3</h1>
                    </th>
                
                    <th>
                        <h1>02:00-03:10</h1>
                        <h1 class="period">5</h1>
                    </th>
                    <th>
                        <h1>03:20-4:30</h1>
                        <h1 class="period">6</h1>
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Wednesday</td>
                    
                    
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%= w[j]%>
                    </td>
                     <% } %>
                </tr>
                <tr>
                    <td>Thursday</td>
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%= thur[j]%>
                    </td>
                     <% } %>
                </tr>
                <tr>
                    <td>Friday</td>
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%= fri[j]%>
                    </td>
                     <% } %>
                    
                </tr>
                <tr>
                    <td>Saturday</td>
                   <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%= sat[j]%>
                    </td>
                     <% } %>
                </tr>
                <tr>
                    <td>Sunday</td>
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%= sun[j]%>
                    </td>
                     <% } %>
                </tr>
                <tr>
                    <td>Monday</td>
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%= mon[j]%>
                    </td>
                     <% } %>
                </tr>
            </tbody>
        </table>

       <% }
catch(Exception e){
%>
<h1>No Timetable uploaded yet!!</h1>
<%
}%>
        <br><br>
</div>

<div id="contact-footer">
</div>

    
<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.4/js/tether.min.js'></script>
    <script  src="js/script.js"></script>  
           <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
 <script>
    $(function() {
        $("#navbarcourse").load("navbarsm_t.jsp");
        $("#contact-footer").load("footer.html");
    });
</script>     
    
<!--  Jquery Core Script -->
    <script src="js/jquery-1.10.2.js"></script>
<!--  Core Bootstrap Script -->
    <script src="js/bootstrap.js"></script>
<!--  Flexslider Scripts --> 
    <script src="js/jquery.flexslider.js"></script>
<!--  Scrolling Reveal Script -->
    <script src="js/scrollReveal.js"></script>
<!--  Scroll Scripts --> 
    <script src="js/jquery.easing.min.js"></script>
<!--  Custom Scripts --> 
    <script src="js/custom.js"></script>      


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