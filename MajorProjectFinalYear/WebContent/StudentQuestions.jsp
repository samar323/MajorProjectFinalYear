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
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
<%
HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
String studentId=(String)studentDetails.get("roll");

DAO dao=new DAO();
ArrayList<HashMap> questions=dao.getQuestionByStudent(studentId);

for(HashMap student:questions){
%>

<a href="ViewAnswer.jsp?quesId=<%=student.get("quesId") %>"><b>Q.<%=student.get("quesId")%></b> 
 <b><%=student.get("question")%> </a></b> Date:<%=student.get("dateTime")%>
 <form action="DeleteQuestion">
 <input type="hidden" name="id" value="<%=student.get("quesId")%>"/>
 <button type="submit">Delete</button></form>
 <hr>
	<%	
	}
	%>
</body>
</html>