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
	DAO dao=new DAO();
	ArrayList<HashMap> allSchools=dao.getAllSchools();
	ArrayList<HashMap> allBranches=dao.getAllBranchesBySchool(schoolName);
	
		%>
		<form action="SubjectCombination.jsp" >
School: <select name="school">
		
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
		if(allSchools!=null){
		for(HashMap branch:allBranches){
			%>
			<option value="<%=branch.get("branchName") %>"><%=branch.get("branchName") %></option>
			<%
		}
	}
		%>
		
		</select>
		<%} %>
		
		<button type="submit">GO</button>
</form>
</body>
</html>