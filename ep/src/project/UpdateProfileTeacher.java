package project;

import java.io.IOException;
import java.sql.*;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.FileOutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class UpdateProfileTeacher
 */
@WebServlet("/UpdateProfileTeacher")
@MultipartConfig
public class UpdateProfileTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
    	
    	HttpSession session=request.getSession();
    	String email=session.getAttribute("email").toString();
    	
    	
    	String desig=request.getParameter("desig");
    	
    	String phn=request.getParameter("phn");
    	String secques=request.getParameter("sec_ques");
    	String answer=request.getParameter("answer");
    	
    	response.setContentType("text/html; charset=ISO-8859-1");
    	PrintWriter out= response.getWriter();
    	
    		Part part=request.getPart("file");
    		String fileName= part.getSubmittedFileName();	
    		System.out.println(fileName);
    		String path= getServletContext().getRealPath("/") +"filestuff" + File.separator+ "tpics" + File.separator + fileName ;
    		
    		InputStream is= part.getInputStream();
    		boolean success= uploadFile(is,path);
    		if(success)
    		{
    			System.out.println("File uploaded to this directory: " + path);
    		}
    		
    		else
    		{
    			System.out.println("error");
    		}
    		
    	if(email != null)
    	{	
    	try
    	{
    		Connection con=ConnectionProvider.getcon();
    		PreparedStatement ps=con.prepareStatement("update teacher set desig='"+desig+"',phn='"+phn+"', pic='"+fileName+"',sec_ques='"+secques+"',sec_ans='"+answer+"' where email='"+email+"' "); 
    		
    		int i = ps.executeUpdate();
    		if(i > 0)
    		{
    			response.sendRedirect("updateprofile_t.jsp?msg=valid");
    		}
    		else
    		{
    			response.sendRedirect("updateprofile_t.jsp?msg=invalid");
    		}
    		
    		
    	}
    	catch(Exception e)
    	{
    		System.out.println(e);
    		response.sendRedirect("updateprofile_t.jsp?msg=invalid");
    	}
    	}
    }
    
    public boolean uploadFile(InputStream is, String path)
    {
    	boolean test= false;
    	try {
    		byte[] byt=new byte[is.available()];
    		is.read(byt);
    		FileOutputStream fops =new FileOutputStream(path);
    		fops.write(byt);
    		fops.flush();
    		fops.close();
    		
    		test =true;
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	
    	return test;
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
