<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.HashMap"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FAQ</title>
</head>
<body>
 <%
	HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
	if(adminDetails!=null){
		
%> 
<%
	DAO dao=new DAO();
	ArrayList<HashMap> allFaqs=dao.getAllFaq();
	if(allFaqs!=null){
		for(HashMap faq:allFaqs){
		%>
		<b>Q.<%=faq.get("qid") %></b>
			<%=faq.get("question") %></b><br>
			<b>Ans:</b><%=faq.get("answer") %>
			
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
 <%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("AdminLogin.jsp");
	}
%> 