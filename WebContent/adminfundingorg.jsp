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
    PreparedStatement ps= con.prepareStatement("select * from organisations");
    ResultSet rst=ps.executeQuery();
    int count=0;    
        while(rst.next()){
%>
	        <div class="display"><table>
	        <tr><td>ID:</td><td><%=rst.getString("ID")%></td></tr>
	        <tr><td><%=rst.getString("name")%></td></tr>
	        <tr><td>Contact:</td><td><%=rst.getString("number")%></td></tr>
	        <tr><td>Mail:</td><td><%=rst.getString("mail")%></td></tr>
	        <tr><td>Fund:</td><td><%=rst.getString("fund")%></td></tr>
	        <tr></tr>
	        </table>
	        <form method="post" action="AdminPay">
		<table>
			<tr>
				<td><input  class="btn" type="text"  name="fund"></td>
				<td><input  class="btn" type="submit"  value="Transfer fund to <%=rst.getString("name")%>" name="transfer"></td>
			</tr>
		</table>
		<input type="hidden" value="<%=rst.getString("ID")%>" name="orgID">
		<input type="hidden" value="<%=rst.getString("name")%>" name="name">
		<input type="hidden" value="<%=rst.getString("fund")%>" name="oldfund">
	</form>
	       </div><br><br><br><br><br><br><br><br><br><br><br><br>
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