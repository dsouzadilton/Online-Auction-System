package project;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Calendar;

@WebServlet("/Seller")

public class Seller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Seller() {
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
		
		String name=request.getParameter("itemname");
		String category=request.getParameter("category");
		int startbid=Integer.parseInt(request.getParameter("start_bid"));
		String username;
		 
		response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();
		HttpSession session1=request.getSession(false);  
        if(session1!=null){  
        username=(String)session1.getAttribute("username"); 
        
        try{
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/next_door_hub","root","");
				PreparedStatement pst=con.prepareStatement("Insert into item(name,category,start_bid,current_bid,status,seller,buyer,day) values(?, ?, ?, ?, ?,?,?,?)");
				Calendar cal=Calendar.getInstance();
				int day=cal.get(Calendar.DAY_OF_YEAR);
				pst.setString(1,name);
				pst.setString(2,category);
				pst.setInt(3,startbid);
				pst.setInt(4,startbid);
				pst.setString(5, "Unsold");
				pst.setString(6,username);
				pst.setString(7, "N/A");
				pst.setInt(8, day);
				
				pst.executeUpdate();
				
			con.close();
			}catch(Exception e){
				out.println("Failed to Auction the Item"); 
				System.out.println(e);
				}   
	    
        request.getRequestDispatcher("seller.jsp").forward(request,response); 
	    } 
        
	}
}