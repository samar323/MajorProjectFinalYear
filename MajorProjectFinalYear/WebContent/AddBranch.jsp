<%@page import="java.util.HashMap"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Subject</title>
</head>
<body>
<form action="AddBranch" method="post"> 
Semester : <input type="number" name="sem" placeholder="1" required/><br><br>
School : <input type="text" name="school" placeholder="ICT" required/><br><br>
Branch : <input type="text" name="branch" placeholder="IT" required/><br><br>
<button type="submit">Add</button>
</form>

	<%
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
	<hr>
	<%
	DAO dao=new DAO();
	ArrayList<HashMap> allBranches=dao.getAllBranches();
	if(allBranches!=null){
		for(HashMap branch:allBranches){
		%>
		    Semester:<b> <%=branch.get("semester") %></b>
			School :<b> <%=branch.get("school") %></b>
			Branch:<b> <%=branch.get("branchName") %></b>
			<form action="DeleteBranch" method="post">
			<input type="hidden" name="id" value="<%=branch.get("branchId")%>"/>
 <button type="submit">Delete</button>
			</form>
<hr>
		<%	
		}
		%>		
</body>
</html>
<%
		}
		else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("AdminLogin.jsp");
	}
%>
 