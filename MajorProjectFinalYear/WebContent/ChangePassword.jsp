<% String email=(String)session.getAttribute("email");
	if(email!=null){
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="css/studentlogin.css">
<title>Insert title here</title>
</head>
<body>
<%	
		String m=(String)session.getAttribute("message");
	%>
<jsp:include page="NavBar.jsp" /> 
<div class="wrapper">
    <div class="title">Forgot Password</div>
    <form action="ForgotPassword" method="post">
      <div class="incorrect"><%
		if(m!=null){
	%><%=m %>
	<%		
			session.setAttribute("message",null);
		}
	%></div>
      <div class="field">
		<input type="hidden" name="operation" value="newPass"/>
        <input type="password" name="password" required>
        <label>Password</label>
      </div>
      <div class="field">
        <input type="password" name="cnfpassword" required>
        <label>Confirm Password</label>
      </div>
      <div class="field">
        <input type="submit" value="Submit" />
      </div>
      
    </form>
  </div>

</body>
</html>

<%}else{
	response.sendRedirect("StudentLogin.jsp");
}%>