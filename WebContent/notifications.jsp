<%@page import="java.sql.*" language="java" contentType="text/html;charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Notifications</title>
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
    PreparedStatement ps= con.prepareStatement("select * from notifications where status =? and buyer =?");
    ps.setString(1,"unseen");
    ps.setString(2,username);
    ResultSet rst=ps.executeQuery();
    int count=0;    
            	 while(rst.next()){	
    	
            
%>
	        <div class="display"><table>
	        <tr><td><%=rst.getString("name")%></td></tr>
	        <tr><td>Category:</td><td><%=rst.getString("category")%></td></tr>
	        <tr><td>Amount:</td><td><%=rst.getString("amount")%></td></tr>
	        <tr></tr>
	        </table>
	         <form method="post" action="Pay">
		<table>
			<tr>
				<td><input   class="btn" type="submit"  value="Confirm Payment" name="pay"></td>
			</tr>
		</table>
		<input type="hidden" value="<%=rst.getString("itemID")%>" name="ID">
		<input type="hidden" value="<%=rst.getString("ID") %>" name="noteID">
	</form>
	        <hr></div>
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
%></div></body>