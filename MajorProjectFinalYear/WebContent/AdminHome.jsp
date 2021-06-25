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
<title>Admin Home</title>
<style type="text/css">
        * {
            padding: 2px;
            background: rgb(221, 255, 223);
        }

        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            width: 100%;
            margin-bottom: 10px;
            border: 10px;
            padding: 10px;
        }

        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }

        .container {
            padding: 2px 16px;
        }

        button {
            height: 5vh;
            margin: 5px 0
        }

        .btn-primary {
            height: 5vh;
            width: 200px;
            border-radius: 5px;
            border: none;
            color: #fff;
            font-size: 18px;
            font-weight: 500;
            letter-spacing: 1px;
            cursor: pointer;
            transition: all 0.3s ease;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
        }

        .btnallans {
            color: #fff;
        }

        form .button input:hover {
            /* transform: scale(0.99); */
            background: linear-gradient(-135deg, #71b7e6, #9b59b6);
        }

        .container img {
            width: 100%;
            height: auto;
        }

        .container1 img {
            width: 40px;
            height: 40px;
        }

        .container1 h4 {
            font-size: 15px;
            float: left;
        }
        
        .acceptandreject {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-evenly;
}

*
  </style>
</head>
<body>
<jsp:include page="AdminNavBar.jsp" />  

<header>
        <div class="first">
            <h1>Welcome <a href="#"><%=adminDetails.get("name") %></a></h1>
            <form action="Logout" method="post">
            <button type="submit" class="btn btn-danger">Logout</button>
            </form>
        </div>
    </header>
    <a href='Faq.jsp'>FAQ</a>
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
	
	<section id="team">
        <div class="container">
            <div class="row">
		<%
	DAO dao=new DAO();
	ArrayList<HashMap> allStudents=dao.getAllStudents(status);
	for(HashMap student:allStudents){
	%>
                <div class="col-md-3 profile-pic text-center">
                    <div class="card">
                        <img src="GetPhoto?email=<%=student.get("email") %>&type=student" alt="Avatar" style="width:100%">
                        <div class="container1">
                            <h4><b>Name : <%=student.get("name") %></b></h4>
                            <h4><b>Phone No. : <%=student.get("phone") %></b></h4>
                            <h4><b>Email : <%=student.get("email") %></b></h4>
                            <h4><b>School : <%=student.get("school") %></b></h4>
                            <h4><b>Gender : <%=student.get("gender") %></b></h4>
                            <h4><b>Branch : <%=student.get("branch") %></b></h4>
                            <h4><b>Roll No. : <%=student.get("roll") %></b></h4>
                            <h4><b>ID : <a href="GetId?email=<%=student.get("email") %>"><img src="GetId?email=<%=student.get("email") %>" target="_blank"></a></b></h4>

                        </div>
                        <%
			String s=(String)student.get("status");
		
			if(s.equalsIgnoreCase("pending")){
		%>
                        <div class="acceptandreject">
                            <button type="button" class="btn btn-primary"><a href="#"
                                    class="btnallans">Accept</a></button><br>
                            <button type="button" class="btn btn-primary"><a href="#"
                                    class="btnallans">Reject</a></button>
                        </div>
                    </div>
                    <%		
			}else if(s.equalsIgnoreCase("accept")){
		%>
		 <div class="acceptandreject">
                            <button type="button" class="btn btn-primary"><a href="#"
                                    class="btnallans">Reject</a></button>
                        </div>
                <%	
			}else if(s.equalsIgnoreCase("reject")){
		%>
		<div class="acceptandreject">
                            <button type="button" class="btn btn-primary"><a href="#"
                                    class="btnallans">Accept</a></button>
                        </div>
                       <%	
			}
	}
	%>
	
            </div>
        </div>
    </section>
	    
</body>
</html>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("AdminLogin.jsp");
	}
%>