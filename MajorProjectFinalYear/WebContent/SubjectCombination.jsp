 <%@page import="dao.DAO"%>
<%@page import="java.util.HashMap"%>
<%
	HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
	if(adminDetails!=null){
%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Subject Combination</title>
         <link rel="stylesheet" href="css/addresult.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <style type="text/css">
            body{
                background: url(image/roenkae.jpg);
                background-size: cover;
            }
            .drop-down-list{
                margin: 150px auto;
                width: 50%;
                padding: 30px;
            }
        </style>
    </head>
    <body class="cyan">
    <jsp:include page="AdminNavBar.jsp" />
    
    <section id="mid">
    <div class="mid-container">
    <div class="title">Add Results</div>
    <div class="content">
      <form action="SubjectCombination" method="post">
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
            <span for="school" class="details">School Name</span>
            <select id="school" name="school" class="options" required>
                            <option disabled selected>Select School</option>
                 </select>
          </div>
          <div class="input-box">
            <span for="branch" class="details">Branch</span>
             <select id="branch" name="branch" class="options" required>
                            <option disabled selected>Select Branch</option>
                        </select>
          </div>
          <div class="input-box">
            <span for="semester" class="details">Semester</span>
            <select id="semester" name="semester" class="options" required>
                            <option disabled selected>Select Semester</option>
                        </select>
          </div>
          <div class="input-box">
           <span for="semester" class="details">Subject</span>
            <select id="subject" name="subject" class="options"  multiple required>
                            <option disabled selected>Select Subject</option>
                        </select></div>
                        
          <div class="input-box">
          <div id="subjectName">
            </div>
          </div>
          <div class="button">
            <input type="submit" value="Submit">
          </div>

      </form>
    </div>
  </div>
  <div class="banner">
  <p class="all">Recent Subject Combination</p>
  
  </div>
<div class="container-scroll">
  <table>
    <tr>
      <th>School</th>
      <th>Branch</th>
      <th>Semester</th>
      <th>Subjects</th>
      <th>Action</th>
    </tr>
    <%
    DAO dao=new DAO();
   
    %>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td><form action="DeleteResult" method="post">
      <input type="hidden" name="studentId" value=""/>
      <input type="hidden" name="classId" value=""/>
      <button class="btn btn-danger" type="submit">Delete</button>
      </form></td>
    </tr>
  </table>
  </div>
   </section>
	   <jsp:include page="Footer.jsp" /> 
    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
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
                            console.log(data);
                            let obj = $.parseJSON(data);
                            $.each(obj, function (key, value) {
                                $('#branch').append('<option value="' + value.name + '">' + value.name + '</option>')
                            });
                            $('select').formSelect();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#state').append('<option>State Unavailable</option>');
                        },
                        cache: false
                    });
                });
                
                $.ajax({
                    url: "GetSchoolBranchSubject",
                    method: "GET",
                    data: {operation: 'subject'},
                    success: function (data, textStatus, jqXHR) {
                    	
                        console.log(data);
                        let obj = $.parseJSON(data);
                        $.each(obj, function (key, value) {
                            $('#subject').append('<option value="' + value.id + '">' + value.subjectName+' ('+value.subjectCode + ')</option>')
                        });
                        $('select').formSelect();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#school').append('<option>Country Unavailable</option>');
                    },
                    cache: false
                });
                
                $('#branch').change(function () {
                    $('#semester').find('option').remove();
                    $('#semester').append('<option disabled selected>Select Semester</option>');

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
                            console.log(data);
                            let obj = $.parseJSON(data);
                            $.each(obj, function (key, value) {
                                $('#semester').append('<option value="' + value.semester + '"> Semester' + value.semester + '</option>')
                            });
                            $('select').formSelect();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#city').append('<option>City Unavailable</option>');
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
  