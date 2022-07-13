package project;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
/**
 * Servlet implementation class AdminPay
 */
@WebServlet("/AdminPay")
public class AdminPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPay() {
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
		int ID=Integer.parseInt(request.getParameter("orgID"));
		String name = request.getParameter("name");
		int fund=Integer.parseInt(request.getParameter("fund"));
		int oldfund=Integer.parseInt(request.getParameter("oldfund"));
		HttpSession session1=request.getSession(false);  
	    if(session1!=null){ 
	    	try{
	    		Class.forName("com.mysql.jdbc.Driver");  
	    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/next_door_hub","root","");
	    			PreparedStatement pst=con.prepareStatement("Insert into orgpay(name,orgID,fund) values(?, ?, ?)");
	    			pst.setString(1,name);
	    			pst.setInt(2,ID);
	    			pst.setInt(3,fund);
	    			pst.executeUpdate();
	    			PreparedStatement ps=con.prepareStatement("Update organisations set fund=? where ID=?");
	    			ps.setInt(1,(fund + oldfund));
	    			ps.setInt(2,ID);
	    			ps.executeUpdate();
	    		 
	    		con.close();
	    		}catch(Exception e){System.out.println(e);} 
	    	
	    		response.sendRedirect("adminfundingorg.jsp");  
	    	
	    }
	}
}