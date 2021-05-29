<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/index.css">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css">
<title>Insert title here</title>
</head>
<body>

	<section id="nav-bar"> 
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="index.jsp"><img src="images/logo.png"></a>
             <div id="search_box" class="search_box">
             <form action="index.jsp">
              <input type="search" id="searchQues" name="searchQues" placeholder="Search Your Queries....">
              <div id="showList" class="autocom-box">
              </div>
              <span class="fa fa-search"></span>
              </form>
            </div>
            <button class="navbar-toggler"v type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                  </li>
                  <li class="nav-item">
                    <!--<a class="nav-link" href="#testimonials">Registration and Login</a>-->
                    <div class="nav-link">
                    
                    <%
	HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
	if(studentDetails!=null){
%>  
						 
                        <button class="dropbtn">Welcome <%=studentDetails.get("name") %>
                          <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                          <a href="StudentHome.jsp">Profile</a>
                          <a href="Logout">Logout</a>
                        </div>
                        <%}else{
                        	%>
                        	<button class="dropbtn">Registration and Login
                          <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                          <a href="StudentRegister.jsp">Registration for Student</a>
                          <a href="StudentLogin.jsp">Login for Student</a>
                          <a href="teacherlogin.html">Login for Teacher</a>
                        </div>
                       
                        	<%
                        } %>  
                    </div>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="result.html">Result</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#about">About Us</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#contact">Contact Us</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="FAQ.html">FAQ</a>
                </ul>
            </div>
        </nav>
    </section>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script type="text/javascript">
    const searchWrapper=document.querySelector(".search_box");
        $(document).ready(function () {
            $('#searchQues').keyup(function () {
            	$('.autocom-box').find('li').remove();
                let search = $('#searchQues').val();
                if (search !== '' && search !== null) {
                    $.ajax({
                    	url: "SearchQuestions",
                        type: "GET",
                        data: { searchQues: search },
                        success: function (data, textStatus, jqXHR) {
							if(data!=='[]'){
								
								let obj = $.parseJSON(data);
	                            $.each(obj, function (key, value) {
	                                $('#showList').append('<a href="ViewAnswer.jsp?quesId='+value.qid+'"><li class="list-group-item">' + value.question + '</li></a>')
	                            });
	                            searchWrapper.classList.add("active");
							}else{
								$('.autocom-box').find('li').remove();
								$('#showList').append('<li class="list-group-item">No Result</li>')
							}
                            
                            
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#showList').append('<li class="list-group-item">No Result</li>');
                        },
                        cache: false
                    });
                } else {
                    $('#showlist').append('<li class="list-group-item">No Result</li>');
                }

            });
            $(document).on('click', 'li', function () {
            	if($(this).text().localeCompare("No Result")!==0){
            		$('#searchQues').val($(this).text());
                    searchWrapper.classList.remove("active");
            	}
                
            });
        });
        document.addEventListener("click", (evt) => {
            const flyoutElement = document.getElementById("search_box");
            let targetElement = evt.target; 

            do {
                if (targetElement != flyoutElement) {
                    searchWrapper.classList.remove("active");
                    return;
                }
                targetElement = targetElement.parentNode;
            } while (targetElement);
        });
    </script>
</body>
</html>