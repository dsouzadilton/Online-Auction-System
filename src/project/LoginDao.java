package project;
import java.sql.*;

public class LoginDao {

	public static boolean validate(String user, String password) {
	boolean status=false;
	try{
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/next_door_hub","root","");
	PreparedStatement ps=con.prepareStatement("select * from user where username=? and password=?");
	ps.setString(1,user);
	ps.setString(2,password);
	ResultSet rs=ps.executeQuery();
	status=rs.next();
	con.close();
	}catch(Exception e){System.out.println(e);}
	return status;
	}   
	
	
	public static boolean validateadmin(String password) {
		boolean status=false;
		try{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/next_door_hub","root","");
		PreparedStatement ps=con.prepareStatement("select * from user where username=? and password=?");
		ps.setString(1,"admin");
		ps.setString(2,password);
		ResultSet rs=ps.executeQuery();
		status=rs.next();
		con.close();
		}catch(Exception e){System.out.println(e);}
		return status;
		}   



}