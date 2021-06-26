package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import javaFiles.AES;


/**
 * Servlet implementation class StudentLogin
 */
@WebServlet("/TeacherLogin")
public class TeacherLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		try {
			HttpSession session=request.getSession();
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			
			DAO dao=new DAO();
			HashMap teacher=dao.getTeacher(email, password);
			if(teacher!=null) {
				
				session.setAttribute("teacherDetails", teacher);
				response.sendRedirect("TeacherHome");
			}else {
				
				session.setAttribute("message", "ID/Password wrong!");
				response.sendRedirect("LoginTeacher");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
