<%@page import="java.util.HashMap"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%
	HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
	if(studentDetails!=null){
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/profileupdationform.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Profile</title>
</head>
<body>
<jsp:include page="NavBar.jsp" />
	
	<main>
        <div class="container">
            <div class="title">Profile Updation Form</div>
            <div class="content">
                <form action="EditProfile" method="post">
                <%
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<div class="incorrect"><%=m %></div>
	<%		
			session.setAttribute("message",null);
		}
	%>
                    
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">Email :</span>
                            <input type="email" name="email" value=<%=studentDetails.get("email") %> placeholder="Enter the Email" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Name :</span>
                            <input type="text" name="name" value=<%=studentDetails.get("name") %> placeholder="Enter the Name" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Phone No :</span>
                            <input type="number" name="phone" maxlength="10" value=<%=studentDetails.get("phone") %> required>
                        </div>
                        <div class="input-box">
                            <span class="details">School</span>
                            <input type="text" name="school" placeholder="ICT" value=<%=studentDetails.get("school") %> required>
                        </div><div class="input-box">
                            <span class="details">Branch</span>
                            <input type="text" name="branch" placeholder="IT" value=<%=studentDetails.get("branch") %> required>
                        </div>
                        <!--  
                        <div class="input-box">
                            <span for="school" class="details">School Name :</span>
                            <select name="school" id="options">
                                <option value="SOICT">SOICT</option>
                                <option value="SOICT">SOE</option>
                                <option value="SOICT">SOM</option>
                                <option value="SOICT">SOVAS</option>
                            </select>
                        </div>
                        <div class="input-box">
                            <span for="branch" class="details">Branch :</span>
                            <select name="branch" id="options">
                                <option value="CS">CS</option>
                                <option value="IT">IT</option>
                                <option value="AI">AI</option>
                                <option value="IOT">IOT</option>
                            </select>
                        </div>
                        -->

                        <div class="input-box">
                            <span class="details">Roll No :</span>
                            <input type="text" name="roll" placeholder="17/BIT/012" value=<%=studentDetails.get("roll") %> required>
                        </div>
                        <%
	String aadhar=(String)studentDetails.get("aadhar");
	%>
                        <div class="input-box">
                            <span class="details">Aadhar No :</span>
                            <input type="number" name="aadhar" maxlength="12" <%if(aadhar!=null){ %> value=<%=studentDetails.get("aadhar")%> <%} %> placeholder="Enter the Aadhar No." required>
                        </div>

                        <div class="button">
                            <input type="submit" value="Update Profile">
                        </div>
                        <div class="button">
                            <input type="reset" value="Reset">
                        </div>

                </form>
            </div>
        </div>
       
    </main>
	<jsp:include page="Footer.jsp" />
</body>
</html>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("StudentLogin.jsp");
	}
%>