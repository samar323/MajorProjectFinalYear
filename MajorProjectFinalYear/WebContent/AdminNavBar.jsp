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
<title>Insert title here</title>
<style type="text/css">
#nav-bar {
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .navbar-brand img {
            height: 40px;
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
            <a class="navbar-brand" href="#"><img src="images/logo.png"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#top">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AddBranch.jsp">Branch</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AddSubject.jsp">Subject</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="SubjectCombination.jsp">Subject Combination</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AddResult.jsp">Add Result</a>
                    </li>

                </ul>
            </div>
        </nav>
    </section>
</body>
</html>