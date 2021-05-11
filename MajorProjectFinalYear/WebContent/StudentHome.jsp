<%@page import="java.util.HashMap"%>
<%@page import="dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
	if(studentDetails!=null){
%>  
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Profile</title>
</head>
<body>

<h1>Your Profile</h1>
	<%
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
	//
	<hr>
	Welcome: <b> <%=studentDetails.get("name") %> </b> ,<br>
	   
	<h2>[Status: <%=studentDetails.get("status") %>]</h2> 
	<a href='Logout'>Logout</a>,
	<a href='index.jsp'>Search Questions</a>,
	<a href='StudentQuestions.jsp'>Your Questions</a>
		<a href='StudentAnswers.jsp'>Your Answers</a>
	<hr>
	<img src='GetPhoto?email=<%=studentDetails.get("email") %>&type=student' height="100px" width="100px"/>
	<div>
		Email: <b><%=studentDetails.get("email") %></b> <br>
		Phone: <b><%=studentDetails.get("phone") %></b> <br>
		School: <b><%=studentDetails.get("school") %></b> <br>
		Branch: <b><%=studentDetails.get("branch") %></b> <br>
		Roll No. : <b><%=studentDetails.get("roll") %></b> <br>
		ID:<br> <img src='GetId?email=<%=studentDetails.get("email") %>' height="100px" width="100px"/> <br>
	</div>
	
		<br>
	<form action="EditProfile.jsp" method="post">
<button type="submit">Edit Profile</button>
	</form>
	<% String status=(String)studentDetails.get("status") ;
	
	if(status.equalsIgnoreCase("accept")){
		%>
	
	Ask any question?
	<form action="PostQuestion" method="post">
	
	<textarea name="question" rows="5" cols="100" required></textarea>
	<input type="submit" value="Post Your Question"/>
	
	</form>
	<%} %>
</body>
</html>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("StudentLogin.jsp");
	}
%>