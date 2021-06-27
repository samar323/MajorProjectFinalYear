<%@page import="dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="dao.DAO"%>
    <%
    HashMap teacherDetails=(HashMap)session.getAttribute("teacherDetails");
    if(teacherDetails!=null){
    	
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://cdn.tiny.cloud/1/tblirgs9iclfy2vhfk5h2xvxqnkm882tp2vsoz9nij4c3wqn/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<title>Profile</title>
<style type="text/css">
.tox.tox-silver-sink.tox-tinymce-aux {
    display: none;
}
</style>
</head>
<body>
<h1>My Profile</h1>
Welcome <b><%=teacherDetails.get("name") %></b>
<a href='Logout'>Logout</a>
	
<br>
<hr>
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
	DAO dao=new DAO();
	String email=(String)teacherDetails.get("email");
	String type="teacher";
	byte [] photo=dao.getPhoto(email,type);
	if(photo!=null){
	%>
<img src='GetPhoto?email=<%=teacherDetails.get("email")%>&type=teacher' height="100px" width="100px" />
<%
	}
%>
<div>
		Email: <b><%=teacherDetails.get("email" )%></b> <br>
		Phone: <b><%=teacherDetails.get("phone") %></b> <br>

		<a href="UpdateTeacher.jsp">Update Profile</a>

		<%
		
		int id=(int)teacherDetails.get("tid");
		%>
		Id: <b><%=id %></b> <br>
		

	</div>
<hr>
<h1>Add Assignment Class</h1> 
<form action="AddAssignmentClass">
	Class Name: <input type="text" name="class" placeholder="B.Tech(IT) 4A" required/><br>
	Subject Name: <input type="text" name="subject" placeholder="IT 301" required/><br>
	<button type="submit">Submit</button>
</form>
<%

ArrayList<HashMap> assignmentclasses=dao.getAllAssignmentclass(id);
if(assignmentclasses.size()!=0){
%>
<hr>
<h1>Assignment class</h1>
<%
for(HashMap assignmentclass:assignmentclasses ){
%>
Class: <%=assignmentclass.get("className") %><br>
Subject: <%=assignmentclass.get("subject") %><br>
Code: <%=assignmentclass.get("classCode") %><br>
Date: <%=assignmentclass.get("date") %><br>
Time: <%=assignmentclass.get("time") %><br>
<a href="AddAssignment.jsp?aid=<%=assignmentclass.get("aid") %>">ADD</a>
<hr>
<%}
}%>
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
<%}
    else{
    	session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("TeacherLogin.jsp");
    }
    %>