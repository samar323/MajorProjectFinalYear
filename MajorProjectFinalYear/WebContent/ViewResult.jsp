<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/viewresult.css">
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Result</title>
</head>
<body>

<jsp:include page="NavBar.jsp" /> 
<section id="mid">
    <div class="mid-container">
    <div class="title">View Result</div>
    <div class="content">
      <form action="Marksheet.jsp" method="post">
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
            <input type="text" name="roll" placeholder="Enter the Roll No." required>
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

            });
        </script>
</body>
</html>