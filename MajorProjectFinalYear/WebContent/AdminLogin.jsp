<%@page import="java.util.HashMap"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
	if(adminDetails==null){
		
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/studentlogin.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Login</title>
</head>
<body>
<jsp:include page="NavBar.jsp" /> 
<div class="wrap-pad">
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
      <div class="content">
        <div class="checkbox">
          <input type="checkbox" id="remember-me">
          <label for="remember-me">Remember me</label>
        </div>
        <div class="pass-link"><a href="ForgotPassword.jsp">Forgot password?</a></div>
      </div>
      <div class="field">
        <input type="submit" value="Login">
      </div>
    </form>
  </div>
</div>
<jsp:include page="Footer.jsp" /> 
</body>
</html>
<%
	}else{
		response.sendRedirect("AdminHome?status=pending");
	}
%>