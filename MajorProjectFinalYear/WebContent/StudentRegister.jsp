<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Register</title>
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
	<h1>Student Registration Form</h1>
<form action="StudentRegister" method="post" enctype="multipart/form-data">
		Email: <input type="email" name="email" required/><br><br>
		Password: <input type="password" name="password" required/><br><br>
		Name: <input type="text" name="name" required/><br><br>
		Phone: <input type="text" name="phone" maxlength="10" required/><br><br>
		Gender: <input type="radio" name="gender" value="Male" checked/>Male
				<input type="radio" name="gender" value="Female" />Female 
				<br><br>
		Photo:<input type="file" name="photo" required><br><br>
		
		School Name: <input type="text" name="school" placeholder="ICT" required/><br><br>
		
	Branch:<input type="text" name="branch" placeholder="IT" required/><br><br>
	Roll No:<input type="text" name="roll" placeholder="17/BIT/012" required/><br><br>
	College ID: <input type="file" name="id" required/><br><br>
		<button type="submit">Register</button>
		<button type="reset">Reset</button>
	</form>	
</body>
</html>