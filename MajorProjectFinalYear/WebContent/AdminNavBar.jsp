<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
<style type="text/css">
#nav-bar {
            position: sticky;
    top: 0;
    z-index: 10;
    width: 100vw;
        }

        .navbar-brand img {
            height: 40px;
            width: 40px;
        }
        ::-webkit-scrollbar{
	width:7px;
}

::-webkit-scrollbar-thumb{
	background: #b8b0b0;
	border-radius:20px;
}

        .navbar-nav li {
            padding: 0 10px;
        }

        .navbar-nav li {
            float: right;
            text-align: left;
        }

        #nav-bar ul li a:hover {
            color: #007bff !important;
        }

        .navbar {
            background: rgb(255, 255, 255);
        }

        .navbar-toggler {
            border: none !important;
        }

        .nav-link {
            color: rgb(0, 0, 0) !important;
            font-weight: 600;
            font-size: 16px;
            font-family: sans-serif;
        }
</style>
</head>
<body>
<section id="nav-bar">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="AdminHome"><img src="images/logo.png"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="AdminHome?status=pending">Home</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="AddTeacher.jsp">Add Teacher</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Branch">Branch</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Subject">Subject</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="SubjectCombo">Subject Combination</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ResultAdd">Add Result</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AddFaq.jsp">Add FAQ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Feedback.jsp">Feedback</a>
                    </li>

                </ul>
            </div>
        </nav>
    </section>
</body>
</html>