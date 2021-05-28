<%@page errorPage="errorfile.jsp" %>    
<!DOCTYPE html>
<html>
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
<% String msg=request.getParameter("msg");
if(msg!=null)
{
if(msg.equals("already_exist"))
{
	%>
	<h1 style="color:white">Can't add! Class name already exists</h1>
	<%
}
}
%>
<form action="addtimetableaction_s.jsp" id="sel" method="post">
<div class="a">
<label class="label control-label">Enter class name: </label>
<input type="text" class="form-control" name="add" id="add" required></input>
</div>
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
                    <td> <textarea name="w0" id="w0" style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea name="w1" id="w1" style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea name="w2" id="w2" style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea name="w3" id="w3" style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea name="w4" id="w4" style="width: 100%; height: 100%; border: none"></textarea></td>
                </tr>
                <tr>
                    <td>Thursday</td>
                    <td> <textarea name="thur0" id="thur0" style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea name="thur1" id="thur1" style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea name="thur2" id="thur2" style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea name="thur3" id="thur3" style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea name="thur4" id="thur4" style="width: 100%; height: 100%; border: none" ></textarea></td>

                </tr>
                <tr>
                    <td>Friday</td>
                    <td> <textarea name="fri0" id="fri0" style="width: 100%; height: 100%; border: none"></textarea></td>
                        <td> <textarea name="fri1" id="fri1" style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea name="fri2" id="fri2" style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea name="fri3" id="fri3" style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea name="fri4" id="fri4" style="width: 100%; height: 100%; border: none"></textarea></td>

                </tr>
                <tr>
                    <td>Saturday</td>
                    <td> <textarea name="sat0" id="sat0" style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea name="sat1" id="sat1" style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea name="sat2" id="sat2" style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea name="sat3" id="sat3" style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea name="sat4" id="sat4" style="width: 100%; height: 100%; border: none" ></textarea></td>
                </tr>
                <tr>
                    <td>Sunday</td>
                    <td> <textarea name="sun0" id="sun0" style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea name="sun1" id="sun1" style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea name="sun2" id="sun2" style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea name="sun3" id="sun3" style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea name="sun4" id="sun4" style="width: 100%; height: 100%; border: none"></textarea></td>
                </tr>
                <tr>
                    <td>Monday</td>
                    <td> <textarea name="mon0" id="mon0" style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea name="mon1" id="mon1" style="width: 100%; height: 100%; border: none"></textarea></td>
                            <td> <textarea name="mon2" id="mon2" style="width: 100%; height: 100%; border: none" ></textarea></td>
                            <td> <textarea name="mon3" id="mon3" style="width: 100%; height: 100%; border: none" ></textarea></td>
                    <td> <textarea name="mon4" id="mon4" style="width: 100%; height: 100%; border: none"></textarea></td>
                </tr>
            </tbody>
        </table>
        <input type="submit" id="addd" class="btn btn-primary" value="Add timetable" onclick="func2()">
        </form>
        <br><br>
</div>
<script type="text/javascript">
function func2()
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
	
	if(add.value =="" && w0.value == "" && w1.value == "" && w2.value == "" && w3.value == "" && w4.value == "" && thur0.value == "" && thur1.value == "" && thur2.value == "" && thur3.value == "" && thur4.value == "" && fri0.value == "" && fri1.value == "" && fri2.value == "" && fri3.value == "" && fri4.value == "" && sat0.value == "" && sat1.value == "" && sat2.value == "" && sat3.value == "" && sat4.value == "" && sun0.value == "" && sun1.value == "" && sun2.value == "" && sun3.value == "" && sun4.value == "" && mon0.value == "" && mon1.value == "" && mon2.value == "" && mon3.value == "" && mon4.value == "")
    {
		alert("CAN'T ADD\nNo class entered!\nNo records entered!");
    }
	else if(add.value =="")
	{
		alert("CAN'T ADD\nNo class entered!");
	}
	else if(w0.value == "" && w1.value == "" && w2.value == "" && w3.value == "" && w4.value == "" && thur0.value == "" && thur1.value == "" && thur2.value == "" && thur3.value == "" && thur4.value == "" && fri0.value == "" && fri1.value == "" && fri2.value == "" && fri3.value == "" && fri4.value == "" && sat0.value == "" && sat1.value == "" && sat2.value == "" && sat3.value == "" && sat4.value == "" && sun0.value == "" && sun1.value == "" && sun2.value == "" && sun3.value == "" && sun4.value == "" && mon0.value == "" && mon1.value == "" && mon2.value == "" && mon3.value == "" && mon4.value == "")
    {
		alert("CAN'T ADD\nNo records entered!");
    }
	else
		{
		alert("Timetable added successfully!");
		}
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