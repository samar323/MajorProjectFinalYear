<%@page import="java.util.HashMap"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Questions</title>
</head>
<body>
<h2>Your Questions </h2>
<%
HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
String studentId=(String)studentDetails.get("roll");

DAO dao=new DAO();
ArrayList<HashMap> questions=dao.getQuestionByStudent(studentId);

for(HashMap student:questions){
%>
//

<b>Q.<%=student.get("quesId")%></b> 
 <b><%=student.get("question")%></b> Date:<%=student.get("dateTime")%>
 <hr>
	<%	
	}
	%>
</body>
</html>