
<%@page import="java.time.LocalTime"%>
<%@page import="javaFiles.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javaFiles.DateConversion"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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




<a href="StudentLogin.jsp">Student Login Here</a>

<%
	String searchQues=request.getParameter("searchQues");
	%>
<form action="index.jsp">
	<input type="text" name="searchQues" Placeholder="Search Questions"/>
	<button type="submit">Search</button>
</form>

<%		TimeConversion tc=new TimeConversion();
		DAO dao=new DAO();
		ArrayList<HashMap> questions=dao.getQuestion(searchQues);
		try{
		if(searchQues!=null){
		if(questions.size()!=0){
		for(HashMap question:questions){
	%>
		<b>Q: <%=question.get("quesId") %>,</b>
		<a href="ViewAnswer.jsp?quesId=<%=question.get("quesId") %>">question: <%=question.get("question") %> </a>,
		studentId: <%=question.get("studentId") %>
		<%
        String time=question.get("time").toString();
		String date = question.get("date").toString();
		String timeShow=tc.getTime(time, date);
		%>
		time: <%=timeShow %>
		<hr>
	<%
		}
		}else{
			%>
				<p>No data Found..</p>
			<%
		}
		}
		}catch(Exception e){
			e.printStackTrace();
			%>
			<p>exception occured</p>
			<%
		}
	%>



</body>
</html>