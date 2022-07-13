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
@WebServlet("/AdminNotify")
public class AdminNotify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNotify() {
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
	    String name=request.getParameter("name");
	    String category=request.getParameter("category");
	    try{
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/next_door_hub","root","");
				PreparedStatement pst=con.prepareStatement("Insert into notifications(name,category,amount,buyer,itemID,status) values(?,?,?,?, ?, ?)");
				pst.setString(1,name);
				pst.setString(2,category);
				pst.setInt(3, amount);
				pst.setString(4,buyer);
				pst.setInt(5, itemID);
				pst.setString(6,"unseen");
				pst.executeUpdate();
				PreparedStatement ps=con.prepareStatement("Update item set status=? where ID=?");
				ps.setString(1,"not");
				ps.setInt(2,itemID);
				ps.executeUpdate();
			con.close();
			}catch(Exception e){System.out.println(e);} 
	    request.getRequestDispatcher("admintrackPayment.jsp").forward(request,response);  
	}
}