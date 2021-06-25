<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
	if(adminDetails!=null){
%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/addfaq.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add FAQ</title>
</head>
<body>
<jsp:include page="AdminNavBar.jsp" />
<div class="wrapper">
        <div class="title">FAQ's Form</div>
        <form action="FAQ" method="post">
        <%
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<div class="incorrect" style="text-align: center;"><%=m %></div>
	<%		
			session.setAttribute("message",null);
		}
	%>
            
            <div class="field1">
                <label>Enter the Question :</label>
                <textarea name="question" class="input" required></textarea>
            </div>
            <div class="field1">
                <label>Enter the Answer :</label>
                <textarea name="answer" class="input" required></textarea>
            </div>
            <div class="field">
                <input type="submit" value="Submit">
                <button type="button"><a href="Faq.jsp" target="_blank"> All FAQ's</a></button>
            </div>
        </form>
    </div>
    <jsp:include page="Footer.jsp" /> 
</body>
</html>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("AdminLogin.jsp");
	}
%>