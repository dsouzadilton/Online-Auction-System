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
    PreparedStatement ps= con.prepareStatement("select * from item where status=?");
    ps.setString(1,"Unpaid");
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
	        <tr></tr>
	        </table>
	        <form method="post" action="adminApprove">
		<table>
			<tr>
				<td><input class="btn"  type="submit"  value="Approve <%=rst.getString("buyer")%>'s Payment" name="approve"></td>
			</tr>
		</table>
		<input type="hidden" value="<%=rst.getString("buyer")%>" name="buyer">
		<input type="hidden" value="<%=rst.getString("ID")%>" name="itemID">
		<input type="hidden" value="<%=rst.getString("current_bid")%>" name="amount">
	</form>
	        </div><br><br><br><br>
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