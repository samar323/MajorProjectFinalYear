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
<title>Add Teacher </title>
<style>
@media (max-width: 411px){
  	.h2, h2 {
    font-size: 1rem;
}
}
</style>
</head>
<body>
<%
	HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
	if(adminDetails!=null){
		
%>


<jsp:include page="AdminNavBar.jsp" />  
<section id="mid-section">
<div class="container2">
    <div class="title">Add Faculty</div>
    <div class="content">
      <form action="AddTeacher" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Name</span>
            <input type="text" name="name" required>
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="email" name="email" required>
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" name="password" required>
          </div>
          <div class="input-box">
            <span class="details">Phone No.</span>
            <input type="number" name="phone" maxlength="10" required>
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
	
	<h2 style="@media (max-width: 411px){font-size: 1rem;}">Recent Branches</h2>
	<div class="container-scroll">
  <table>
    <tr>
      <th>Name</th>
      <th>Email</th>
      <th>Phone</th>
      <th>Action</th>
    </tr>
    
    <%
	DAO dao=new DAO();
    ArrayList<HashMap> allTeachers=dao.getAllTeahers();
    if(allTeachers!=null){
		for(HashMap teacher:allTeachers){
		%>
    <tr>
      <td><%=teacher.get("name") %></td>
      <td><%=teacher.get("email") %></td>
      <td><%=teacher.get("phone") %></td>
      <td>
      <form action="DeleteTeacher" method="post">
      <input type="hidden" name="id" value="<%=teacher.get("tid")%>"/>
      <button class="btn btn-danger" type="submit">Delete</button>
      </form>
      </td>
    </tr>
    <%	
		}
		%>
		
  </table>
  </div>
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
 