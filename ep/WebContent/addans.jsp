<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Add ans Answer</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel='stylesheet' href='css/askansques.css'>
</head>
<body>
<div class="panel">
		<div class="state"><br><i class="fa fa-edit fa-2x"></i><br><h1>Add Answer</h1></div>
		<div class="form">
		<form action="addansaction.jsp" method="post">
			<textarea name="description" id="des" placeholder="Enter Description" required></textarea>
    		<button type="submit" onclick="func()" class="btn btn-info btn-block btn-round">Add</button>			
		</form>
		</div>		
</div>	

<script>
function func() {
	var des = document.getElementById("des"); 
	if(des.value==""){
		alert("No description added!!");
	}
	else{
		alert("Answer Added!!");
	}
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

