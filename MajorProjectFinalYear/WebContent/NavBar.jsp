<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/index.css">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css">
<title>Insert title here</title>
</head>
<body>

	<section id="nav-bar"> 
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="index.jsp"><img src="images/logo.png"></a>
             <div class="search_box">
             <form action="index.jsp">
              <input type="search" name="searchQues" placeholder="Search Your Queries....">
              <span class="fa fa-search"></span>
              </form>
            </div>
            <button class="navbar-toggler"v type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                  </li>
                  <li class="nav-item">
                    <!--<a class="nav-link" href="#testimonials">Registration and Login</a>-->
                    <div class="nav-link">
                    
                    <%
	HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
	if(studentDetails!=null){
%>  
						 
                        <button class="dropbtn">Welcome <%=studentDetails.get("name") %>
                          <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                          <a href="StudentHome.jsp">Profile</a>
                          <a href="Logout">Logout</a>
                        </div>
                        <%}else{
                        	%>
                        	<button class="dropbtn">Registration and Login
                          <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                          <a href="StudentRegister.jsp">Registration for Student</a>
                          <a href="StudentLogin.jsp">Login for Student</a>
                          <a href="teacherlogin.html">Login for Teacher</a>
                        </div>
                       
                        	<%
                        } %>  
                    </div>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="result.html">Result</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#about">About Us</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#contact">Contact Us</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="FAQ.html">FAQ</a>
                </ul>
            </div>
        </nav>
    </section>
</body>
</html>