package project;
import java.sql.*;

public class ConnectionProvider{
	
	public static Connection getcon()
	{
		try {
			String url="jdbc:mysql://localhost:3306/edu";
			String uname="root";
			String pass="akshita";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,uname,pass);
			return con;
		}
		catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
	}

}
