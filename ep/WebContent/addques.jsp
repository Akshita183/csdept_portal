<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Add new Question</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel='stylesheet' href='css/askansques.css'>
</head>
<body>


<%
int id = 1;
String email = session.getAttribute("email").toString();
try{
	Connection con = ConnectionProvider.getcon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select max(quesid) from quesforum");
	while(rs.next()){
		id = rs.getInt(1);
		id = id+1;
	}
}
catch(Exception e){}
%>
<div class="panel">
		<div class="state"><br><i class="fa fa-question-circle"></i><br><h1>Add Question</h1></div>
		<div class="form">
		<form action="addquesaction.jsp" method="post">
			<input type="hidden" name="quesid" value="<%out.println(id);%>">
			<input type="text" name="title" placeholder="Title" required>
    		<textarea name="des" placeholder="Your Question" required></textarea>
    		<input type="hidden" name="email" value="email">
    		<input type="hidden" name="countans" value="0">
    		<button type="submit" onclick="func()" class="btn btn-info btn-block btn-round">Add</button>
			
		</form>
		</div>		
</div>	


<script>
function func() {
  alert("Question Added!!");
}
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