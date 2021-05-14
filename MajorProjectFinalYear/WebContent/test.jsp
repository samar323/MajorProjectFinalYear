<%@page import="javaFiles.AES"%>
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
	String s=request.getParameter("text");
	if(s!=null){
		AES aes=new AES();
		%>
		<p>Encrypt: <%=aes.encrypt(s) %></p>
		<p>Decrypt: <%=aes.decrypt(aes.encrypt(s)) %></p>
		<%
	}
%>
<form action="test.jsp">
<input type="text" name="text"/><br>
<button type="submit">submit</button>
</form>

</body>
</html>