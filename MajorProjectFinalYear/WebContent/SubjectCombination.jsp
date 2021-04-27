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
	String schoolName=request.getParameter("school");
	String branchName=request.getParameter("branchName");
	DAO dao=new DAO();
	ArrayList<HashMap> allSchools=dao.getAllSchools();
	ArrayList<HashMap> allSubjects=dao.getAllSubjects();
	ArrayList<HashMap> allBranches=dao.getAllBranchesBySchool(schoolName);
	
	
		%>
		<form action="SubjectCombination.jsp" >
School: <select name="school">
		<% 
		if(schoolName!=null){
			%>
		<option value="<%=schoolName %>"><%=schoolName %></option>
		<%
		}
		 %>
		<%
		if(allSchools!=null){
			
		for(HashMap school:allSchools){
			%>
			<option value="<%=school.get("school") %>"><%=school.get("school") %></option>
			<%
		}
		}
		%>
		
		</select>
		<%
			if(schoolName!=null){
		%>
		
		Branch: <select name="branch">
		<% 
		if(branchName!=null){
			%>
		<option value="<%=branchName %>"><%=branchName %></option>
		<%
		}
		 %>
		
		<%
		if(allSchools!=null){
		for(HashMap branch:allBranches){
			%>
			<option value="<%=branch.get("branchName") %>"><%=branch.get("branchName") %></option>
			<%
		}
	
		%>
		
		</select>
		<%
		}
		%>
		Subject: <select name="subject" multiple>
			<%
			for(HashMap subject: allSubjects){
				%>
				<option value="<%=subject.get("subjectName")%>"><%=subject.get("subjectName") %>, <%=subject.get("subjectCode") %></option>
				<%
			}
			%>
			
		</select>
		
		<select name="semester">
		<option>Semester 1</option>
		<option>Semester 2</option>
		<option>Semester 3</option>
		<option>Semester 4</option>
		<option>Semester 5</option>
		<option>Semester 6</option>
		<option>Semester 7</option>
		<option>Semester 8</option>
		</select>
		
		<%
		
		}%>
		
		<button type="submit">GO</button>
</form>
</body>
</html>