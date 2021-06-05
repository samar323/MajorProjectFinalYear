
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
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


<form action="ContactUs" method="post"> 
Name : <input type="text" name="name"  required/><br><br>
Email : <input type="email" name="email"  required/><br><br>
Type Your Message : <textarea name="message" rows="10" cols="100" required="required"></textarea><br><br>
<button type="submit">Add Message</button>
</body>
</html>
