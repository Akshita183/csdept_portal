package project;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class TeacherProfile
 */
@MultipartConfig
@WebServlet("/TeacherProfile")
public class TeacherProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherProfile() {
        super();
        // TODO Auto-generated constructor stub
    }
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
        {
        	String name=request.getParameter("name");
        	String desig=request.getParameter("desig");
        	String email=request.getParameter("email");
        	String phn=request.getParameter("phn");
        
        	String pass=request.getParameter("pass");
        	
        	String secques=request.getParameter("secques");
        	String ans=request.getParameter("answer");	
        	
        	response.setContentType("text/html; charset=ISO-8859-1");
        	PrintWriter out= response.getWriter();
        	
        		Part part=request.getPart("pic");
        		String fileName= part.getSubmittedFileName();	
        		System.out.println(fileName);
        		String path= getServletContext().getRealPath("/") +"filestuff" + File.separator + "tpics"+ File.separator+ fileName ;
        		
        		InputStream is= part.getInputStream();
        		boolean success= uploadFile(is,path);
        		if(success){
        			System.out.println("File uploaded to this directory: " + path);
        		}
        		
        		else
        		{
        			System.out.println("error");
        		}
        		
        		
        		try
        		{
        			Connection con=ConnectionProvider.getcon();
        			PreparedStatement ps=con.prepareStatement("insert into teacher(name,desig,email,phn,pic,pass,sec_ques,sec_ans) values(?,?,?,?,?,?,?,?)");
        			HttpSession session=request.getSession();
        			session.setAttribute("email",email);
        			ps.setString(1, name);
        			ps.setString(2, desig);
        			ps.setString(3, email);
        			ps.setString(4, phn);
        			ps.setString(5, fileName);
        			ps.setString(6, pass);
        			ps.setString(7, secques);
        			ps.setString(8, ans);
        			ps.executeUpdate();
        			response.sendRedirect("teacherlanding.jsp");
        		}
        		catch(Exception e)
        		{
        			System.out.println(e);
        			response.sendRedirect("signupteacher.jsp?msg=invalid");
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

