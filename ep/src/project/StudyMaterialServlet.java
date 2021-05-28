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
 * Servlet implementation class StudyMaterialServlet
 */
@WebServlet("/StudyMaterialServlet")
@MultipartConfig
public class StudyMaterialServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudyMaterialServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
    	HttpSession session=request.getSession();
    	String email=session.getAttribute("email").toString();
    	String cid=request.getParameter("cid");
    	
    	String sname=request.getParameter("sname");
		String sdes=request.getParameter("sdes");
		String stype=request.getParameter("stype");
		
		response.setContentType("text/html; charset=ISO-8859-1");
    	PrintWriter out= response.getWriter();
    	
    		Part part=request.getPart("file");
    		String fileName= part.getSubmittedFileName();	
    		//System.out.println(fileName);
    		String path= getServletContext().getRealPath("/") +"filestuff" + File.separator+ "studymaterial" + File.separator + fileName ;
    		
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
    		
    		try{
    			Connection con=ConnectionProvider.getcon();
    			PreparedStatement ps=con.prepareStatement("insert into studymaterial(sm_name, sm_des, sm_path, course_id, sm_type, sm_time) values(?,?,?,?,?, NOW())");
    			ps.setString(1, sname);
    			ps.setString(2, sdes);
    			ps.setString(3, fileName);
    			ps.setString(4, cid);
    			ps.setString(5, stype);
    			
    			ps.executeUpdate();
    			response.sendRedirect("viewstudymat_t.jsp?cid="+cid+"&mess=done");	
    		}
    		catch(Exception e)
    		{
    			
    			response.sendRedirect("addstudymat.jsp?msg=wrong");
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
		processRequest(request,response);
		
	}

}
