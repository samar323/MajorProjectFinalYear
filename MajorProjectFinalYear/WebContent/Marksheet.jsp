<!DOCTYPE html>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<html lang="en">

<head>
    <link rel="stylesheet" href="css/Marksheet.css" >
    <link rel="shortcut icon" type="image" href="logo.png">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
    <title>Document</title>
</head>

<body>
<%
String school=request.getParameter("school");
String branch=request.getParameter("branch");
String semester=request.getParameter("semester");
String roll=request.getParameter("roll");
if(school!=null && branch!=null && semester!=null && roll!=null){
	DAO dao=new DAO();
	ArrayList<HashMap> result=dao.getResultByRoll(school, branch, Integer.parseInt(semester), roll);
	if(result.size()!=0){
%>
    <div class="container-image" >
        <img src="images/logo.png" alt="">
    </div>
    <div class="head">
        <div class="up">
            <div class="name">
                <img src="images/logo.png" alt="">
            </div>
            <h1>GAUTAM BUDDHA UNIVERSITY</h1>
        </div>

        <h2>Gautam Buddha Nagar, Uttar Pradesh - 201312(INDIA)</h2>
        <h2>STATEMENT OF GRADES</h2>
        <h3>(2019-2020)</h3>
    </div>
    <div class="skills">
        <span>Enrollment Number: <%=roll %></span>
    </div>
    <div class="skills">
        <span>Name of the Programme: <%=branch %></span>
        <span>Name of the School: <%=school %></span>
    </div>
    <table>
        <tr class="border">
            <th></th>
            <th></th>
            <th>Semester <%=semester %></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        <tr>
            <th>S. No</th>
            <th>COURSE CODE</th>
            <th>COURSE NAME</th>
            <th></th>
            <th>GRADE</th>
        </tr>
        <%
        int sno=1;
        double total_marks=0;
        for(HashMap marks:result){
        	total_marks+=(int)marks.get("marks");
        	%>
        <tr>
            <td><%=sno++ %></td>
            <td><%=marks.get("subjectCode") %></td>
            <td><%=marks.get("subjectName") %></td>
            <th></th>
            <td><%=marks.get("grade") %></td>
        </tr>
        	<%
        }
        double sgpa=total_marks/((sno-1)*10);
        DecimalFormat df = new DecimalFormat();
        df.setMaximumFractionDigits(2);
        %>
       
        <tr class="border">
            <td>SGPA:</td>
            <td><%=df.format(sgpa) %></td>
            <td></td>
            <th></th>
            <td></td>
            <th></th>
            <td></td>
        </tr>
    </table>
    <div class="sign">
        <img src="images/sign.PNG" alt="sign" width="200" height="70">
        <p>Registrar</p>
    </div>
    <div class="btn">
    <button onclick="window.print()">Print this page</button>
    <a href="ViewResult.jsp"><button>Go Back</button></a>
</div>
<%
	}else{
		session.setAttribute("message","No Result Found!!");
		response.sendRedirect("ViewResult.jsp");
	}
}else{
	session.setAttribute("message","Plz Fill all details!");
	response.sendRedirect("ViewResult.jsp");
}
%>
</body>

</html>