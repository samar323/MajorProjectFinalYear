 <%@page import="javaFiles.SuffixSem"%>
<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" href="css/addresult.css">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add Result</title>
    </head>
    <body>
    <jsp:include page="AdminNavBar.jsp" /> 
    
    <section id="mid">
    <div class="mid-container">
    <div class="title">Add Results</div>
    <div class="content">
      <form action="AddResult" method="post">
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
            <select id="semester" name="semester" class="options"  required>
                            <option disabled selected>Select Semester</option>
                        </select>
          </div>
          <div class="input-box">
            <span class="details">Roll No.</span>
            <input type="text" name="roll" placeholder="Enter the Rooll No." required>
          </div>
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
  <p class="all">Recent Results</p>
  <a href="AllResults.jsp"><button class="btn btn-primary" type="submit">All Results</button></a>
  
  </div>
<div class="container-scroll">
  <table>
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
    <tr>
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
   </section>
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
                
                $('#semester').change(function () {
                    $('#subjectName').find('input').remove();
                    $('#subjectName').find('span').remove();
                    $('#subjectName').find('br').remove();

                    let id = $('#branch').val();
                    let sem= $('#semester').val();
                    let data = {
                        sid: id ,
                        semester: sem
                    };

                    $.ajax({
                        url: "GetSubjectCombination",
                        method: "GET",
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            let obj = $.parseJSON(data);
                            $.each(obj, function (key, value) {
                                $('#subjectName').append('<span class="details">' + value.subjectName +'('+value.subjectCode+ ')</span> <input type="number" name="marks" placeholder="Enter the Marks" required><input type="hidden" name="subjectId" value="'+value.id+'">')
                            });
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
  