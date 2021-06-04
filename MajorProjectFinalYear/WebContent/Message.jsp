<%@page import="java.util.HashMap"%>
<%@page import="dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
	if(studentDetails!=null){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
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
<h2>Send Message</h2>

<%String studentEmail=(String)studentDetails.get("email"); %>
<form action="Message" method="post"> 
Name : <input type="text" name="name"  required/><br><br>
Email : <input type="email" name="email"  required/><br><br>
Type Your Message : <textarea name="message" rows="10" cols="100" required="required"></textarea><br><br>
<button type="submit">Add</button>
</body>
</html>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("StudentLogin.jsp");
	}
%>