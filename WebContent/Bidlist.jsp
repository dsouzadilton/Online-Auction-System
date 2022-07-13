<%@page import="java.sql.*" language="java" contentType="text/html;charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Auction</title>
<body>
<div class="buyer">
		<ul>
			<li><a  href="http://localhost:8080/TheNextDoorHub/welcome.jsp">Dashboard</a>
</ul>
<%

try{
	HttpSession session1=request.getSession(false);  
    if(session1!=null){  
    String username=(String)session.getAttribute("username");
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/next_door_hub","root","");  
    PreparedStatement ps= con.prepareStatement("select * from bidlist where status =? and buyer =?");
    ps.setString(1,"unseen");
    ps.setString(2,username);
    ResultSet rst=ps.executeQuery();
    int count=0;    
            	 while(rst.next()){	
    	
            
%>
	        <div class="display"><hr><p>Dear <%=username%>,<br>your recent bid on <%=rst.getString("name")%> (category: <%=rst.getString("category")%>)has been advanced by someone else.
	        <br>Proceed to the Auction room to place your bid.</p>
	        <br><p><a class="linkbtn" href="http://localhost:8080/TheNextDoorHub/buyer.jsp">Click here to Proceed to Auction House</a><br><br></p>
	             <form method="post" action="bidmark">
		<table>
			<tr>
				<td><input class="btn"type="submit"  value="Mark as Read" name="mark"></td>
			</tr>
		</table>
		
		<input type="hidden" value="<%=rst.getString("ID") %>" name="noteID">
	</form>
	        <hr></div><br><br><br><br><br><br><br><br><br><br><br><br><br>
	        <% count++;
	    }if(count==0){
		     %>
		       <p><font size=10>No New Notifications!</font></p>
		   	<%

	    }
	    con.close();
    }
	    }catch(Exception e){
    System.out.println(e);
}
%>
</div></body>