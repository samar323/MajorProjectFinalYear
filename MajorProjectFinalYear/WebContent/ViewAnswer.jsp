<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	int quesId=Integer.parseInt(request.getParameter("quesId"));
	DAO dao=new DAO();
	
	ArrayList<HashMap> answers=dao.getAnswer(quesId);
	String question=dao.getQuestionById(quesId);
	try{
	if(answers.size()!=0){
	%>
	Question: <%=question %><br>
	<%
	for(HashMap answer:answers){
%>
	
	answer: <%=answer.get("answers") %>,
	studentId: <%=answer.get("studentId") %>,
	dateTime: <%=answer.get("dateTime") %><br>
	<hr>
<%
	}
	}else{
		%>
			<p>No data Found..</p>
		<%
	}
	}catch(Exception e){
		%>
		<p>exception occured</p>
		<%
	}
%>

</body>
</html>