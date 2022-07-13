<%@page import="java.sql.*" language="java" contentType="text/html;charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Auction</title>
<body><div class="buyer">
		<ul><li><a  href="http://localhost:8080/TheNextDoorHub/search.jsp">Go Back</a>
	<li><a  href="http://localhost:8080/TheNextDoorHub/welcome.jsp">Dashboard</a>
</ul>
 <%

try{
	HttpSession session1=request.getSession(false);  
    if(session1!=null){  
    String username=(String)session.getAttribute("username");
    String category=(String)request.getAttribute("category");
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/next_door_hub","root","");  
    PreparedStatement ps= con.prepareStatement("select * from item where status =? and seller !=? and buyer !=? and category=?");
    ps.setString(1,"Unsold");
    ps.setString(2,username);
    ps.setString(3,username);
    ps.setString(4,category);
    ResultSet rst=ps.executeQuery();
    int count=0;    
        while(rst.next()){
%>
	        <div class="display"><hr><table>
	        <tr><td><%=rst.getString("name")%></td></tr>
	        <tr><td>Category:</td><td><%=rst.getString("category")%></td></tr>
	        <tr><td>Current Bid:</td><td><%=rst.getString("current_bid")%></td></tr>
	        <tr><td>Current Bidder:</td><td><%=rst.getString("buyer")%></td></tr>
	        
	        <tr></tr>
	        </table>
	        <form method="post" action="Buyer">
		<table>
			<tr>
				<td><input class="btn" type="text"  name="ubid"></td>
				<td><input class="btn" type="submit"  value="Bid on <%=rst.getString("name")%>" name="bid"></td>
			</tr>
		</table>
		<input type="hidden" value="<%=rst.getString("ID")%>" name="ID">
		<input type="hidden" value="<%=rst.getString("seller")%>" name="seller">
		<input type="hidden" value="<%=rst.getString("start_bid")%>" name="start_bid">
		<input type="hidden" value="<%=rst.getString("name")%>" name="name">
		<input type="hidden" value="<%=rst.getString("category")%>" name="category">
				<input type="hidden" value="<%=username%>" name="username">
	</form><br>
	        <hr> <hr></div><br><br><br><br><br><br><br><br><br><br><br><br><br>
	        <% 
	        count++;
	    }if(count==0){
		     %>
		       <p><font size=10>No Item with this Category!</font></p>
		   	<%

	    }
	    con.close();
    }
	    }catch(Exception e){
    System.out.println(e);
}
%>
</div></body>