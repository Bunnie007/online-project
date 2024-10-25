package propack;
import java.sql.*;
public class Conprovider {
	public static Connection getCon() 
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oswp1","root","tushar&03#25");
			return con;
		}
		catch(Exception e)
		{
			System.out.print(e);
			return null;
		}
	}

}
