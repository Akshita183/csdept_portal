<%@page errorPage="errorfile.jsp" %>    
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String add=request.getParameter("add");
String valu=request.getParameter("valu");
System.out.println(add);
System.out.println(valu);
String w[]=new String[5];
for(int i=0;i<=4;i++){
	w[i]=request.getParameter("w"+i);
}
String thur[]=new String[5];
for(int i=0;i<=4;i++){
	thur[i]=request.getParameter("thur"+i);
}
String fri[]=new String[5];
for(int i=0;i<=4;i++){
	fri[i]=request.getParameter("fri"+i);
}
String sat[]=new String[5];
for(int i=0;i<=4;i++){
	sat[i]=request.getParameter("sat"+i);
}
String sun[]=new String[5];
for(int i=0;i<=4;i++){
	sun[i]=request.getParameter("sun"+i);
}
String mon[]=new String[5];
for(int i=0;i<=4;i++){
	mon[i]=request.getParameter("mon"+i);
}
if(add.equals("") && valu==null && (w[0].equals("") || w[0]==null)  && (w[1].equals("") || w[1]==null) && (w[2].equals("") || w[2]==null) && (w[3].equals("") || w[3]==null) && (w[4].equals("") || w[4]==null) && (thur[0].equals("") || thur[0]==null)  && (thur[1].equals("") || thur[1]==null) && (thur[2].equals("") || thur[2]==null) && (thur[3].equals("") || thur[3]==null) && (thur[4].equals("") || thur[4]==null) && (fri[0].equals("") || fri[0]==null) && (fri[1].equals("") || fri[1]==null)  && (fri[2].equals("") || fri[2]==null)  && (fri[3].equals("") || fri[3]==null)  && (fri[4].equals("") || fri[4]==null)  && (sat[0].equals("") || sat[0]==null)  && (sat[1].equals("") || sat[1]==null) && (sat[2].equals("") || sat[2]==null) && (sat[3].equals("") || sat[3]==null) && (sat[4].equals("")|| sat[4]==null)  && (sun[0].equals("") || sun[0]==null) && (sun[1].equals("") || sun[1]==null) && (sun[2].equals("") || sun[2]==null) && (sun[3].equals("") || sun[3]==null) && (sun[4].equals("") || sun[4]==null) && (mon[0].equals("") || mon[0]==null) && (mon[1].equals("") || mon[1]==null) && (mon[2].equals("") || mon[2]==null) && (mon[3].equals("") || mon[3]==null) && (mon[4].equals("") || mon[4]==null) )
{
	response.sendRedirect("addtimetable_t.jsp?msg=invalid");
}
else if(add.equals("") && valu==null)
{
	response.sendRedirect("addtimetable_t.jsp?msg=invalid");
}
else if(!add.equals("") && valu!=null)
{
	response.sendRedirect("addtimetable_t.jsp?msg=invalid");
}
else if((w[0].equals("") || w[0]==null)  && (w[1].equals("") || w[1]==null) && (w[2].equals("") || w[2]==null) && (w[3].equals("") || w[3]==null) && (w[4].equals("") || w[4]==null) && (thur[0].equals("") || thur[0]==null)  && (thur[1].equals("") || thur[1]==null) && (thur[2].equals("") || thur[2]==null) && (thur[3].equals("") || thur[3]==null) && (thur[4].equals("") || thur[4]==null) && (fri[0].equals("") || fri[0]==null) && (fri[1].equals("") || fri[1]==null)  && (fri[2].equals("") || fri[2]==null)  && (fri[3].equals("") || fri[3]==null)  && (fri[4].equals("") || fri[4]==null)  && (sat[0].equals("") || sat[0]==null)  && (sat[1].equals("") || sat[1]==null) && (sat[2].equals("") || sat[2]==null) && (sat[3].equals("") || sat[3]==null) && (sat[4].equals("")|| sat[4]==null)  && (sun[0].equals("") || sun[0]==null) && (sun[1].equals("") || sun[1]==null) && (sun[2].equals("") || sun[2]==null) && (sun[3].equals("") || sun[3]==null) && (sun[4].equals("") || sun[4]==null) && (mon[0].equals("") || mon[0]==null) && (mon[1].equals("") || mon[1]==null) && (mon[2].equals("") || mon[2]==null) && (mon[3].equals("") || mon[3]==null) && (mon[4].equals("") || mon[4]==null) )
{
	response.sendRedirect("addtimetable_t.jsp?msg=invalid");
}
	else{
	try{
		String ad="";
	Connection con=ConnectionProvider.getcon();
	if(valu!=null)
	{
		ad=valu;
	}
	else
	{
		ad=add;
	}
	for(int i=0;i<=4;i++)
	{
	if(!w[i].equals(""))
	{
	PreparedStatement ps=con.prepareStatement("insert into teacher_timetable(period,day,details,teacher_name) values(?,?,?,?)");
	ps.setInt(1, i+1);
	ps.setString(2, "Wednesday");
	ps.setString(3, w[i]);
	ps.setString(4, ad);
	ps.executeUpdate();
	}
	else
	{
	PreparedStatement ps=con.prepareStatement("insert into teacher_timetable(period,day,details,teacher_name) values(?,?,?,?)");
	ps.setInt(1, i+1);
	ps.setString(2, "Wednesday");
	ps.setString(3, "");
	ps.setString(4, ad);
	ps.executeUpdate();
	}
	}
	for(int i=0;i<=4;i++)
	{
		if(!thur[i].equals(""))
		{
			PreparedStatement ps1=con.prepareStatement("insert into teacher_timetable(period,day,details,teacher_name) values(?,?,?,?)");
			ps1.setInt(1, i+1);
			ps1.setString(2, "Thursday");
			ps1.setString(3, thur[i]);
			ps1.setString(4, ad);
			ps1.executeUpdate();
	    }
		else
		{
			PreparedStatement ps1=con.prepareStatement("insert into teacher_timetable(period,day,details,teacher_name) values(?,?,?,?)");
			ps1.setInt(1, i+1);
			ps1.setString(2, "Thursday");
			ps1.setString(3, "");
			ps1.setString(4, ad);
			ps1.executeUpdate();
	    }
	}
	for(int i=0;i<=4;i++)
	{
		if(!fri[i].equals(""))
		{
			PreparedStatement ps2=con.prepareStatement("insert into teacher_timetable(period,day,details,teacher_name) values(?,?,?,?)");
			ps2.setInt(1, i+1);
			ps2.setString(2, "Friday");
			ps2.setString(3, fri[i]);
			ps2.setString(4, ad);
			ps2.executeUpdate();
	    }
		else
		{
			PreparedStatement ps2=con.prepareStatement("insert into teacher_timetable(period,day,details,teacher_name) values(?,?,?,?)");
			ps2.setInt(1, i+1);
			ps2.setString(2, "Friday");
			ps2.setString(3, "");
			ps2.setString(4, ad);
			ps2.executeUpdate();
	    }
	}
	for(int i=0;i<=4;i++)
	{
		if(!sat[i].equals(""))
		{
			PreparedStatement ps3=con.prepareStatement("insert into teacher_timetable(period,day,details,teacher_name) values(?,?,?,?)");
			ps3.setInt(1, i+1);
			ps3.setString(2, "Saturday");
			ps3.setString(3, sat[i]);
			ps3.setString(4, ad);
			ps3.executeUpdate();
		}
		else
		{
			PreparedStatement ps3=con.prepareStatement("insert into teacher_timetable(period,day,details,teacher_name) values(?,?,?,?)");
			ps3.setInt(1, i+1);
			ps3.setString(2, "Saturday");
			ps3.setString(3, "");
			ps3.setString(4, ad);
			ps3.executeUpdate();
		}
	}
	for(int i=0;i<=4;i++)
	{
		if(!sun[i].equals(""))
		{
			PreparedStatement ps4=con.prepareStatement("insert into teacher_timetable(period,day,details,teacher_name) values(?,?,?,?)");
			ps4.setInt(1, i+1);
			ps4.setString(2, "Sunday");
			ps4.setString(3, sun[i]);
			ps4.setString(4, ad);
			ps4.executeUpdate();
		}
		else
		{
			PreparedStatement ps4=con.prepareStatement("insert into teacher_timetable(period,day,details,teacher_name) values(?,?,?,?)");
			ps4.setInt(1, i+1);
			ps4.setString(2, "Sunday");
			ps4.setString(3, "");
			ps4.setString(4, ad);
			ps4.executeUpdate();
		}
	}
	for(int i=0;i<=4;i++)
	{
		if(!mon[i].equals(""))
		{
			PreparedStatement ps5=con.prepareStatement("insert into teacher_timetable(period,day,details,teacher_name) values(?,?,?,?)");
			String x=String.valueOf(i+1);
            ps5.setString(1, x);
            ps5.setString(2, "Monday");
			ps5.setString(3, mon[i]);
			ps5.setString(4, ad);
			ps5.executeUpdate();
	     }
		else
		{
			PreparedStatement ps5=con.prepareStatement("insert into teacher_timetable(period,day,details,teacher_name) values(?,?,?,?)");
			String x=String.valueOf(i+1);
            ps5.setString(1, x);
            ps5.setString(2, "Monday");
			ps5.setString(3, "");
			ps5.setString(4, ad);
			ps5.executeUpdate();
	     }
	}
	response.sendRedirect("addtimetable_t.jsp?msg=valid");
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("addtimetable_t.jsp?msg=already_exist");
	}
}
%>