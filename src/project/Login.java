package project;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		//request.setAttribute("user", username);
		//request.setAttribute("upass",password);
	    
	    if(LoginDao.validate(username, password)){  
	    	HttpSession session=request.getSession();  
	        session.setAttribute("username",username);
	        if(LoginDao.validateadmin(password)) {
	        	request.getRequestDispatcher("admin.jsp").forward(request,response);
	        }else {
	        	request.getRequestDispatcher("welcome.jsp").forward(request,response);  
	    }  
	    }
	    else{  
	        response.sendRedirect("index.html");    
	    }  
	}
}