<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/studentlogin.css">
<title>Forgot Password</title>
</head>
<body>
<jsp:include page="NavBar.jsp" /> 
	<%	
		String email=(String)session.getAttribute("email");
		String m=(String)session.getAttribute("message");
	%>
	<div class="wrapper">
        <div class="title">Trouble Logging In?</div>
        <form action="ForgotPassword" method="post">
            <div class="incorrect"><%
		if(m!=null){
	%><%=m %>
	<%		
			session.setAttribute("message",null);
		}
	%></div>
            
            <div class="field">
            <%if(email==null){
		%><input type="hidden" name="operation" value="send"/>
	<%
	} %>
                <input <%if(email!=null){%> readonly value="<%=email %>"<%} %> type="email" name="email" required>
                <label>Email Address</label>
            </div>
            <%if(email!=null){
		%>
            <div class="field">
                <input type="password" required>
                <label>Enter OTP </label>
              </div>
             <div class="field">
                <input type="submit" value="Verify">
            </div>
              <%
	}else{ %>
            <div class="field">
                <input type="submit" value="Send OTP to Email">
            </div>
            <%} %>
            <div class="signup-link">Not a member? <a
                    href="Register">Register
                    now</a></div>
        </form>
    </div>
    <jsp:include page="Footer.jsp" /> 
</body>
</html>