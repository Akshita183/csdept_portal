<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%@ page import="javax.activation.*"%>
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String nm = request.getParameter("nm");
String messag = request.getParameter("message");
final String subject = "Contact Form Submitted by "+nm;
final String messg = messag;
// Sender's email ID and password needs to be mentioned
final String from = "joshiadisha2002@gmail.com";
final String pass = "aditi123";
final String to = "joshiadisha2002@gmail.com";

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
response.sendRedirect("index.html?msg=sent");
} 
catch (MessagingException mex) {
mex.printStackTrace();
String result = "Error: unable to send mail....";
System.out.println(mex);
System.out.println(result);
%>

<h1>Something went wrong. The Email ID may not be valid.</h1>
<%
  }
  
%>
</body>
</html>
