<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/studentregistration.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student Register</title>
</head>

<body>
	<jsp:include page="NavBar.jsp" />
	<%
	String m = (String) session.getAttribute("message");
	if (m != null) {
	%>
	<p style="background-color: yellow; width: max-content;"><%=m%></p>
	<%
	session.setAttribute("message", null);
	}
	%>
	<div class="mid-sec">
	<div class="content-class">
		<div class="container2">
			<div class="title">Registration</div>
			<div class="content">
				<form action="StudentRegister" method="post" enctype="multipart/form-data">
					<div class="user-details">
						<div class="input-box">
							<span class="details">Full Name:</span> <input type="text"
								name="name" placeholder="Enter your name" required>
						</div>
						<div class="input-box">
							<span class="details">Email:</span> <input type="email" name="email"
								placeholder="Enter your email" required>
						</div>
						<div class="input-box">
							<span class="details">Password:</span> <input type="password" name="password"
								placeholder="Enter your password" required>
						</div>
						<div class="input-box">
							<span class="details">Confirm Password:</span> <input
								type="password" name="cnfpassword" placeholder="Confirm your password" required>
						</div>
						<div class="input-box">
							<span class="details">Gender:</span>
							<div class="gender-box">
								<input type="radio" name="gender" value="Male" name="gender" checked>
								Male <input type="radio" name="gender" value="Female" name="gender">
								Female <input type="radio" name="gender" value="Other" name="gender">
								Other
							</div>
						</div>
						<div class="input-box">
							<span class="details">Phone No.</span> <input type="text" name="phone" maxlength="10"
								placeholder="Enter your Phone No." required>
						</div>
						<div class="input-box">
							<span class="details">Roll Number:</span> <input type="text" name="roll"
								placeholder="Enter your roll number" required>
						</div>
						<div class="input-box">
							<span class="details">School:</span> <input type="text" name="school"
								placeholder="Enter your School" required>
						</div>
						<div class="input-box">
							<span class="details">Branch:</span> <input type="text" name="branch"
								placeholder="Enter your Branch" required>
						</div>
						<div class="photo-box">
							<span class="details">Student ID Card:</span> <input type="file" name="id"
								class="custom-files-input" required>
						</div>
						<div class="photo-box">
							<span class="details">Student Photograph:</span> <input
								type="file" name="photo" class="custom-files-input" required>
						</div>
						<br>
						<div class="button">
							<input type="submit" value="Register">
						</div>
				</form>
			</div>
		</div>
	</div>
	</div>

<jsp:include page="Footer.jsp" />

</body>
</html>