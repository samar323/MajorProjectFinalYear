<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/faq.css">
<title>FAQ</title>
</head>
<body>
<jsp:include page="NavBar.jsp" /> 

<%
	DAO dao=new DAO();
	ArrayList<HashMap> allFaqs=dao.getAllFaq();
	%>	

<div class="box">
        <p class="heading">GBUVerse | FAQ's</p>
        <div class="faqs">
        <% 
        if(allFaqs!=null){
        for(HashMap faq:allFaqs){
        	%>
        	<details>
                <summary><%=faq.get("question") %></summary>
                <p class="text"><%=faq.get("answer") %>
                </p>
            </details>
        	<%
        }
        }else{
        	%>
        	No result...
        	<%
        }
        %>
        </div>
    </div>
<jsp:include page="Footer.jsp" /> 
</body>
</html>