package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Buyer")
public class Buyer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int ID = Integer.parseInt(request.getParameter("ID"));
		String username=(String)request.getParameter("username");
		String seller=request.getParameter("seller");
		String name=request.getParameter("name");
		String category=request.getParameter("category");
		int startbid =Integer.parseInt(request.getParameter("start_bid"));
		int ubid =Integer.parseInt(request.getParameter("ubid"));
		if(ubid ==0) {
			response.sendRedirect("buyer.jsp");
		}
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();
	    	    
	    	try{
	    		Class.forName("com.mysql.jdbc.Driver");  
	    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/next_door_hub","root","");
	    		PreparedStatement t=con.prepareStatement("select * from item where ID=?");
				t.setInt(1,ID);
				ResultSet r=t.executeQuery();
				if(r.next()) {
					if(r.getString("buyer") != "N/A") {
	    		PreparedStatement psst=con.prepareStatement("Insert into bidlist(name,category,buyer,status,itemID) values(?, ?, ?, ?,?)");
	    		psst.setString(1,name);
				psst.setString(2,category);
				psst.setString(3,r.getString("buyer"));
				psst.setString(4,"unseen");
				psst.setInt(5, ID);
				psst.executeUpdate();
				}
	    	}
	    			PreparedStatement pss=con.prepareStatement("Update item set current_bid=?, buyer=? where ID=?");
	    			pss.setInt(1,ubid);
	    			pss.setString(2,username);
	    			pss.setInt(3,ID);
	    			pss.executeUpdate();
					PreparedStatement pst=con.prepareStatement("Insert into history(itemID,start_bid,bid,seller,buyer,status,day) values(?, ?, ?, ?, ?, ?, ?)");
					Calendar cal=Calendar.getInstance();
					int day=cal.get(Calendar.DAY_OF_YEAR); 
					pst.setInt(1,ID);
					pst.setInt(2,startbid);
					pst.setInt(3,ubid);
					pst.setString(4,seller);
					pst.setString(5,username);
					pst.setString(6,"Unsold");
					pst.setInt(7, day);
					pst.executeUpdate();
					con.close();
				}catch(Exception e){
					out.println("Invalid Bid Amount"); 
					response.sendRedirect("buyer.jsp");
					System.out.println(e);
				}
	    	request.getRequestDispatcher("buyer.jsp").forward(request,response); 	    
	    	}  
	}
