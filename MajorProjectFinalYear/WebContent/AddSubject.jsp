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
<form action="AddSubject" method="post"> 
Subject Name: <input type="text" name="subjectName" placeholder="Data Structure" required/><br><br>
Subject Code: <input type="text" name="subjectCode" placeholder="CS 205" required/><br><br>
<button type="submit">Add</button>
</form>
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
	<%
	HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
	if(adminDetails!=null){
		int subjectId=Integer.parseInt(request.getParameter("subjectId"));
		DAO dao=new DAO();
		ArrayList<HashMap> allSubjects=dao.getAllSubjects(subjectId);
		for(HashMap subject:allSubjects){
		%>
Subject Name: <%=subject.get("subjectName") %>
Subject Code: <%=subject.get("subjectCode") %>,
<hr>
	<%	
	}
	%>		
</body>
</html>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("AdminLogin.jsp");
	}
%>
 