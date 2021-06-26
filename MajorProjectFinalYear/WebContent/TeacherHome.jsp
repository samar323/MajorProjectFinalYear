<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%
    HashMap teacherDetails=(HashMap)session.getAttribute("teacherDetails");
    if(teacherDetails!=null){
    	
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
</head>
<body>
<h1>My Profile</h1>
Welcome <b><%=teacherDetails.get("name") %></b>
<a href='Logout'>Logout</a>
	
<br>
<hr>
	<%
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
<img src='GetPhoto?email=<%=teacherDetails.get("email")%>&type=teacher' height="100px" width="100px" />
<div>
		Email: <b><%=teacherDetails.get("email") %></b> <br>
		Phone: <b><%=teacherDetails.get("phone") %></b> <br>
		
	</div>

</body>
</html>
<%}
    else{
    	session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("TeacherLogin.jsp");
    }
    %>