<%@page import="java.time.LocalTime"%>
<%@page import="javaFiles.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javaFiles.DateConversion"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="css/index.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
    /*import google fonts*/
    @import url('https://fonts.googleapis.com/css2?family=Baloo+Bhaina+2&display=swap');
    
    
    body {
        font-family: 'Baloo Bhaina 2', cursive;
        background-color: #333;
        overflow-x: hidden;
    }

    .box {
        width: 100vw;
        margin:auto;
        background: linear-gradient(-135deg, #e2a5de, #a7b3e7);
        border-radius: 7px;
        box-shadow: 1px 2px 4px rgba(0, 0, 0, .3);
    }

    .box .heading {
        background-color: black;
        border-radius: 7px 7px 0px 0px;
        padding: 10px;
        color: #fff;
        text-align: center;
        font-size: 25px;
    }

    .faqs {
        padding: 0px 20px 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    ::-webkit-details-marker {
        float: right;
        margin-top: 1px;
    }
    .text{
        margin:10px;
    }
    .details {
        background-color: #f6f6f6;
        padding: 10px 20px;
        border-radius: 7px;
        margin-top: 20px;
        font-family: 'Baloo Bhaina 2';
        font-size: 20px;
        letter-spacing: 1px;
        width: 60vw;
    }
    .time{
        font-size: 14px;
    }
    .details summary {
        display: contents;
        outline: none;
    }
    button {
        
    }
    .btnallans{
        color: #fff;
    }
    .pborder{
        border-left: 6px solid red;
        background-color: lightgrey;
        padding-left: 4px;
    }
    
.container {
  width: 100%;
}
    .btn-primary {
        height: 5vh;
        width: 200px;
        border-radius: 5px;
        border: none;
        color: #fff;
        font-size: 18px;
        font-weight: 500;
        letter-spacing: 1px;
        cursor: pointer;
        transition: all 0.3s ease;
        background: linear-gradient(135deg, #71b7e6, #9b59b6);
    }

    form .button input:hover {
        /* transform: scale(0.99); */
        background: linear-gradient(-135deg, #71b7e6, #9b59b6);
    }
    
.banner {
	min-height: 80vh;
    background: url(images/bg1.jpg) center no-repeat;
    background-repeat: no-repeat;
    background-size: cover;
    display: flex;
    flex-direction: column;
    justify-content: stretch;
}
</style>

<body>
<jsp:include page="NavBar.jsp" />  

<div class="banner">
        <div class="post">
          <h1 class="banner-title">
            <span>GBUVerse</span>
          </h1>
          <p>Everything that you want to Ask....</p>
          <form>
            <a class="post-user" href="pofile.html"><i class="fas fa-user"></i></a>
            <input type="text" class="post-input" placeholder="Hey, What's in your mind?">
            <button type="submit" class="post-btn">
              <i class="fas fa-plus"></i>
            </button>
          </form>
        </div>
      </div>

<%
	String searchQues=request.getParameter("searchQues");
	%>

<%		TimeConversion tc=new TimeConversion();
		DAO dao=new DAO();
		ArrayList<HashMap> questions=dao.getQuestion(searchQues);
		try{
		if(searchQues!=null){
		if(questions.size()!=0){
		%>
		<div class="">
        <div class="box">
            <p class="heading">Recent Question and Answers</p>
            
		<%
		for(HashMap question:questions){
			
	%>
	<%
        String time=question.get("time").toString();
		String date = question.get("date").toString();
		String timeShow=tc.getTime(time, date);
		%>
	 <div class="faqs">
                <div class="details">
                    <summary style="font-weight:bold;"><a href="ViewAnswer.jsp?quesId=<%=question.get("quesId") %>"><%=question.get("question") %></a></summary>
                    <summary><div class="time" style="font-weight:bold;">asked by <a href="#"><%=question.get("studentId") %></a> <%=timeShow %></div></summary>
                    
                </div>
            </div>
        
	<%
		}%>
		</div>
	    </div>
	    <%
		}else{
			%>
				<p>No data Found..</p>
			<%
		}
		}
		}catch(Exception e){
			e.printStackTrace();
			%>
			<p>exception occured</p>
			<%
		}
	%>






</body>
</html>