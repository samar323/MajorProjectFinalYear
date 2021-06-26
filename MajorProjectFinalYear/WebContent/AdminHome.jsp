<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
	if(adminDetails!=null){
		String status=request.getParameter("status");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/adminhome.css">
<title>Admin Home</title>

</head>
<body style="background: rgb(221, 255, 223)">
<jsp:include page="AdminNavBar.jsp" />  

<header>
        <div class="first">
            <h1>Welcome <a href="#"><%=adminDetails.get("name") %></a></h1>
            <!-- Admin Home -->
            <form action="Logout" method="post">
            <button type="submit" class="btn btn-danger">Logout</button>
            </form>
        </div>
    </header>
    <a href='AddTeacher.jsp'>Add Teacher</a>
	
	<div class="btnsection">
        <button type="button" class="btn btn-primary"><a href="AdminHome.jsp?status=pending" class="btnallans">Pending Students</a></button>
        <button type="button" class="btn btn-primary"><a href="AdminHome.jsp?status=accept" class="btnallans">Accepted Students</a></button>
        <button type="button" class="btn btn-primary"><a href="AdminHome.jsp?status=reject" class="btnallans">Rejected Students</a></button>
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
	<!--  
	<h2>Add FAQ's</h2>
	<form action="FAQ" method="post">
	<b>Q.</b><textarea name="question" rows="5" cols="50" required="required"></textarea><br>
	<b>Ans.</b><textarea name="answer" rows="10" cols="100" required="required"></textarea>
	<button type="submit">Add Faq</button>
	</form>-->
	<section>
	<div class="container" style="max-width:100vw">
		<%
	DAO dao=new DAO();
	ArrayList<HashMap> allStudents=dao.getAllStudents(status);
	for(HashMap student:allStudents){
	%>
	
	
        <div class="card">
            <div class="content">
                <div class="imgbx"><img src="GetPhoto?email=<%=student.get("email") %>&type=student"></div>
            </div>
            <ul class="sci">
                <li>
                    <h4><b>Name : <%=student.get("name") %></b></h4>
                </li>
                <li>
                    <h4><b>Phone No : <%=student.get("phone") %></b></h4>
                </li>
                <li>
                    <h4><b>Email : <%=student.get("email") %></b></h4>
                </li>
                <li>
                    <h4><b>School : <%=student.get("school") %></b></h4>
                </li>
                <li>
                    <h4><b>Gender : <%=student.get("gender") %></b></h4>
                </li>
                <li>
                    <h4><b>Branch : <%=student.get("branch") %></b></h4>
                </li>
                <li>
                    <h4><b>Roll No : <%=student.get("roll") %></b></h4>
                </li>
                <li>
                    <h4><b>ID : <a href="GetId?email=<%=student.get("email") %>" target="_blank"><img src="GetId?email=<%=student.get("email") %>"></a></b></h4>
                </li>
            </ul>
            <%
			String s=(String)student.get("status");
		
			if(s.equalsIgnoreCase("pending")){
		%>
            <div class="acceptandreject">
                <button type="button" class="btn btn-success"><a href="ChangeStudentStatus?email=<%=student.get("email") %>&status=Accept" class="btnallans">Accept</a></button><br>
                <button type="button" class="btn btn-danger"><a href="ChangeStudentStatus?email=<%=student.get("email") %>&status=Reject" class="btnallans">Reject</a></button>
            </div>
             <%		
			}else if(s.equalsIgnoreCase("accept")){
		%>
		<div class="acceptandreject">
                <button type="button" class="btn btn-danger"><a href="ChangeStudentStatus?email=<%=student.get("email") %>&status=Reject" class="btnallans">Reject</a></button>
            </div>
             <%	
			}else if(s.equalsIgnoreCase("reject")){
		%>
		<div class="acceptandreject">
                <button type="button" class="btn btn-success"><a href="ChangeStudentStatus?email=<%=student.get("email") %>&status=Accept" class="btnallans">Accept</a></button><br>
            </div>
             <%	
			}
			%>
        </div>
        <%
	}
	%>
	
            </div>
        
    </section>
	   <jsp:include page="Footer.jsp" /> 
</body>
</html>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("AdminLogin.jsp");
	}
%>