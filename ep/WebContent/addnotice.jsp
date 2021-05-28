<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel='stylesheet' href='css/noticeaddstyle.css'>
	<title>Add Notice</title>
</head>
<body>
        <%
		int id = 1;
		try{
				Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select max(Nid) from notice");
				while(rs.next()){
					id = rs.getInt(1);
					id = id+1;
				}

		}
catch(Exception e){}
%>
<div class="panel">
		
		<div class="state"><br><i class="fa fa-pencil-square-o fa-2x"></i><br><h1>ADD NOTICE</h1></div>
		<a href="adminlanding.jsp" class="close"></a>
		<div class="form">		
		<form action="addnoticeaction.jsp" method="post">
		<input type="hidden" name="Nid" value="<%out.println(id);%>">
			<input type="text" name="Nname" placeholder="Enter topic" required>
    		<textarea name="Ndes" placeholder="Description" required></textarea>
    		<input type="date" name="N_date" placeholder="dd-mm-yy" required>
    		
    		<button type="submit" class="btn btn-info btn-block btn-round" onclick="func()">Add</button>
			
		</form>
		</div>
		<div class='whysign'>
<% 
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 class="text-center">Successfully Added</h3>
<% } %> 
<%
if("Invalid".equals(msg))
{
%>
<h3 class="text-center">Some thing Went Wrong! Try Again !</h3>
<% } %>
  </div>				
</div>	
     
<script>
function func(){
	alert("Notice added!!");
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
