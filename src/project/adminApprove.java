package project;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.sql.*;
/**
 * Servlet implementation class AdminNotify
 */
@WebServlet("/adminApprove")
public class adminApprove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminApprove() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String buyer=request.getParameter("buyer");
	    int itemID=Integer.parseInt(request.getParameter("itemID"));
	    int amount=Integer.parseInt(request.getParameter("amount"));
	    
	    try{
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/next_door_hub","root","");
				PreparedStatement pst=con.prepareStatement("Insert into payment(itemID,buyer,amount,status) values(?, ?, ?,?)");
				pst.setInt(1,itemID);
				pst.setString(2,buyer);
				pst.setInt(3,amount);
				pst.setString(4,"Paid");
				pst.executeUpdate();
				PreparedStatement ps=con.prepareStatement("Update history set status=? where itemID=? and bid=?");
				ps.setString(1,"Sold");
				ps.setInt(2,itemID);
				ps.setInt(3, amount);
				ps.executeUpdate();
				PreparedStatement pss=con.prepareStatement("Update item set status=? where ID=?");
				pss.setString(1,"Paid");
				pss.setInt(2,itemID);
				pss.executeUpdate();
			con.close();
			}catch(Exception e){System.out.println(e);} 
	    request.getRequestDispatcher("admin.jsp").forward(request,response);  
	}
}