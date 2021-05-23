<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.tiny.cloud/1/tblirgs9iclfy2vhfk5h2xvxqnkm882tp2vsoz9nij4c3wqn/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    
<style>
    /*import google fonts*/
    @import url('https://fonts.googleapis.com/css2?family=Baloo+Bhaina+2&display=swap');
    
    body {
        font-family: 'Baloo Bhaina 2', cursive;
        background-color: #333;
        display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 5%;
    }

    .box {
        
        width: 80vw;
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
        font-size: 30px;
    }

    .faqs {
        padding: 0px 20px 20px;
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
    }
    
    .time{
        font-size: 14px;
    }

    .details summary {
        outline: none;
        display: contents;
    }
    .pborder{
        border-left: 6px solid red;
        background-color: lightgrey;
        padding-left: 4px;
        border-bottom-style: solid red;
    }

    
    button {
        height: 5vh;
        margin: 5px 0
    }
    .btn-danger{
        margin-bottom: 3px;
        margin-top:3px;
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
    
    .cont {
    margin-top: 5%;
}

    form .button input:hover {
        /* transform: scale(0.99); */
        background: linear-gradient(-135deg, #71b7e6, #9b59b6);
    }
    .tox.tox-tinymce {
        border-radius: 7px;
    }
</style>
</head>
<body>
<jsp:include page="NavBar.jsp" />
<%
		String m=(String)session.getAttribute("message");
		if(m!=null){
	%>
			<p style="background-color: yellow;width:max-content;"><%=m %></p>
	<%		
			session.setAttribute("message",null);
		}
	%>
<% 
	int quesId=Integer.parseInt(request.getParameter("quesId"));
	DAO dao=new DAO();
	
	ArrayList<HashMap> answers=dao.getAnswer(quesId);
	String question=dao.getQuestionById(quesId);
	try{
	%>
	<%
	HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
	
%>
<div class="cont">
        <div class="box">
            <p class="heading">GBUVerse | QnA's</p>
            <div class="faqs">
                <div class="details">
                    <summary style="font-weight:bold;"><a href="#"><%=question %></a></summary>
                    <summary><div class="time" style="font-weight:bold;">asked by <a href="#">Rohan</a> on May 6 at 6:00pm</div></summary>
                   <% if(studentDetails!=null){
		String studentId=(String)studentDetails.get("roll");
		if(dao.checkAnswer(quesId, studentId)){
%>
                    <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                        Answer
                      </a>
                    </p>
                    <div class="collapse" id="collapseExample">
                      <div class="card card-body">
                                <form action="AddAnswer">
                                    <input type="hidden" name="qid" value="<%=quesId %>" />
                                    <textarea name="answer" width="80px"> </textarea>
                                    <button type="submit" class="btn btn-danger">Submit</button>
                                </form>
                            </div>
                    </div>
                    <%} %>
	<%} 
	if(answers.size()!=0 ){
	for(HashMap answer:answers){
%>
                    <p class="text"><summary><div class="time">answered by <a href="#"><%=answer.get("studentId") %></a> on May 7 at 12:34pm</div></summary></p>
                    <p class="pborder"><%=answer.get("answers") %></p>
                    <%
	}
	}else{
		%>
			<p>No data Found..</p>
		<%
	}%>
                </div>
            </div>
        </div>
    </div>

<script>
    tinymce.init({
      selector: 'textarea',
      plugins: 'a11ychecker advcode casechange formatpainter linkchecker autolink lists checklist media mediaembed pageembed permanentpen powerpaste table advtable tinycomments tinymcespellchecker',
      toolbar: 'a11ycheck addcomment showcomments casechange checklist code formatpainter pageembed permanentpen table',
      toolbar_mode: 'floating',
      tinycomments_mode: 'embedded',
      tinycomments_author: 'Author name'
    });
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

  
</body>
<%

	}catch(Exception e){
		e.printStackTrace();
		%>
		<p>exception occured</p>
		<%
	}
%>
</html>