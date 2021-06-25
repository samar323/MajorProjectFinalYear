<!DOCTYPE html>
<%@page import="dao.DAO"%>
<html lang="en">

<head>
    <link rel="stylesheet" href="css/Marksheet.css" >
    <link rel="shortcut icon" type="image" href="logo.png">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
%>
    <div class="container-image">
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
        <span>Name Of the Student: Aditi Malhotra</span>
        <span>Son/Daughter of: Balraj Malhotra</span>
        <span>Enrollment Number: 17/BIT/004</span>
    </div>
    <div class="skills">
        <span>Name of the Programme: B. Tech in information Technology(IT)</span>
        <span>Name of the School: School of Information and Communication Technology</span>
    </div>
    <table>
        <tr class="border">
            <th></th>
            <th></th>
            <th>Semester V</th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        <tr></tr>
        <tr>
            <th>S. No</th>
            <th>COURSE CODE</th>
            <th>COURSE NAME</th>
            <th></th>
            <th>CREDITS</th>
            <th></th>
            <th>GRADE</th>
        </tr>
        <tr>
            <td>1</td>
            <td>IT306</td>
            <td>Information and Network Security</td>
            <th></th>
            <td>4</td>
            <th></th>
            <td>A+</td>
        </tr>
        <tr>
            <td>2</td>
            <td>IT302</td>
            <td>Algorithm Design and Analysis</td>
            <th></th>
            <td>4</td>
            <th></th>
            <td>A+</td>
        </tr>
        <tr>
            <td>3</td>
            <td>IT304</td>
            <td>Computer Organisation</td>
            <th></th>
            <td>4</td>
            <th></th>
            <td>A+</td>
        </tr>
        <tr>
            <td>4</td>
            <td>IT308</td>
            <td>Information Retrieval and Management</td>
            <th></th>
            <td>4</td>
            <th></th>
            <td>A+</td>
        </tr>
        <tr>
            <td>5</td>
            <td>IT310</td>
            <td>Artificial Intelligence</td>
            <th></th>
            <td>4</td>
            <th></th>
            <td>A+</td>
        </tr>
        <tr>
            <td>6</td>
            <td>IT386</td>
            <td>Information and Network Security Lab</td>
            <th></th>
            <td>1</td>
            <th></th>
            <td>A+</td>
        </tr>
        <tr>
            <td>7</td>
            <td>IT382</td>
            <td>Algorithm and Design Analysis Lab</td>
            <th></th>
            <td>1</td>
            <th></th>
            <td>A+</td>
        </tr>
        <tr>
            <td>8</td>
            <td>IT384</td>
            <td>Artificial Intelligence Lab</td>
            <th></th>
            <td>1</td>
            <th></th>
            <td>A+</td>
        </tr>
        <tr>
            <td>9</td>
            <td>IT492</td>
            <td>Seminar</td>
            <th></th>
            <td>1</td>
            <th></th>
            <td>A+</td>
        </tr>
        <tr>
            <td>10</td>
            <td>GP</td>
            <td>General Proficiency</td>
            <th></th>
            <td>0</td>
            <th></th>
            <td>B+</td>
        </tr>
        <tr></tr>
        <tr class="border">
            <td>SGPA:</td>
            <td>9.00</td>
            <td></td>
            <th></th>
            <td>CGPA:</td>
            <th></th>
            <td>8.45</td>
        </tr>
    </table>
    <div class="sign">
        <img src="images/sign.PNG" alt="sign" width="200" height="70">
        <p>Registrar</p>
    </div>
    <div class="btn">
    <button onclick="window.print()">Print this page</button>
</div>
<%
}else{
	session.setAttribute("message","Plz Fill all details!");
	response.sendRedirect("ViewResult.jsp");
}
%>
</body>

</html>