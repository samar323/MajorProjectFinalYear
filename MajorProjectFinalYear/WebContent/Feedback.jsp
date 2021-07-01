<%@page import="javaFiles.TimeConversion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.HashMap"%>
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

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Feedback Messages</title>
<style type="text/css">
      *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      body{
        background: linear-gradient(
-135deg
, #e2a5de, #a7b3e7);
        font-family: sans-serif;
      }
      .table-container{
          padding: 0 10%;
          margin: 40px auto 0;
          min-height: 60vh;
      }
      td img{
        height: 25px;
    width: 25px;
        border-radius: 50%;
      }
      .heading{
        background-color: black;
        border-radius: 7px 7px 0px 0px;
        padding: 10px;
        color: #fff;
        text-align: center;
        font-size: 25px;
      }
      
      @media (min-width: 768px){
        .table{
          width: 100%;
          border-collapse: collapse;
          border: 1px solid #15ccec;
        }
      }
      .table thead{
        background: linear-gradient(-135deg, #c850c0, #4158d0);
        border: 1px solid #15ccec;
      }   
      .table thead tr th{
        font-size: 14px;
        font-weight: medium;
        letter-spacing: 0.35px;
        color: #ffffff;
        border: 1px solid #15ccec;
      }
      .table tbody tr td .btn{
        text-decoration: none;
        display: inline-block;
        background-color: #ff1046;
        font-weight: medium;
        color: #ffffff;
        text-align: center;
        vertical-align: middle;
        user-select: none;
        border: 1px solid transparent;
        font-size: 14px;
        opacity: 1;
        
      }
      @media (max-width: 768px){
        .table thead{
          display: none;
          
          
        }
        .table, .table tbody, .table tr, .table td{
          display: block;
          width: 100%;
          background: linear-gradient(-135deg, #f08fe9, #929ed1);
          
        }
        .table tr{
          margin-bottom: 15px;
        }
        .table tbody tr td{
          text-align: right;
          padding-left:50%;
          position:relative;
          border: 2px solid #15ccec;
          
        }
        .table td:before{
          content: attr(data-label);
          position: absolute;
          left: 0;
          width: 50%;
          padding-left: 15px;
          font-weight: 600;
          font-size: 14px;
          text-align: left;

        }
      }
  </style>
</head>
<body>
<jsp:include page="AdminNavBar.jsp" /> 
<div class="table-container">
    <h1 class="heading">Feedback</h1>
    <%
    DAO dao=new DAO();
    ArrayList<HashMap> messages=dao.getAllMessages();
    TimeConversion tc=new TimeConversion();
    if(messages.size()!=0){
    %>
  <%
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
  <table class="table">
    <thead>
      <tr>
        <th>Photo</th>
        <th>Name</th>
        <th>Email</th>
        <th>Message</th>
        <th>Time</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
    <%
    for(HashMap message:messages){
    	 String time=message.get("time").toString();
 		String date = message.get("date").toString();
 		String timeShow=tc.getTime(time, date);
    %>
      <tr>
        <td data-label="Photo"><img src="images/user.jpg"></th>
        <td data-label="Name"><%=message.get("name") %></td>
        <td data-label="Email"><%=message.get("email") %></td>
        <td data-label="Message"><%=message.get("message") %></td>
        <td data-label="Time"><%=timeShow %></td>
        <td data-label="Action"><a href="DeleteMessage?mid=<%=message.get("mid") %>" class="btn">delete</a></td>

      </tr>
      <%} %>
    </tbody>
  </table>
  <%} %>
</div>
<jsp:include page="Footer.jsp" /> 
</body>
</html>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("AdminLogin.jsp");
	}
%>