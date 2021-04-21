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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.tiny.cloud/1/tblirgs9iclfy2vhfk5h2xvxqnkm882tp2vsoz9nij4c3wqn/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

</head>
<body>
<a href="index.jsp">Home</a><br><hr>
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
	int quesId=Integer.parseInt(request.getParameter("quesId"));
	DAO dao=new DAO();
	
	ArrayList<HashMap> answers=dao.getAnswer(quesId);
	String question=dao.getQuestionById(quesId);
	try{
	%>
	Question: <%=question %><br>
	<%
	HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
	if(studentDetails!=null){
%>
	<p>
  <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Answer
  </a>
</p>
<div class="collapse" id="collapseExample">
  <div class="card card-body">
			<form action="AddAnswer">
				<input type="hidden" name="qid" value="<%=quesId %>" />
				<textarea name="answer" width="80px"> </textarea>
				<button type="submit">submit</button>
			</form>
		</div>
</div>
	<%} %>
	
	<%
	if(answers.size()!=0 ){
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

<script>
    tinymce.init({
      selector: 'textarea',
      plugins: 'a11ychecker advcode casechange formatpainter linkchecker autolink lists checklist media mediaembed pageembed permanentpen powerpaste table advtable tinycomments tinymcespellchecker',
      toolbar: 'a11ycheck addcomment showcomments casechange checklist code formatpainter pageembed permanentpen table',
      toolbar_mode: 'floating',
      tinycomments_mode: 'embedded',
      tinycomments_author: 'Author name'
    });
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

    
</body>
</html>