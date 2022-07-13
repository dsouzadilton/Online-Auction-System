<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Sell</title>
</head>
<body><header><div class="main">
		<ul>
			<li><a  href="http://localhost:8080/TheNextDoorHub/welcome.jsp">Dashboard</a>
</ul><div class="title">
<form method="post" action="Seller" >
		<table>
			<tr>
				<td>Item</td>
				<td><input type="text" name="itemname"></td>
			</tr>
			<tr>
				<td>Category</td>
				<td><input type="text" name="category"></td>
			</tr>
			<tr>
				<td>Start Price</td>
				<td><input type="text" name="start_bid"></td>
			</tr></table><br>
			
				
				<input class="btn" type="submit"   value="Put Up For Auction" name="Auction It">
			
		
	</form>
	</div>
	</div>
</header>
</body>
</html>