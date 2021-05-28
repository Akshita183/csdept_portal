<%@page errorPage="errorfile.jsp" %>
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="css/timetable.css">
</head>

<body>
<div class="box"> 
        <form action="" id="sel" method="post">
        <select class = "select-css" name="valu" onchange = "this.form.submit();">
            <option value="" disabled selected hidden>Select teacher's name</option>
            <%
            Connection con=ConnectionProvider.getcon();
            Statement st=con.createStatement();
            ResultSet rs1=st.executeQuery("select distinct(teacher_name) from teacher_timetable");
            while(rs1.next())
            {
            %>
            <option value="<%= rs1.getString(1)%>"><%= rs1.getString(1)%></option>
            <% } %>           
        </select>
        <br>
       
         </form>
            <% 
            String value=request.getParameter("valu"); 
            if(value==null)
            {
            %>
            <br>
          <table class="container" id="showstart">
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
                    <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                </tr>
                <tr>
                    <td>Thursday</td>
                    <td> <textarea style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none" ></textarea></td>

                </tr>
                <tr>
                    <td>Friday</td>
                    <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                        <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>

                </tr>
                <tr>
                    <td>Saturday</td>
                    <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none" ></textarea></td>
                </tr>
                <tr>
                    <td>Sunday</td>
                    <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                </tr>
                <tr>
                    <td>Monday</td>
                    <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea style="width: 100%; height: 100%; border: none" ></textarea></td>
                    <td> <textarea style="width: 100%; height: 100%; border: none"></textarea></td>
                </tr>
            </tbody>
        </table>
        <br><br>
          <% }
            else
            {
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
         <h2 class="t">Timetable:- <%= value %></h2>
        <form action="timetableactionteacher.jsp?value=<%= value %>" method="post">
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
                    <%
                    if(w[j]==null)
                    {
                    	   %>
                           <textarea name="w<%=j %>" id="w<%=j %>" style="width: 100%; height: 100%; border: none"></textarea>
                           <% }
                           else 
                           { 
                           %>
                           <textarea name="w<%=j%>" id="w<%=j %>" style="width: 100%; height: 100%; border: none" placeholder="<%=w[j] %>"></textarea>
                           <% 
                           }
                           %>
                    </td>
                    <% } %>
                </tr>
                <tr>
                    <td>Thursday</td>
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%
                    if(thur[j]!=null || thur[j]!="") 
                    { 
                    %>
                    <textarea name="thur<%=j%>" id="thur<%=j%>" style="width: 100%; height: 100%; border: none" placeholder="<%=thur[j] %>"></textarea>
                    <% 
                    }
                    if(thur[j]==null || thur[j]=="")
                    {
                    %>
                    <textarea name="thur<%=j %>" id="thur<%=j%>" style="width: 100%; height: 100%; border: none"></textarea>
                    <% } %>
                    </td>
                    <% } %>
                </tr>
                <tr>
                    <td>Friday</td>
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%
                    if(fri[j]!=null || fri[j]!="") 
                    { 
                    %>
                    <textarea name="fri<%=j%>"  id="fri<%=j%>" style="width: 100%; height: 100%; border: none" placeholder="<%=fri[j] %>"></textarea>
                    <% 
                    }
                    if(fri[j]==null || fri[j]=="")
                    {
                    %>
                    <textarea name="fri<%=j %>" id="fri<%=j%>" style="width: 100%; height: 100%; border: none"></textarea>
                    <% } %>
                    </td>
                    <% } %>
                    
                </tr>
                <tr>
                    <td>Saturday</td>
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%
                    if(sat[j]!=null || sat[j]!="") 
                    { 
                    %>
                    <textarea name="sat<%=j%>"  id="sat<%=j%>" style="width: 100%; height: 100%; border: none" placeholder="<%=sat[j] %>"></textarea>
                    <% 
                    }
                    if(sat[j]==null || sat[j]=="")
                    {
                    %>
                    <textarea name="sat<%=j %>" id="sat<%=j%>" style="width: 100%; height: 100%; border: none"></textarea>
                    <% } %>
                    </td>
                    <% } %>
                </tr>
                <tr>
                    <td>Sunday</td>
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%
                    if(sun[j]!=null || sun[j]!="") 
                    { 
                    %>
                    <textarea name="sun<%=j%>" id="sun<%=j%>" style="width: 100%; height: 100%; border: none" placeholder="<%=sun[j] %>"></textarea>
                    <% 
                    }
                    if(sun[j]==null || sun[j]=="")
                    {
                    %>
                    <textarea name="sun<%=j %>" id="sun<%=j%>" style="width: 100%; height: 100%; border: none"></textarea>
                    <% } %>
                    </td>
                    <% } %>
                </tr>
                <tr>
                    <td>Monday</td>
                    <% for(int j=0;j<=4;j++)
                    {
                    %>
                    <td>
                    <%
                    if(mon[j]!=null || mon[j]!="") 
                    { 
                    %>
                    <textarea name="mon<%=j%>"  id="mon<%=j%>" style="width: 100%; height: 100%; border: none" placeholder="<%=mon[j] %>"></textarea>
                    <% 
                    }
                    if(mon[j]==null || mon[j]=="")
                    {
                    %>
                    <textarea name="mon<%=j %>" id="mon<%=j%>" style="width: 100%; height: 100%; border: none"></textarea>
                    <% } %>
                    </td>
                    <% } %>
                </tr>
            </tbody>
        </table>
        <input type="submit" id="l" class="btn btn-primary" value="Update timetable" onclick="func1()">
        <a id="r" class="btn btn-primary" onclick="func2()" href="deletetimetable_t.jsp?value=<%= value %>">Delete Timetable</a>
        </form>
        <% } %>
        <br>
       </div>

    <script>
    function func1()
    {
    	var w0 = document.getElementById("w0");
    	var w1 = document.getElementById("w1");
    	var w2 = document.getElementById("w2");
    	var w3 = document.getElementById("w3");
    	var w4 = document.getElementById("w4");
    	var thur0 = document.getElementById("thur0");
    	var thur1 = document.getElementById("thur1");
    	var thur2 = document.getElementById("thur2");
    	var thur3 = document.getElementById("thur3");
    	var thur4 = document.getElementById("thur4");
    	var fri0 = document.getElementById("fri0");
    	var fri1 = document.getElementById("fri1");
    	var fri2 = document.getElementById("fri2");
    	var fri3 = document.getElementById("fri3");
    	var fri4 = document.getElementById("fri4");
    	var sat0 = document.getElementById("sat0");
    	var sat1 = document.getElementById("sat1");
    	var sat2 = document.getElementById("sat2");
    	var sat3 = document.getElementById("sat3");
    	var sat4 = document.getElementById("sat4");
    	var sun0 = document.getElementById("sun0");
    	var sun1 = document.getElementById("sun1");
    	var sun2 = document.getElementById("sun2");
    	var sun3 = document.getElementById("sun3");
    	var sun4 = document.getElementById("sun4");
    	var mon0 = document.getElementById("mon0");
    	var mon1 = document.getElementById("mon1");
    	var mon2 = document.getElementById("mon2");
    	var mon3 = document.getElementById("mon3");
    	var mon4 = document.getElementById("mon4");
    	
    	if(w0.value == "" && w1.value == "" && w2.value == "" && w3.value == "" && w4.value == "" && thur0.value == "" && thur1.value == "" && thur2.value == "" && thur3.value == "" && thur4.value == "" && fri0.value == "" && fri1.value == "" && fri2.value == "" && fri3.value == "" && fri4.value == "" && sat0.value == "" && sat1.value == "" && sat2.value == "" && sat3.value == "" && sat4.value == "" && sun0.value == "" && sun1.value == "" && sun2.value == "" && sun3.value == "" && sun4.value == "" && mon0.value == "" && mon1.value == "" && mon2.value == "" && mon3.value == "" && mon4.value == "")
        {
    		alert("No records to be updated!");
        }
    	else{
    		alert("Timetable Updated Successfully!");
    	}
    	
    }
    
    </script>
    <script type="text/javascript">
    function func2(){
    	alert("Timetable deleted Successfully!");
    }
    
    </script>
    
    <script src='https://code.jquery.com/jquery-3.5.1.slim.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
        crossorigin="anonymous"></script>

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
 