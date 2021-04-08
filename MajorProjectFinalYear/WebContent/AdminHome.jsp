<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
</head>
<body>
<%
	HashMap adminDetails =(HashMap)session.getAttribute("adminDetails");
%>
	Welcome: <%=adminDetails.get("name") %>
</body>
</html>