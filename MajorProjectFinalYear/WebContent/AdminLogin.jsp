<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>
<body>
<%
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
<form action="AdminLogin" method="post">
	Admin ID: <input type="text" name="aid" placeholder="Enter username"/><br>
	Password: <input type="password" name="password" placeholder="Enter password"/><br>
	<button type="Submit">Login</button>
</form>
</body>
</html>