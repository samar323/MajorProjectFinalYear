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

  <link rel="stylesheet" href="css/studentlogin.css">
<title>Student Login</title>
</head>
<body>
<jsp:include page="NavBar.jsp" /> 

<div class="wrapper">
    <div class="title">Login Form</div>
    <form action="StudentLogin" method="post">
      <div class="incorrect"><%
String m=(String)session.getAttribute("message");
if(m!=null){
	%><%=m %>
	<%
	session.setAttribute("message",null);
	}
	%></div>
      <div class="field">
        <input type="email" name="email" required>
        <label>Email Address</label>
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
      <div class="signup-link">Not a member? <a
          href="StudentRegister.jsp">Register
          now</a></div>
    </form>
  </div>

</body>
</html>

<%
	}else{
		response.sendRedirect("StudentHome.jsp");
	}
%>