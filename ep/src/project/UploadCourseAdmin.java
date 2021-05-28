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
 * Servlet implementation class UploadCourseAdmin
 */
@WebServlet("/UploadCourseAdmin")
@MultipartConfig
public class UploadCourseAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadCourseAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
    	HttpSession session=request.getSession();
    	String email=session.getAttribute("email").toString();
    	//String email=request.getParameter("email");
    	String tname=request.getParameter("tname");
		String cname=request.getParameter("cname");
		String cdes=request.getParameter("cdes");
		
		String price=request.getParameter("price");
		String category=request.getParameter("category");
    	
    	
    	
    	
    	response.setContentType("text/html; charset=ISO-8859-1");
    	PrintWriter out= response.getWriter();
    	
    		Part part=request.getPart("file");
    		String fileName= part.getSubmittedFileName();	
    		System.out.println(fileName);
    		String path= getServletContext().getRealPath("/") +"filestuff" + File.separator+ "courseimages" + File.separator + fileName ;
    		
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
    		
    		
    		try
    		{
    			Connection con=ConnectionProvider.getcon();
    			Statement st1=con.createStatement();
    		
    			ResultSet rs=st1.executeQuery("select * from teacher where name= '"+tname+"'");
    		    rs.next();
    		    String temail=rs.getString(3);
    			
    			PreparedStatement ps=con.prepareStatement("insert into course(cname, cdes, pic, temail, price, category) values(?,?,?,?,?,?)");
    			ps.setString(1, cname);
    			ps.setString(2, cdes);
    			ps.setString(3, fileName);
    			ps.setString(4, temail);
    			if("".equals(price))
    			{
    			ps.setString(5, "0");
    			}
    			else {
    			ps.setString(5, price);
    			}
    			ps.setString(6, category);
    			ps.executeUpdate();
    			response.sendRedirect("addcourseadmin.jsp?msg=done");
    			
    		}
    		catch(Exception e)
    		{
    			System.out.println(e);
    			response.sendRedirect("addcourseadmin.jsp?msg=wrong");
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
