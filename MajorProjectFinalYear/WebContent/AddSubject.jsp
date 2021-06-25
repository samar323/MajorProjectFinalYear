<%@page import="java.util.HashMap"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <link rel="stylesheet" href="css/addbranch.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Subject</title>
</head>
<body>
<%
	HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
	if(adminDetails!=null){
%> 
<jsp:include page="AdminNavBar.jsp" />

<section id="mid-section">
<div class="container2">
    <div class="title">Add Subject</div>
    <div class="content">
      <form action="AddSubject" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Subject Name</span>
            <input type="text" name="subjectName" placeholder="Enter the Subject Name" required>
          </div>
          <div class="input-box">
            <span class="details">Subject Code</span>
            <input type="text" name="subjectCode" placeholder="Enter the Subject Code" required>
          </div>
          <div class="button">
            <input type="submit" value="Add">
          </div>
      </form>
    </div>
  </div>

	<%
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
	<h2>Recent Subjects</h2>
	<div class="container-scroll">
  <table>
    <tr>
      <th>Subject Name</th>
      <th>Subject Code</th>
      <th>Action</th>
    </tr>
    <%
	DAO dao=new DAO();
	ArrayList<HashMap> allSubjects=dao.getAllSubject();
	if(allSubjects!=null){
		for(HashMap subject:allSubjects){
		%>
    <tr>
      <td><%=subject.get("subjectName") %></td>
      <td><%=subject.get("subjectCode") %></td>
      <td><form action="DeleteSubject" method="post">
			<input type="hidden" name="id" value="<%=subject.get("subjectId")%>"/>
 <button class="btn btn-danger" type="submit">Delete</button>
			</form></td>
    </tr>
    <%	
		}
		%>
  </table>
  </div>
  <div>
  </section>
<jsp:include page="Footer.jsp" /> 
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
 