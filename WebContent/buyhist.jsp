<%@page import="java.sql.*" language="java" contentType="text/html;charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">
<title>History</title>
<body><header><div class="buyer">
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
    PreparedStatement ps= con.prepareStatement("select * from item where status =? and buyer =?");
    ps.setString(1,"Paid");
    ps.setString(2,username);
    ResultSet rst=ps.executeQuery();
    int count=0;    
        while(rst.next()){
%>
	       <div class="display">
	        <table>
	        <tr><td><%=rst.getString("name")%></td></tr>
	        <tr><td>Category:</td><td><%=rst.getString("category")%></td></tr>
	        <tr><td>Amount:</td><td><%=rst.getString("current_bid")%></td></tr>
	        <tr></tr>
	        </table>
	        <hr></div><br><br><br><br><br><br><br><br><br>
	        <% 
	        count++;
	    }if(count==0){
		     %>
		       <p><font size=10>No Data Available!</font></p>
		   	<%

	    }
	    con.close();
    }
	    }catch(Exception e){
    System.out.println(e);
}
%>
</div></header></body>