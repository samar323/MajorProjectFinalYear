<%@page import="java.util.HashMap"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Subject</title>
</head>
<body>
<%
	HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
	if(adminDetails!=null){
		String status=request.getParameter("status");
%> 
<form action="AddSubject" method="post"> 
Subject Name: <input type="text" name="subjectName" placeholder="Data Structure" required/><br><br>
Subject Code: <input type="text" name="subjectCode" placeholder="CS 205" required/><br><br>
<button type="submit">Add</button>
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
	ArrayList<HashMap> allSubjects=dao.getAllSubject();
	if(allSubjects!=null){
		for(HashMap subject:allSubjects){
		%>
			Subject Name:<b> <%=subject.get("subjectName") %></b>
			Subject Code:<b> <%=subject.get("subjectCode") %></b>
			<form action="DeleteSubject" method="post">
			<input type="hidden" name="id" value="<%=subject.get("subjectId")%>"/>
 <button type="submit">Delete</button>
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
 