<%@page errorPage="errorfile.jsp" %>    
<%
String authcode = request.getParameter("authcode");
String CID = request.getParameter("CID");
String email=session.getAttribute("email").toString();
String code=session.getAttribute("code").toString();
if(authcode.equals(code))
{
	
    //System.out.println("Verification Done");
    response.sendRedirect("verify.jsp?msg=correct code&CID="+CID);
}
else{
    //System.out.println("Incorrect verification code");
    response.sendRedirect("verify.jsp?msg=incorrect code&CID="+CID);
}



%>