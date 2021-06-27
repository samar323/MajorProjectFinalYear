<%@page import="java.util.HashMap"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%
	HashMap teacherDetails=(HashMap)session.getAttribute("teacherDetails");
	if(teacherDetails!=null){
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
                <form action="UpdateTeacher" method="post" enctype="multipart/form-data">
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
                            <input type="email" name="email" value=<%=teacherDetails.get("email") %> placeholder="Enter the Email" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Name :</span>
                            <input type="text" name="name" value=<%=teacherDetails.get("name") %> placeholder="Enter the Name" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Phone No :</span>
                            <input type="number" name="phone" maxlength="10" value=<%=teacherDetails.get("phone") %> required>
                        </div>
                            <div class="input-box">
                            <span class="details">Password :</span>
                            <input type="password" name="password"  value=<%=teacherDetails.get("password") %> required>
                        </div>
                       <div class="photo-box">
							<span class="details">Photograph:</span> <input
								type="file" name="photo"   class="custom-files-input" required >
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
		response.sendRedirect("TeacherLogin.jsp");
	}
%>