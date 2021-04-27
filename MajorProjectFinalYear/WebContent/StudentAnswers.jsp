
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
<title>Your Answers</title>
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
	
	<%
	String studentId=(String)studentDetails.get("roll");
	String status=(String)studentDetails.get("status");
	DAO dao=new DAO();
	
	
	ArrayList<HashMap> answers=dao.getAnswerByStudent(studentId);

	if(status.equalsIgnoreCase("accept")){%>
	<h2>Your Answers</h2>
	<% 
	for(HashMap student:answers){
		
	%>

  <b>Q.<%=student.get("question") %></b><br>
<b>Ans:<%=student.get("answers")%></b>
<hr>
	<%	
	}//push
	%>
	
	
	<%
}else{%>
	<h2>You have not verified yet!!</h2>
	<%	
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