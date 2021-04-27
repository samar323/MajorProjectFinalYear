<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
	if(adminDetails!=null){
		String status=request.getParameter("status");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
</head>
<body>

		Welcome: <b> <%=adminDetails.get("name") %> </b> , 
	<a href='Logout'>Logout</a>
	<hr>
	<a href="AdminHome.jsp?status=pending">Pending Students</a>
	<a href="AdminHome.jsp?status=accept">Accepted Students</a>
	<a href="AdminHome.jsp?status=reject">Rejected Students</a>
	<br>
	<form action="AddSubject.jsp" method="post">
<button type="submit">Add Subject</button>
	</form>
	<form action="AddBranch.jsp" method="post">
<button type="submit">Add Branch</button>
	</form>
	<form action="SubjectCombination.jsp" method="post">
<button type="submit">Subject Combination</button>
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
	DAO dao=new DAO();
	ArrayList<HashMap> allStudents=dao.getAllStudents(status);
	for(HashMap student:allStudents){
	%>
		<img src='GetPhoto?email=<%=student.get("email") %>&type=student' height="100px" width="100px"/> <br>
		Name: <b><%=student.get("name") %>, </b>
		Phone: <%=student.get("phone") %>,
		Email: <%=student.get("email") %>,
		School: <%=student.get("school") %>,
		Gender: <%=student.get("gender") %>,
		Branch: <%=student.get("branch") %>,
		Roll No: <%=student.get("roll") %>
	
		<br>
		<%
			String s=(String)student.get("status");
		
			if(s.equalsIgnoreCase("pending")){
		%>
			<a href="ChangeStudentStatus?email=<%=student.get("email") %>&status=Accept">Accept</a>
			<a href="ChangeStudentStatus?email=<%=student.get("email") %>&status=Reject">Reject</a>
		<%		
			}else if(s.equalsIgnoreCase("accept")){
		%>
		Status: <%=s %>
				<a href="ChangeStudentStatus?email=<%=student.get("email") %>&status=Reject">Reject</a>
			<%	
			}else if(s.equalsIgnoreCase("reject")){
		%>
				<a href="ChangeStudentStatus?email=<%=student.get("email") %>&status=Accept">Accept</a>
			<%	
			}
		%>
	
	<br>
ID:<br> <img src='GetId?email=<%=student.get("email") %>' height="100px" width="100px"/> <br>
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