<%@page import="dao.DAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
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
	String searchQues=request.getParameter("searchQues");
	%>
<form action="index.jsp">
	<input type="text" name="searchQues" Placeholder="Search Questions"/>
	<button type="submit">Search</button>
</form>

<%
		
		DAO dao=new DAO();
		ArrayList<HashMap> questions=dao.getQuestion(searchQues);
		try{
		if(questions.size()!=0){
		for(HashMap question:questions){
	%>
		qid: <%=question.get("quesId") %>,
		<a href="ViewAnswer.jsp?quesId=<%=question.get("quesId") %>">question: <%=question.get("question") %> </a>,
		studentId: <%=question.get("studentId") %>,
		dateTime: <%=question.get("dateTime") %><br>
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