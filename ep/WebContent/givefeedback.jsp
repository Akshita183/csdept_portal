<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="project.UploadServlet"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="ISO-8859-1">
<title>Feedback</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
  
<link href="css/feedbackform.css" rel="stylesheet">
<!--  <link href="css/submitform.css" rel="stylesheet">-->
<link href="https://fonts.googleapis.com/css?family=Poppins:600" rel="stylesheet">
</head>
<body>
 <% String msg=request.getParameter("msg");

if("valid".equals(msg))
{
%>
<div class="alert alert-success" role="alert">
  Your feedback has been recorded successfully! Thankyou for your time!
  <div><a href="studentlanding.jsp">
  Click here to return to course page.</a></div>
</div>
<% //response.sendRedirect("studentlanding.jsp");%>
<% 
}
%>
<% 
if("invalid".equals(msg))
{
%>
	<h3 class="alert alert-danger">Something went wrong! Try Again!</h3>
<%
}
%>


<div class="alert">
	<h2>Hey, </h2>
	<p>Don't worry, your feedback will be kept anonymous!</p>
</div>


<div class="container">
<%
String cid= request.getParameter("cid");
String email=session.getAttribute("email").toString(); %>
 
<form action="givefeedbackAction.jsp" method="post">

<h2>How easy or difficult was it to understand the concepts?</h2>
	
<ul>
<li>
 <label for="Very Easy">Very Easy</label>
  <input type="radio" name="q1" id="Very Easy" value="Very Easy"><br>
   <div class="check"></div>
  </li>
  
  <li>
  
  <label for="Easy">Easy</label>
  <input type="radio" name="q1" id="Easy" value="Easy"><br>
  <div class="check"><div class="inside"></div></div>
  </li>
  
  <li>
  
   <label for="Moderate">Moderate</label>
  <input type="radio" name="q1" id="Moderate" value="Moderate"><br>
  
  <div class="check"><div class="inside"></div></div>
  </li>
  
  <li>
   <label for="Difficult">Difficult</label>
  <input type="radio" name="q1" id="Difficult" value="Difficult"><br>
  
  <div class="check"><div class="inside"></div></div>
  </li>
  
  <li>
     <label for="Very Difficult">Very Difficult</label>
  <input type="radio" name="q1" id="Very Difficult" value="Very Difficult"><br>
  
  <div class="check"><div class="inside"></div></div>
  </li>
 
  
  </ul>
  
  <hr>
  
  <h2> How confident are you in applying what you have learned?</h2>
  
  <ul>
  <li>
 <label for="Not Confident">Not Confident</label>
  <input type="radio" name="q2" id="Not Confident" value="Not Confident"><br>
  <div class="check"></div>
  </li>
  
  <li>
  <label for="Moderately Confident">Moderately Confident</label>
  <input type="radio" name="q2" id="Moderately Confident" value="Moderately Confident"><br>
  <div class="check"><div class="inside"></div></div>
  </li>
  
  <li>
   <label for="Very Confident">Very Confident</label>
  <input type="radio" name="q2" id="Very Confident" value="Very Confident"><br>
  <div class="check"><div class="inside"></div></div>
  </li>
 
 
  </ul>
   <hr>
   <h2>Would you recommend this course to other students?</h2>
   
   <ul>
   <li>
 <label for="Yes">Yes</label>
  <input type="radio" name="q3" id="Yes" value="Yes"><br>
  <div class="check"></div>
  </li>
  
  <li>
  <label for="No">No</label>
  <input type="radio" name="q3" id="No" value="No"><br>
  
  <div class="check"><div class="inside"></div></div>
  </li>
  
  </ul>
<br><br>



<h2>How would you rate the overall course?</h2>
<ul>
<fieldset class="rating" >
    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Perfect - 5 stars"></label>
    <input type="radio" id="star4half" name="rating" value="4.5" /><label class="half" for="star4half" title="Excellent - 4.5 stars"></label>
    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
    <input type="radio" id="star3half" name="rating" value="3.5" /><label class="half" for="star3half" title="Above Average - 3.5 stars"></label>
    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Average - 3 stars"></label>
    <input type="radio" id="star2half" name="rating" value="2.5" /><label class="half" for="star2half" title="Below Average - 2.5 stars"></label>
    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title=" Not Good- 2 stars"></label>
    <input type="radio" id="star1half" name="rating" value="1.5" /><label class="half" for="star1half" title="Bad- 1.5 stars"></label>
    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Poor - 1 star"></label>
    <input type="radio" id="starhalf" name="rating" value="0.5" /><label class="half" for="starhalf" title="Very Poor- 0.5 stars"></label>
</fieldset>

</ul>
<!--  --> <input type="hidden" name="email" value=<%//=email %>>-->
  <input type="hidden" name="cid" value=<%=cid %>>
  
  <input type="submit" id="submit" name="submit" value="SUBMIT FEEDBACK">
  
<!-- <div class="wrapper">
  <button class='submit' type='submit'> -->
    
    <!--  <span class='complete'>Thankyou for your valuable feedback!</span>
  </button>
</div>-->

</form>
</div>


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