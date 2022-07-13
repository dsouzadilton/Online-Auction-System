<%@page import="java.sql.*" language="java" contentType="text/html;charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Auction</title>
<body><div class="buyer">
		<ul>
			<li><a  href="http://localhost:8080/TheNextDoorHub/admin.jsp">Dashboard</a>
</ul>
<%

try{
	HttpSession session1=request.getSession(false);  
    if(session1!=null){  
    String username=(String)session.getAttribute("username");  
      
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/next_door_hub","root","");  
    PreparedStatement ps= con.prepareStatement("select * from item where status != ?");
    ps.setString(1,"delete");
    ResultSet rst=ps.executeQuery();
    int count=0;    
        while(rst.next()){
%>
	        <div class="display"><table>
	        <tr><td>ID:</td><td><%=rst.getString("ID")%></td></tr>
	        <tr><td><%=rst.getString("name")%></td></tr>
	        <tr><td>Category:</td><td><%=rst.getString("category")%></td></tr>
	        <tr><td>Current Bid:</td><td><%=rst.getString("start_bid")%></td></tr> 
	        <tr><td>Current Bid:</td><td><%=rst.getString("current_bid")%></td></tr>
	        <tr><td>Seller:</td><td><%=rst.getString("seller")%></td></tr>
	        <tr><td>Current Bidder:</td><td><%=rst.getString("buyer")%></td></tr>
	        <tr><td>Status:</td><td><%=rst.getString("status")%></td></tr>
	        <tr><td>Day:</td><td><%=rst.getString("day")%></td></tr>
	        <tr></tr>
	        </table>
	        <form method="post" action="admindelitem">
		<table>
			<tr>
				<td><input  class="btn" type="submit"  value="Delete <%=rst.getString("name")%>" name="delete"></td>
			</tr>
		</table>
		<input type="hidden" value="<%=rst.getString("ID")%>" name="id">
	</form>
	       </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	        <% 
	        count++;
	    }if(count==0){
		     %>
		       <p><font size=10>No Data to Display</font></p>
		   	<%

	    }
	    con.close();
    }
	    }catch(Exception e){
    System.out.println(e);
}
%>
</div>
</body>