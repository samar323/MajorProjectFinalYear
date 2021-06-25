package servlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import javaFiles.SendMail;


@WebServlet("/AddTeacher")
public class AddTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	try {
		HttpSession session=request.getSession();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String phone=request.getParameter("phone");
		DAO dao=new DAO();
		HashMap teacher=new HashMap();
		teacher.put("name", name);
		teacher.put("email", email);
		teacher.put("password", password);
		teacher.put("phone", phone);
		if(dao.checkTeacher(name, email)) {
		boolean result=dao.insertTeacher(teacher);
		if(result==true) {
			SendMail sendMail=new SendMail();
			String Sub = "Your Login & Paasword | GBUVerse";
			String Body = "Email-ID: "+email+" and Password: "+password+"<br>You can <a href='http://34.93.210.185:8080/MajorProjectFinalYear/TeacherLogin.jsp'>Login<a> to your account";
			boolean mailStatus=sendMail.emailSend(email,Sub,Body);
			if(mailStatus==true) {
				session.setAttribute("message","Teacher Added Successfully");
				response.sendRedirect("AddTeacher.jsp");
			}else {
				session.setAttribute("message","Teacher Added Successfully But Mail Not sent!");
				response.sendRedirect("AddTeacher.jsp");
			}
			
			
		}else {
			
			session.setAttribute("message","Teachher Already Added!");
			response.sendRedirect("AddTeacher.jsp");
		}
		
		}else {
			
			session.setAttribute("message","Teachher Already Added!");
			response.sendRedirect("AddTeacher.jsp");
		}
	}catch(Exception ex) {
		ex.printStackTrace();
		response.sendRedirect("ExceptionPage.jsp");
	}
		
	}

}
