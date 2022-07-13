<%@page import="java.sql.*" language="java" contentType="text/html;charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Profile</title>

<%
try{
	HttpSession session1=request.getSession(false);  
    if(session1!=null){  
    String username=(String)session.getAttribute("username");  
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/next_door_hub","root","");  
    PreparedStatement ps= con.prepareStatement("select * from user where username=?");
    ps.setString(1,username);
	ResultSet rst=ps.executeQuery();
        while(rst.next()){        
%>
	        <body>
	        <header><div class="main">
		<ul>
			<li><a  href="http://localhost:8080/TheNextDoorHub/welcome.jsp">Dashboard</a>
</ul>	    <div class="title">    <h3 style="padding:2em; text-align:center;">PROFILE</h3>
	        <table style="table-align:center" >
	        <tr><td style="padding:1em ; text-align:center;">Name:</td><td style="padding:1em ; text-align:center;"><%=rst.getString("username")%></td></tr>
	        <tr><td style="padding:1em ; text-align:center;">Contact No:</td><td style="padding:1em ; text-align:center;"><%=rst.getString("number")%></td></tr>
	        <tr><td style="padding:1em ; text-align:center;">Mail:</td><td style="padding:1em ; text-align:center;"><%=rst.getString("mail")%></td></tr>
	        </table></div>
<%		
	
        }
        con.close();
    }
}catch(Exception e){
    System.out.println(e);
}
%></div>
</header></body>