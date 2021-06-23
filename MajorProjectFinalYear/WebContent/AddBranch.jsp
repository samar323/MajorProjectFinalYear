<%@page import="javaFiles.SuffixSem"%>
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
<title>Add Branch</title>
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
    <div class="title">Add Branch</div>
    <div class="content">
      <form action="AddBranch" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">School</span>
            <input type="text" name="school" placeholder="Enter the School" required>
          </div>
          <div class="input-box">
            <span class="details">Branch</span>
            <input type="text" name="branch" placeholder="Enter the Branch" required>
          </div>
          <div class="input-box">
            <span class="details">Total Number of Semester</span>
            <input type="number" name="sem" placeholder="Enter the Total Number of Semester" required>
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
      <th>School</th>
      <th>Branch</th>
      <th>Semester</th>
      <th>Action</th>
    </tr>
    
    <%
	DAO dao=new DAO();
    SuffixSem suf=new SuffixSem();
	ArrayList<HashMap> allBranches=dao.getAllBranches();
	if(allBranches!=null){
		for(HashMap branch:allBranches){
		%>
    <tr>
      <td><%=branch.get("school") %></td>
      <td><%=branch.get("branchName") %></td>
      <td><%=branch.get("semester") %><%=suf.suffix((int)branch.get("semester")) %></td>
      <td>
      <form action="DeleteBranch" method="post">
      <input type="hidden" name="id" value="<%=branch.get("branchId")%>"/>
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