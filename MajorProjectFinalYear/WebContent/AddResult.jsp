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
        <title>Dependent Select Option</title>
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
            label, .input-field>label {
    font-size: 1rem;
    color: #000000;
    font-weight: bold;
}
        </style>
    </head>
    <body class="cyan">
        <div class="container">
            <div class="drop-down-list card">
                <div class="center">
                    <h5>Add Result</h5>
                </div>
                <div class="divider"></div>
                <%
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
                <form action="SubjectCombination">
                    <div class="input-field">
                        <select id="school" name="school" required>
                            <option disabled selected>Select School</option>
                        </select>
                    </div>
                    <div class="input-field">
                        <select id="branch" name="branch" required>
                            <option disabled selected>Select Branch</option>
                        </select>
                    </div>
                    <div class="input-field">
                        <select id="semester" name="semester" required>
                            <option disabled selected>Select Semester</option>
                        </select>
                    </div>
                    <br>
                    <div class="input-field">
                    <label>Roll No.</label>
                    <input type="text" name="roll" placeholder="Enter the Rooll No."/>
                    </div>
                    
                    <div class="input-field">
                    <div id="subjectName">
                    <input type="hidden" name="subjectId" value=""/>
                    <label></label>
                    <input type="hidden" name="roll" placeholder="Enter Marks"/>
                    </div>
                    </div>
                    
                    <div class="center">
                        <button class="btn" type="submit">Submit</button>
                    </div>
                </form>
            </div>
        </div>
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
                                $('#subjectName').append('<label>' + value.subjectName +'('+value.subjectCode+ ')</label> <input type="number" name="marks" required><input type="hidden" name="subjectId" value="'+value.id+'"><br>')
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
  