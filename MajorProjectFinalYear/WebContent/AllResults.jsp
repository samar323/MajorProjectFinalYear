<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javaFiles.SuffixSem"%>
<%@page import="dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
	if(adminDetails!=null){
		
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/allresults.css">
<title>All Result</title>
</head>
<body>
<jsp:include page="AdminNavBar.jsp" /> 
<div class="wrapper">
        <header>
            <h1>Search the Found Result</h1>
        </header>
        <section class="columns">
            <div class="user-details"></div>
            <div class="column">
                <div class="input-box">
                    <span for="school" class="details">School Name</span>
                    <select id="school" name="school" class="options" required>
                            <option disabled selected>Select School</option>
                 </select>
                </div>
            </div>
            <div class="column">
                <div class="input-box">
                    <span for="branch" class="details">Branch</span>
                    <select id="branch" name="branch" class="options" required>
                            <option disabled selected>Select Branch</option>
                        </select>
                </div>
            </div>
            <div class="column">
                <div class="input-box">
                    <span for="semester" class="details">Semester</span>
                    <select id="semester" name="semester" class="options"  required>
                            <option disabled selected>Select Semester</option>
                        </select>
                </div>
            </div>

        </section>
        <form>
        <div class="user-details">
            <div class="button">
                <input type="submit" value="Submit">
            </div>
        </div>
    </form>
    <h2  class="all">Recent Results</h2>

<table id="view-result">
  <tr>
    <th>School</th>
    <th>Branch</th>
    <th>Semester</th>
    <th>Roll No.</th>
    <th>Action</th>    
  </tr>
  <%
    DAO dao=new DAO();
    SuffixSem suf=new SuffixSem();
    ArrayList<HashMap> allResults=dao.getResult();
    if(allResults!=null){
    for(HashMap result:allResults){
    %>
    <tr class="content">
      <td><%=result.get("school") %></td>
      <td><%=result.get("branchName") %></td>
      <td><%=result.get("semester") %><%=suf.suffix((int)result.get("semester")) %></td>
      <td><%=result.get("studentId") %></td>
      <td><form action="DeleteResult" method="post">
      <input type="hidden" name="studentId" value="<%=result.get("studentId") %>"/>
      <input type="hidden" name="classId" value="<%=result.get("classId") %>"/>
      <button class="btn btn-danger" type="submit">Delete</button>
      </form></td>
    </tr>
    <%} 
    }%>
</table>

    
    </div>
     <jsp:include page="Footer.jsp" /> 
     
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $.ajax({
                    url: "GetSchoolBranchSubject",
                    method: "GET",
                    data: {operation: 'school'},
                    success: function (data, textStatus, jqXHR) {
                    	
                        console.log(data);
                        let obj = $.parseJSON(data);
                        $.each(obj, function (key, value) {
                            $('#school').append('<option value="' + value.name + '">' + value.name + '</option>')
                        });
                        $('select').formSelect();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#school').append('<option>Country Unavailable</option>');
                    },
                    cache: false
                });


                $('#school').change(function () {
                    $('#branch').find('option').remove();
                    $('#branch').append('<option disabled selected>Select Branch</option>'); 
                    $('#semester').find('option').remove();
                    $('#semester').append('<option disabled selected>Select Semester</option>');
                    $('tbody').find('.content').remove();

                    let schoolName = $('#school').val();
                    let data = {
                        operation: "branch",
                        name: schoolName
                    };

                    $.ajax({
                        url: "GetSchoolBranchSubject",
                        method: "GET",
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                           // console.log(data);
                            let obj = $.parseJSON(data);
                            $.each(obj, function (key, value) {
                                $('#branch').append('<option value="' + value.name + '">'+ value.name + '</option>')
                            });
                            $('select').formSelect();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#branch').append('<option>Branch Unavailable</option>');
                        },
                        cache: false
                    });
                });
                
                $('#branch').change(function () {
                    $('#semester').find('option').remove();
                    $('#semester').append('<option disabled selected>Select Semester</option>');
                    $('tbody').find('.content').remove();

                    let id = $('#branch').val();
                    let data = {
                        operation: "semester",
                        sid: id
                    };

                    $.ajax({
                        url: "GetSchoolBranchSubject",
                        method: "GET",
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                           // console.log(data);
                            let obj = $.parseJSON(data);
                            $.each(obj, function (key, value) {
                                $('#semester').append('<option value="' + value.semester + '"> Semester' + value.semester + '</option>')
                            });
                            $('select').formSelect();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#semester').append('<option>Semsester Unavailable</option>');
                        },
                        cache: false
                    });
                });
            

                $('#semester').change(function () {
                	$('tbody').find('.content').remove();
                    let schoolName = $('#school').val();
                    let id = $('#branch').val();
                    let sem= $('#semester').val();
                    let data = {
                    	school:schoolName,
                        sid: id ,
                        semester: sem
                    };

                    $.ajax({
                        url: "ShowResult",
                        method: "GET",
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                           // console.log(data);
                            let obj = $.parseJSON(data);
                            $.each(obj, function (key, value) {
                                $('#view-result').find('tbody').append('<tr class="content"><td>'+value.school+'</td><td>'+value.branch+'</td><td>'+value.semester+'</td><td>'+value.studentId+'</td><td><form action="DeleteResult" method="post"><input type="hidden" name="studentId" value="'+value.studentId+'"/><input type="hidden" name="classId" value="'+value.classId+'"/><button class="btn btn-danger" type="submit">Delete</button></form></td></tr>')
                            });
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#subjectName').append('<option>Subject Unavailable</option>');
                        },
                        cache: false
                    });
                });
                
            });
        </script>
</body>
</html>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("AdminLogin.jsp");
	}
%>