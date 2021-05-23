<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/studentlogin.css">
<title>Admin Login</title>
</head>
<body>
<jsp:include page="NavBar.jsp" /> 
<div class="wrapper">
    <div class="title">Login Form</div>
    <form action="AdminLogin" method="post">
      <div class="incorrect"><%
String m=(String)session.getAttribute("message");
if(m!=null){
	%><%=m %>
	<%
	session.setAttribute("message",null);
	}
	%></div>
      <div class="field">
        <input type="text" name="aid" required>
        <label>Admin ID</label>
      </div>
      <div class="field">
        <input type="password" name="password" required>
        <label>Password</label>
      </div>
      <div class="field">
        <input type="submit" value="Login">
      </div>
      <div class="signup-link">Not a member? <a
          href="StudentRegister.jsp">Register
          now</a></div>
    </form>
  </div>
</body>
</html>