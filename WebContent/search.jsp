<%@page import="java.sql.*" language="java" contentType="text/html;charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css">
<title>Auction</title>
<body><header><div class="main">
		<ul><li><a  href="http://localhost:8080/TheNextDoorHub/buyer.jsp">Go Back</a>
	<li><a  href="http://localhost:8080/TheNextDoorHub/welcome.jsp">Dashboard</a>
</ul>
<%String username=null;
	HttpSession session1=request.getSession(false);  
    if(session1!=null){  
     username=(String)session.getAttribute("username");
   
	%>
	        <div class="title"><form method="post" action="search">
		<table>
			<tr>
				<td><input class="btn" type="text"  name="category"></td>
				<td><input class="btn" value="Search" type="submit"  name="search"></td>
			</tr>
		</table>
		
	</form><hr></div>
	        
<%
} 
%>	        
    

</div></header></body> 