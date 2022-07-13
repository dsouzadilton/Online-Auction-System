<%@page import="java.sql.*" language="java" contentType="text/html;charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Auction</title>
<body >
<div class="buyer">
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
    PreparedStatement ps= con.prepareStatement("select * from user where username !=? and password !=?");
    ps.setString(1,username);
    ps.setString(2,"deleted");
    ResultSet rst=ps.executeQuery();
    int count=0;    
        while(rst.next()){
%>
	        <div class="display"><table>
	        <tr><td><%=rst.getString("username")%></td></tr>
	        <tr><td>Category:</td><td><%=rst.getString("number")%></td></tr>
	        <tr><td>Current Bid:</td><td><%=rst.getString("mail")%></td></tr> 
	        <tr></tr>
	        </table>
	        <form method="post" action="admindelpro">
		<table>
			<tr>
				<td><input  class="btn"  type="submit"  value="Delete <%=rst.getString("username")%>'s Profile" name="delete"></td>
			</tr>
		</table>
		<input type="hidden" value="<%=rst.getString("username")%>" name="username">
	</form>
	        </div><br><br><br><br><br><br><br><br>
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
</div></body>