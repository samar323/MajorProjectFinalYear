
<%@page import="javaFiles.TimeConversion"%>
<%@page import="java.util.HashMap"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.ArrayList"%>
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
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/yourquestion.css">
<title>Your Answers</title>
</head>
<body style="background-color: #333">
<jsp:include page="NavBar.jsp" />
<div class="container">
        <div class="box">
            <p class="heading">Profile | QnA's</p>
            <div class="faqs">

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
	String studentId=(String)studentDetails.get("roll");
	String status=(String)studentDetails.get("status");
	DAO dao=new DAO();
	
	
	ArrayList<HashMap> answers=dao.getAnswerByStudent(studentId);
	TimeConversion tc=new TimeConversion();
	if(status.equalsIgnoreCase("accept")){
	%>
	<div class="center">
<a href="StudentQuestions.jsp"><button class="btn btn-success">Your Questions</button></a>
<a href="StudentAnswers.jsp"><button class="btn btn-light">Your Answers</button></a>
</div>
	
	<% 
	for(HashMap student:answers){
		String time=student.get("time").toString();
		String date = student.get("date").toString();
		String timeShow=tc.getTime(time, date);
		HashMap question=dao.getQuestionById((int)student.get("qid"));
		
		String qtime=question.get("time").toString();
		String qdate = question.get("date").toString();
		String qtimeShow=tc.getTime(time, date);
	%>
	<div class="details">
                    <summary><a href="ViewAnswer.jsp?quesId=<%=student.get("qid") %>" style="font-weight:bold;"><%=student.get("question") %></a></summary>
                    <summary><div class="time" style="font-weight:bold;">asked by <a href="#"><%=question.get("name") %></a> on <%=qtimeShow %></div></summary>
                    <form action="DeleteAnswer">
                    <input type="hidden" name="id" value="<%=student.get("qid")%>"/>
                    <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                    <p class="text"><summary><div class="time">answered by <a href="#"><b>You </b></a>on <%=timeShow %></div></summary></p>
                    <div class="pborder"><%=student.get("answers")%>
                    </div>   
                </div>
                
                

	<%	
	}
	%>
	
                
                </div>
        </div>
    </div>
	
	<%
}else{%>
	<h2>You have not verified yet!!</h2>
	<%	
}
%>
	
	<jsp:include page="Footer.jsp" />
</body>
</html>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("StudentLogin.jsp");
	}
%>