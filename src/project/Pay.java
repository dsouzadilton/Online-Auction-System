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
 * Servlet implementation class Pay
 */
@WebServlet("/Pay")
public class Pay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pay() {
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
		int ID=Integer.parseInt(request.getParameter("ID"));
		int noteID=Integer.parseInt(request.getParameter("noteID"));
		HttpSession session1=request.getSession(false);  
	    if(session1!=null){ 
	    	try{
	    		Class.forName("com.mysql.jdbc.Driver");  
	    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/next_door_hub","root","");
	    			PreparedStatement pst=con.prepareStatement("Update item set status=? where ID=?");
	    			pst.setString(1,"Unpaid");
	    			pst.setInt(2,ID);
	    			pst.executeUpdate();
	    		
	    				PreparedStatement ps=con.prepareStatement("Update notifications set status=? where ID=?");
	    				ps.setString(1,"seen");
	    				ps.setInt(2,noteID);
	    				ps.executeUpdate();
	    			con.close();
	    		}catch(Exception e){System.out.println(e);} 
	    	
	    		response.sendRedirect("notifications.jsp");  
	    	}
	    
	}
}