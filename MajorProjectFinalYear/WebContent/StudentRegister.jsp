<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/studentregistration.css">
<title>Student Register</title>
</head>

<body>
<jsp:include page="NavBar.jsp" /> 
<%
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
<div class="container">
    <div class="title">Registration</div>
    <div class="content">
      <form action="StudentRegister" method="post" enctype="multipart/form-data">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name</span>
            <input type="text" name="name" placeholder="Enter your name" required>
          </div>
          
         
          <div class="input-box">
            <span class="details">Email</span>
            <input type="email" name="email" placeholder="Enter your email" required>
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" name="password" placeholder="Enter your password" required>
          </div>
          <div class="radio">
            <span class="details">Gender</span>
            <div>
             <input type="radio" name="gender" value="Male" checked/>Male
			<input type="radio" name="gender" value="Female" />Female
			</div>
          </div>
          <div class="input-box">
            <span class="details">Phone No.</span>
            <input type="text" name="phone" maxlength="10" placeholder="Enter your Phone No." required>
          </div>
          <div class="input-box">
            <span class="details">Roll Number</span>
            <input type="text" name="roll" placeholder="Enter your roll number" required>
          </div>
          <div class="input-box">
            <span class="details">School</span>
            <input type="text" name="school" placeholder="Enter your School" required>
          </div>
          <div class="input-box">
            <span class="details">Branch</span>
            <input type="text" name="branch" placeholder="Enter your Branch" required>
          </div>
        <div>
            <span class="details">Student ID Card</span>
            <input type="file" name="id"  required>
          </div>
        <div>
            <span class="details">Photo</span>
            <input type="file" name="photo" required>
          </div>
        </div>
        <div class="button">
          <input type="submit" value="Register">
        </div>
      </form>
    </div>
  </div>


</body>
</html>