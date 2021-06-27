<%@page import="dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="dao.DAO"%>
    <%
    HashMap teacherDetails=(HashMap)session.getAttribute("teacherDetails");
    if(teacherDetails!=null){
    	
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/profile.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.tiny.cloud/1/tblirgs9iclfy2vhfk5h2xvxqnkm882tp2vsoz9nij4c3wqn/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			$('#hamburger').click(function(){
				$('nav').toggleClass('show');
			});
		});
	</script>
<title>Profile</title>
<style type="text/css">
.tox.tox-silver-sink.tox-tinymce-aux {
    display: none;
}
</style>
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
	
	<%
	DAO dao=new DAO();
	String email=(String)teacherDetails.get("email");
	String type="teacher";
	byte [] photo=dao.getPhoto(email,type);
	%>
	
    <div class="menu-toggle" id="hamburger">
        <i class="fas fa-bars"></i>
    </div>
    <div class="overlay"></div>
    <div class="container">
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="UpdateTeacher.jsp">Update Profile</a></li>
                <li><a href="TeacherHome.jsp">Profile</a></li>
                <li><a href="TeacherClassroom.jsp">Classroom</a></li>
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
		                <%
			if(photo!=null){
			%>
			 <img src='GetPhoto?email=<%=teacherDetails.get("email")%>&type=teacher' class="rounded-circle" width="100px">
		<%
			}else{
				%>
				<img src='images/user.jpg' class="rounded-circle" width="100px" />
				<%
			}
		%>
                   
                 </div>
                    <div class="mt-3">
                        <h3><%=teacherDetails.get("name") %></h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8 mt-1">
            <div class="card mb-3 content">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3">
                            <h5>Email</h5>
                        </div>
                        <div class="col-md-9 text-secondary">
                            <%=teacherDetails.get("email") %>
                        </div>
                    </div>
                    
                    <hr>
                    <div class="row">
                        <div class="col-md-3">
                            <h5>Phone</h5>
                        </div>
                        <div class="col-md-9 text-secondary">
                            <%=teacherDetails.get("phone") %>
                        </div>
                    </div>
                    
                </div>
            </div>

        </div>
    </div>

<jsp:include page="Footer.jsp" /> 
<script>
    tinymce.init({
      selector: 'textarea',
      plugins: 'a11ychecker advcode casechange formatpainter linkchecker autolink lists checklist media mediaembed pageembed permanentpen powerpaste table advtable tinycomments tinymcespellchecker',
      toolbar: 'a11ycheck addcomment showcomments casechange checklist code formatpainter pageembed permanentpen table',
      toolbar_mode: 'floating',
      tinycomments_mode: 'embedded',
      tinycomments_author: 'Author name'
    });
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

</body>
</html>
<%}
    else{
    	session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("TeacherLogin.jsp");
    }
    %>