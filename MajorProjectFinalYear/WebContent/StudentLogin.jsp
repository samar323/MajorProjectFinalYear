<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
	if(studentDetails==null){
%>
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Login</title>
</head>
<body>
<%
String m=(String)session.getAttribute("message");
if(m!=null){
	%>
	<p style="background-color:yellow; width:max-content;"><%=m %></p>
	<%
	session.setAttribute("message",null);
	}
	%>
	<a href="index.jsp">Home</a>
<h1>Student Login</h1>

<form action="StudentLogin" method="post">
Email: <input type="email" name="email" required/><br><br>
Password: <input type="password" name="password" required/><br><br>
<a href="ForgotPassword.jsp">Forgot Password?</a><br>
<button type="submit">Login</button>
<button type="reset">Reset</button>

</form>
<br>Don't have a account?
<a href="StudentRegister.jsp">Register here</a>
</body>
</html>
<%
	}else{
		response.sendRedirect("StudentHome.jsp");
	}
%>