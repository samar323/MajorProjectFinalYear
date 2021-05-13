<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Change Password</h1>
<form action="ForgotPassword" method="post">
<input type="hidden" name="operation" value="newPass"/>
New Password: <input type="password" name="password" placeholder="Enter new password"/><br>
Confirm Password: <input type="password" name="cnfpassword" placeholder="Enter new password"/><br>
<button type="submit">Submit</button>
</form>
</body>
</html>