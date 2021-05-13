<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
</head>
<body>
	<h1>Forgot Password</h1>
	<%	
		String email=(String)session.getAttribute("email");
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
	<form action="ForgotPassword" method="post">
	<%if(email==null){
		%>
	<input type="hidden" name="operation" value="send"/>
	<%
	} %>
	Email-ID: <input <%if(email!=null){%> readonly value="<%=email %>"<%} %>type="email" name="email" placeholder="Enter Your Email-ID"/><br>
	<%if(email!=null){
		%>
		<input type="hidden" name="operation" value="otp"/>
	OTP: <input  type="number" name="otp" placeholder="Enter OTP"/><br>
		<%
	} %>
	
	<button type="submit">Submit</button>
	</form>
</body>
</html>