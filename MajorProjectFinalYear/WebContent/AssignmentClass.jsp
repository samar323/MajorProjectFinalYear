<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
	if(studentDetails!=null){
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
<h1>Join Class</h1>
<form action="JoinClass" method="post">
Class Code: <input type="text" name="classCode" required/><br>
<button type="submit">ADD</button>
</form>
<hr>
<h1>Class Details</h1>
<%
String studentId=(String)studentDetails.get("roll");
DAO dao=new DAO();
ArrayList<HashMap> classDetails=dao.getStudentClass(studentId);

if(classDetails.size()!=0){
	for(HashMap classDetail:classDetails){
		%>
		Class Name: <%=classDetail.get("class_name") %><br>
		Subject: <%=classDetail.get("subject") %><br>
		Teacher Name: <%=classDetail.get("name") %><br>
		Teacher Email: <%=classDetail.get("email") %><br>
		Teacher Phone: <%=classDetail.get("phone") %><br>
		Date: <%=classDetail.get("date") %><br>
		Time: <%=classDetail.get("time") %><br>
		<hr>
		<%
	}
}
%>
</body>
</html>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("StudentLogin.jsp");
	}
%>