<%@page import="java.util.HashMap"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Teacher </title>
</head>
<body>
<%
	HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
	if(adminDetails!=null){
		
%> 
<form action="AddTeacher" method="post"> 
 Name: <input type="text" name="name" required/><br><br>
 Email: <input type="email" name="email" required/><br><br>
 Password: <input type="password" name="password" required/><br><br>
  Phone: <input type="text" name="phone" maxlength="10" required/><br><br>
<button type="submit">Add Teacher</button>
</form>

	<%
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
	<hr>
	<%
	DAO dao=new DAO();
	ArrayList<HashMap> allTeachers=dao.getAllTeahers();
	if(allTeachers!=null){
		for(HashMap teacher:allTeachers){
		%>
			Name:<b> <%=teacher.get("name") %></b>
			Email:<b> <%=teacher.get("email") %></b>
			Phone:<b> <%=teacher.get("phone") %></b>
			</form>
<hr>
		<%	
		}
		%>		
</body>
</html>
<%
		}
		else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("AdminLogin.jsp");
	}
%>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("AdminLogin.jsp");
	}
%>
 