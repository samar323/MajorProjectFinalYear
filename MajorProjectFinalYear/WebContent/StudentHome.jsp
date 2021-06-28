<%@page import="java.util.HashMap"%>
<%@page import="dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
	if(studentDetails!=null){
%>  
<%
response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%> 
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			$('#hamburger').click(function(){
				$('nav').toggleClass('show');
			});
		});
	</script>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student Profile</title>
</head>
<body>
<header>
<%
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
	
    <div class="menu-toggle" id="hamburger">
        <i class="fas fa-bars"></i>
    </div>
    <div class="overlay"></div>
    <div class="container">
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="EditProfile.jsp">Update Profile</a></li>
                <li><a href="StudentQuestions.jsp">QnA's</a></li>
                <li><a href="#">Results</a></li>
                <li><a href="AssignmentClass.jsp">Join Class</a></li>
                <li><a href="Logout">Logout</a></li>
            </ul>
        </nav>
    </div>
</header>
<div class="row">
        <div class="col-md-4 mt-1">
            <div class="card text-center sidebar">
                <div class="card-body">
                <div class="circle">
                    <img src='GetPhoto?email=<%=studentDetails.get("email") %>&type=student' class="rounded-circle" width="100px">
                 </div>
                    <div class="mt-3">
                        <h3><%=studentDetails.get("name") %></h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8 mt-1">
            <div class="card mb-3 content">
                <h1 class="m-3 pt-3">About [Status: <%=studentDetails.get("status") %>]</h1>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3">
                            <h5>Email</h5>
                        </div>
                        <div class="col-md-9 text-secondary">
                            <%=studentDetails.get("email") %>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-3">
                            <h5>School</h5>
                        </div>
                        <div class="col-md-9 text-secondary">
                            <%=studentDetails.get("school") %>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-3">
                            <h5>Phone</h5>
                        </div>
                        <div class="col-md-9 text-secondary">
                            <%=studentDetails.get("phone") %>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-3">
                            <h5>Branch</h5>
                        </div>
                        <div class="col-md-9 text-secondary">
                            <%=studentDetails.get("branch") %>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-3">
                            <h5>Roll No</h5>
                        </div>
                        <div class="col-md-9 text-secondary">
                            <%=studentDetails.get("roll") %>
                        </div>
                    </div>
                    <%
	String aadhar=(String)studentDetails.get("aadhar");
	if(aadhar!=null){
	%>				<hr>
                    <div class="row">
                        <div class="col-md-3">
                            <h5>Aadhaar</h5>
                        </div>
                        <div class="col-md-9 text-secondary">
                            <%=aadhar %>
                        </div>
                    </div>
<%} %>
                    <hr>
                    <div class="row">
                        <div class="col-md-3">
                            <h5>ID</h5>
                        </div>
                        <div class="col-md-9 text-secondary">
						<form action="GetId" method="post" target="_blank">
							<input type="hidden" name="email" value="<%=studentDetails.get("email") %>"/>
							<button class="btn btn-danger" type="submit">View ID</button>
						</form>
                        </div>
                    </div>
                </div>
            </div>
<% String status=(String)studentDetails.get("status") ;
	
	if(status.equalsIgnoreCase("accept")){
		%>
            <form action="PostQuestion" method="post">
                <label for="w3review"><b>Ask your Questions</b></label>
                <textarea id="w3review" name="question" rows="6" cols="90" required>
                </textarea>
                <br>
                <div class="button">
                    <input type="submit" value="Submit">
                </div>
            </form>
            <%} %>

        </div>
    </div>
    <jsp:include page="Footer.jsp" />
	<!--  <a href='index.jsp'>Search Questions</a>,
	<a href='StudentQuestions.jsp'>Your Questions</a>
		<a href='StudentAnswers.jsp'>Your Answers</a>-->
</body>
</html>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("StudentLogin.jsp");
	}
%>