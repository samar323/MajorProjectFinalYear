<%@page import="java.util.HashMap"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.ArrayList"%>
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
<title>Update Profile</title>
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
	<h1>Profile Updation Form</h1>
	
	<form action="EditProfile" method="post" enctype="multipart/form-data">
		 Email: <input type="email" name="email" value=<%=studentDetails.get("email") %> required/><br><br>
		
		
		Name: <input type="text" name="name" value=<%=studentDetails.get("name") %> required/><br><br>
		Phone: <input type="text" name="phone" maxlength="10" value=<%=studentDetails.get("phone") %> required/><br><br>
		School Name: <input type="text" name="school" placeholder="ICT" value=<%=studentDetails.get("school") %> required/><br><br>
		
	Branch:<input type="text" name="branch" placeholder="IT" value=<%=studentDetails.get("branch") %> required/><br><br>
	Roll No:<input type="text" name="roll" placeholder="17/BIT/012" value=<%=studentDetails.get("roll") %> required/><br><br>
	Aadhar No:<input type="text" name="aadhar" maxlength="12" required/><br><br>
		<button type="submit">Update</button>
		<button type="reset">Reset</button>
	</form>	
</body>
</html>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("StudentLogin.jsp");
	}
%>