<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
	if(studentDetails!=null){
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Classes</title>
<style type="text/css">

        
.containerpop{
    position: relative;
    width: 500px;
    height: 350px;
    background-color: #fff;
    margin: 150px;
    padding: 25px 30px;
    border-radius: 5px;
    box-shadow: 0 5px 10px rgba(0,0,0,0.15);
  }
  .containerpop .titlepop{
    font-size: 25px;
    font-weight: 500;
    position: relative;
  }
  .containerpop .titlepop::before{
    position: absolute;
    left: 0;
    bottom: 0;
    height: 3px;
    width: 30px;
    border-radius: 5px;
    background: linear-gradient(135deg, #71b7e6, #9b59b6);
  }
  .contentpop form .user-detailspop{
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 20px 0 5px 0;
  }
  form .user-detailspop .input-boxpop{
    margin-bottom: 15px;
    width: 100%
  }
  form .incorrect{
    margin-top: 10px;
    color: red;
    display: flex;
    justify-content: center;
  }
  
  form .input-boxpop span.details{
    display: block;
    font-weight: 500;
    margin-bottom: 5px;
  }
  #options{
    height: 45px;
    width: 100%;
    outline: none;
    font-size: 16px;
    border-radius: 5px;
    padding-left: 15px;
    border: 1px solid #ccc;
    border-bottom-width: 2px;
    transition: all 0.3s ease;
  }
  
  .user-detailspop .input-boxpop input{
    height: 45px;
    width: 100%;
    outline: none;
    font-size: 16px;
    border-radius: 5px;
    padding-left: 15px;
    border: 1px solid #ccc;
    border-bottom-width: 2px;
    transition: all 0.3s ease;
  }
  .user-detailspop .input-boxpop input:focus,
  .user-detailspop .input-boxpop input:valid{
    border-color: #9b59b6;
  }
  form .user-detailspop .select{
      margin-bottom: 0px;
      padding: 20px;
      padding-right: 150px;
      padding-left: 65px;
      padding-bottom: 0px;
      font-size: medium;
      text-align: justify; 
   }
    form .select span .details {
      display: block;
      font-weight: 500;
    }
   form .button{
     height: 45px;   
     margin: 30px 0;   
   }
   form .button input{
     height: 100%;
     width: 100%;
     padding-left: 100px;
     padding-right: 100px;
     display: flex;
     justify-content: center;
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
   form .button input:hover{
    /* transform: scale(0.99); */
    background: linear-gradient(-135deg, #71b7e6, #9b59b6);
    }
   @media(max-width: 584px){
   .containerpop{
    width: 100%;
  }
  form .user-detailspop .input-boxpop{
      margin-bottom: 15px;
      width: 100%;
    }
  
    .contentpop form .user-detailspop{
      max-height: 300px;
      overflow-y: scroll;
    }
    .user-detailspop::-webkit-scrollbar{
      width: 5px;
    }
    }
    @media(max-width: 459px){
    .containerpop .contentpop .category{
      flex-direction: column;
    }
  }


  .bg-modal{
      width: 100%;
      height: 100%;
      background: #0d0d0e8a;
      position: absolute;
      top: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      display: none;
      z-index:5;
  }
  .containerpop .close{
      position: absolute;
      top: 0;
      right: 14px;
      font-size: 42px;
      transform: rotate(45deg);
          cursor: pointer;
  }
    *{
            margin:0;
            padding:0;
        }
        body {
            color: rgba(0,0,0,0.87);
            font-family: 'Roboto',Helvetica,Arial,sans-serif;
            font-size: 0.8125rem;
            font-weight: 400;
            line-height: 1.25rem;
            margin: 0;
            min-width: 18.75rem;
        }
        .up {
            position: relative;
            width: 100%;
            height: 6.2rem;
        }
        ol li {
            list-style: none;
        }
        .image {
            /* width: 1059px; */
            /* height: 250px; */
            background-repeat: no-repeat;
            -webkit-background-size: cover;
            background-size: cover;
            height: 100%;
            left: 0;
            position: absolute;
            top: 0;
            width: 100%;
        }
        li.card {
            width: 18.75rem;
            height: 18rem;
            border: 0.0625rem solid #dadce0;
            border-radius: 0.35rem;
            margin-right: 2rem;
            margin-bottom: 2rem;
            cursor:pointer;
        }
        li.card:hover{
            box-shadow:0 0 10px 0 rgb(202, 199, 199);
            transition:.3s ease;
        }
        ul.inner-box {
            display: flex;
            flex-wrap: wrap;
        }
        ol.box {
            display: flex;
            padding-left: 1.5rem;
            padding-top: 1.5rem;
        }
        .content {
            display: flex;
            -webkit-flex-direction: column;
            flex-direction: column;
            justify-content: space-between;
            height: 4.5rem;
            padding: 1rem 1rem 0.75rem;
        }
        h1, h2, h3, h4, h5, h6 {
            font-size: inherit;
            font-weight: inherit;
            margin: 0;
        }
        .class-link {
            font-family: 'Google Sans',Roboto,Arial,sans-serif;
            font-size: 1.375rem;
            font-weight: 400;
            line-height: 1.75rem;
            color: #fff;
        }
        .subject, .name {
            color: #ffffff;
        }
        .mid {
            -webkit-box-flex: 1;
            box-flex: 1;
            -webkit-flex-grow: 1;
            flex-grow: 1;
            min-height: 0;
            height: 7rem;
            padding: 1rem;
            padding-top: 0.75rem;
        }
        img.user-pic {
            border-radius: 50%;
            float: right;
            height: 4.6875rem;
            position: relative;
            margin-top: -3.09375rem;
            width: 4.6875rem;
        }
        .down {
            border-top: 0.0625rem solid #e0e0e0;
            line-height: 0;
            padding: 0.25rem;
            display: flex;
            -webkit-flex-shrink: 0;
            flex-shrink: 0;
            -webkit-justify-content: flex-end;
            justify-content: flex-end;
            height: 3rem;
        }
        .delete {
            display: flex;
        }
        a.delete-btn, span {
            display: flex;
        }
       .mid img {
    width: 75px;
    height: 75px;
    display: flex;
}
        a.click-btn {
            height: 100%;
            left: 0;
            position: absolute;
            top: 0;
            width: 100%;
            z-index:2;
        }
  h2.text, .name-div {
  font-family: 'Roboto',Helvetica,Arial,sans-serif;
            font-size: 0.8125rem;
            font-weight: 400;
            line-height: 1.25rem;
            margin: 0;
    z-index: 0;
}
.footer-bottom p {
    display: flex;
    justify-content: center;
}
.first {
    padding: 1rem;
}
    </style>
</head>
<body>
<jsp:include page="NavBar.jsp" /> 

<header>
        <div class="first">
            <h1 style="text-align: center;">Student Portal</h1>
            <h3 style="text-align: right;"><a href="#" id="button"><button type="button" class="btn btn-primary">Join Class <i class="fa fa-sign-in" aria-hidden="true"></i></button></a> </h3>
                        
        </div>
    </header>
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
String studentId=(String)studentDetails.get("roll");
DAO dao=new DAO();
ArrayList<HashMap> classDetails=dao.getStudentClass(studentId);


if(classDetails.size()!=0){

%>
	<div class="container-box">
        <ol class="box">
            <ul class="inner-box">
            <%
            for(HashMap classDetail:classDetails){
            	String tEmail=(String)classDetail.get("email");
            	String type="teacher";
            	byte [] photo=dao.getPhoto(tEmail,type);
%>
                <li class="card">
                    <div class="up">
                        <div class="image" style="background: url('images/img_graduation.jpg');background-repeat: no-repeat;-webkit-background-size: cover;background-size: cover;border-top-left-radius: .25rem;border-top-right-radius: .25rem;"></div>
                        <div class="content">
                            <a href="ViewAssignment.jsp?aid=<%=classDetail.get("aid") %>"  class="click-btn"></a>
                            <h2 class="text">
                            <a class="text-link">
                                <div class="class-link"><%=classDetail.get("class_name") %></div>
                                <div class="subject"><%=classDetail.get("subject") %></div>
                                
                            </a>
                        </h2>
                        <div class="name-div">
                            <div class="name"><%=classDetail.get("name") %></div>
                        </div>
                        </div>
                    </div>
                   
                    <div class="mid">
                    
                    <%
			if(photo!=null){
			%>
			 <img src='GetPhoto?email=<%=tEmail %>&type=teacher' class="user-pic" width="100px">
		<%
			}else{
				%>
				<img src='images/photo.jpg' class="user-pic" />
				<%
			}
		%>
                   
                    </div>
                    <div class="down">
                        <div class="delete">
                            <a href="DeleteStudentClass?id=<%=classDetail.get("classCode") %>" class="delete-btn">
                                <span>
                                <img src="images/delete.svg">
                            </span>
                            </a>
                        </div>
                    </div>
                </li>
                <%
}%>
            </ul>
        </ol>
    </div>
<%
}%>	
	
	
    <section>
    <div class="bg-modal">
        <div class="containerpop">
            <div class="close">+</div>
            <div class="titlepop">Create Class</div>
                <div class="contentpop">
                    <form action="JoinClass" method="post">
                        <div class="user-detailspop">
                            <div class="input-boxpop">
                                <span class="detailspop">Ask your teacher for the class code, then enter it here.</span>
                                <input type="text" name="classCode" placeholder="Class Code" required>
                            </div>
                            
                            <div class="button">
                                <input type="submit" value="Join">
                            </div>
                    </form>
                </div>
        </div>
    </div>
</section>
<jsp:include page="Footer.jsp" /> 
    <script>
        document.getElementById('button').addEventListener('click',function(){
            document.querySelector('.bg-modal').style.display='flex';
        });
        document.querySelector('.close').addEventListener('click',function(){
            document.querySelector('.bg-modal').style.display='none';
        });
    </script>
</body>
</html>
<%
	}else{
		session.setAttribute("message","Plz LOGIN First!");
		response.sendRedirect("StudentLogin.jsp");
	}
%>