<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="javax.activation.*"%>
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Email Sent</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
String CID=request.getParameter("CID");
Connection con=ConnectionProvider.getcon();
Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery("select * from enroll where course_id='"+CID+"' and email='"+email+"'");
if(rs2.next())
{
	%>
	<h1>Can't enroll!!Already present in enrolled courses</h1>
	<%
}
else
{

ResultSet rs=st.executeQuery("select * from course where course_id='"+CID+"'");
ResultSet rs1=st1.executeQuery("select * from student where email='"+email+"'");
rs.next();
rs1.next();
String cname=rs.getString(2);
String price=rs.getString(6);
String name=rs1.getString(2);

Random rnd = new Random();
int number = rnd.nextInt(999999);
String code= String.format("%06d", number);
session.setAttribute("code",code);


final String subject = "Course Enrollment";
final String messg = "Dear "+name+",\n    You have successfully initiated the Certificate Course enrollment process.\nCourse- "+cname+"\nPrice- Rs."+price+"\nAmount Rs."+price+" would be added to your semester fee. In order to continue,\nPlease verify your account using this code:"+code;
// Sender's email ID and password needs to be mentioned
final String from = "cs.bvdept@gmail.com";
final String pass = "admin_22";
final String to = email;

// Defining the gmail host
String host = "smtp.gmail.com";
// Creating Properties object
Properties props = new Properties();
// Defining properties
props.put("mail.smtp.ssl.enable","true");
props.put("mail.smtp.host", host);
props.put("mail.transport.protocol", "smtp");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.user", from);
props.put("mail.password", pass);
props.put("mail.port", 587); // there are some other ports also available
// Authorized the Session object.
Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
@Override
protected PasswordAuthentication getPasswordAuthentication() {
return new PasswordAuthentication(from, pass);
}
});
try {
// Create a default MimeMessage object.
MimeMessage message = new MimeMessage(mailSession);

// Set From: header field of the header.
message.setFrom(new InternetAddress(from));

// Set To: header field of the header.
message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
// Set Subject: header field
message.setSubject(subject);

// Now set the actual message
message.setText(messg);

// Send message
//out.println("done till here");
Transport.send(message);
String result = "Your mail sent successfully....";
System.out.println(result);
response.sendRedirect("verify.jsp?CID="+CID);
} 
catch (MessagingException mex) {
mex.printStackTrace();
String result = "Error: unable to send mail....";
System.out.println(mex);
System.out.println(result);
%>

<h1>Something went wrong. The Email ID may not be valid.</h1>

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
<%
}
}
%>

