<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://cdn.tiny.cloud/1/tblirgs9iclfy2vhfk5h2xvxqnkm882tp2vsoz9nij4c3wqn/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
 <title>Add Assignment</title>
 <style type="text/css">
.tox.tox-silver-sink.tox-tinymce-aux {
    display: none;
}
</style>
</head>
<body>
<%
String aid=request.getParameter("aid");

		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
<h1>Add Assignment</h1>
<form action="AddAssignment" method="post">
<input type="hidden" name="aid" value="<%=aid%>"/>
<textarea name="assignment" width="80px" required> </textarea>
<br><input type="date" name="dueDate" required/><br>
<button type="submit">ADD</button>
</form>
<hr>
<h1>Assignment Details</h1>
<%
DAO dao=new DAO();
ArrayList<HashMap> assignments=dao.getAllAssignments(Integer.parseInt(aid));
if(assignments.size()!=0){
	for(HashMap assignment:assignments){
	%>
	Assignment: <%=assignment.get("assignment") %><br>
	Date: <%=assignment.get("date") %><br>
	Time: <%=assignment.get("time") %><br>
	DueDate: <%=assignment.get("dueDate") %><br>
	<hr>
	<%
	}
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