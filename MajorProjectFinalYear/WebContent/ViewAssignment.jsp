<%@page import="javaFiles.TimeConversion"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="https://cdn.tiny.cloud/1/tblirgs9iclfy2vhfk5h2xvxqnkm882tp2vsoz9nij4c3wqn/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
 <title>Add Assignment</title>
 <style type="text/css">
.tox.tox-silver-sink.tox-tinymce-aux {
    display: none;
}
@media(min-width:1200px){
        .container{max-width:-webkit-fill-available;}}
        body {
            margin: 0;
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
            display: flex;
            justify-content: center;
        }

        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }

        .container {
            padding: 2px 16px;
        }

        button {
            margin: 5px 0;
        }

        button .btn-success a .btnallans:hover{
            color: #000000;
            text-decoration: none;
        }
        .details{
            background-color: white;
            border-radius: 5px;
            padding: 12px;
            list-style: none;
            
        }

        .btn-primary {
            height: 30%;
            width: 30%;
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
        
    .box {
        margin:auto;
        background: linear-gradient(-135deg, #e2a5de, #a7b3e7);
        border-radius: 7px;
        box-shadow: 1px 2px 4px rgba(0, 0, 0, .3);
    }

    .box .heading {
        background-color: black;
        border-radius: 7px 7px 0px 0px;
        padding: 10px;
        color: #fff;
        text-align: center;
        font-size: 25px;
    }

    .faqs {
        padding: 0px 20px 20px;
    }

    ::-webkit-details-marker {
        float: right;
        margin-top: 1px;

    }
    .text{
        margin:10px;
    }
    h3 p{
        padding-left: 20px;
        padding-bottom: 10px;        
        border-bottom: 1px solid rgba(0, 0, 0, 0.2);
        

    }

    .details {
        background-color: #f6f6f6;
        border-radius: 7px;
        margin-top: 20px;
        font-family: 'Baloo Bhaina 2';
        font-size: 20px;
        letter-spacing: 1px;
        cursor: pointer;
        display: flex;
        align-items: center;
        
    }
    .details .book .fa-book{
        font-size: 30px;
        padding: 10px;
    }
    a.btn.btn-success:hover {
    background-color: #dc3545;
}
</style>
</head>
<body>
<%
String people=request.getParameter("people");

String aid=request.getParameter("aid");
    if(aid!=null){
    DAO dao=new DAO();
    HashMap assignmentClass=dao.getAssignmentClass(Integer.parseInt(aid));
    if(assignmentClass!=null){
    	String tName=(String)assignmentClass.get("name");
    	String email=(String)assignmentClass.get("email");
    	String phone=(String)assignmentClass.get("phone");
    	String classCode=(String)assignmentClass.get("classCode");
    	
	%>
<jsp:include page="NavBar.jsp" /> 
<header>
        <div class="first">
            <h1><%=assignmentClass.get("className") %></h1>
            <h2><%=assignmentClass.get("subject") %></h2>
            <h3>Class Code: <%=classCode %></h3>
        </div>
    </header>
    <%

		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
    <div class="btnsection">
        
        <h2 style="text-align: center;"><a href="ViewAssignment.jsp?aid=<%=aid %>" class="btnallans"><button type="button" class="btn btn-primary" >Stream</button></a>   |  
        <a href="ViewAssignment.jsp?people=check&aid=<%=aid %>" class="btnallans"><button type="button" class="btn btn-primary" >People</button></a></h2>
    </div>
    <% if(people!=null && people.equalsIgnoreCase("check") && aid!=null){
    	ArrayList<HashMap> students=dao.getAllStudentByClassCode(classCode);
	%>
	<div class="box">
        <p class="heading" style="text-align: left;">Teacher</p>
        <h3><p><img src="images/bg1.jpg" style="width: 20px; height: 20px;border-radius:50%;display:center;justify-content:center;align-items:center;">  <%=tName %></p></h3>
        <%
        if(students.size()!=0){
        	%>
        	<p class="heading" style="text-align: left;">Classmates | <%=students.size() %> Students</p>
        	<%
        	for(HashMap student:students){
        		String name=(String)student.get("name");
        		String email1=(String)studentDetails.get("email");
        		String email2=(String)student.get("email");
        		
        		if(email1.equalsIgnoreCase(email2)){
        			name="You";
        		}
        		%>
                <h3><p><img src="images/bg1.jpg" style="width: 20px; height: 20px;border-radius:50%;display:center;justify-content:center;align-items:center;"><%=name %></p></h3>
     
            	<%
        	}
        	
        }
        %>
        </div>
	<%
}else{
	%>
	<div class="box">
        <p class="heading"><%=assignmentClass.get("className") %> | <%=assignmentClass.get("subject") %><br>-Assignments-</p>

        <div class="faqs">
            <%
            TimeConversion tc=new TimeConversion();
ArrayList<HashMap> assignments=dao.getAllAssignments(Integer.parseInt(aid));
if(assignments.size()!=0){
	for(HashMap assignment:assignments){
		String time=assignment.get("time").toString();
		String date = assignment.get("date").toString();
		String timeShow=tc.getTime(time, date);
	%>
            <div class="details">
                <div class="book"><i class="fa fa-book" aria-hidden="true"></i></div>
                <div class="content"><%=tName %> posted an assignment on <%=timeShow %>, due: <%=assignment.get("dueDate") %><br>
                <%=assignment.get("assignment") %></div>
            </div>
            <%
	}
}else{
	%>
	No Assignment
	<%
}
%>
        </div>
    </div>
	
	<%
	
}%>
        <jsp:include page="Footer.jsp" /> 

</body>
</html>
<%}else{
	session.setAttribute("message","Class Does not Exist!!");
	response.sendRedirect("AssignmentClass.jsp");
}
    }else{
    	session.setAttribute("message","Class Does not Exist!!");
		response.sendRedirect("AssignmentClass.jsp");
    }
    }
    else{
    	session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("Login");
    }
%>