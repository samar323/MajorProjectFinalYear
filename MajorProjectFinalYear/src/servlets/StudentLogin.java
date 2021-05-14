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
import javaFiles.AES;


/**
 * Servlet implementation class StudentLogin
 */
@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			AES aes=new AES();
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String encryptPassword=aes.encrypt(password);
			HttpSession session=request.getSession();
			DAO dao=new DAO();
			
			HashMap student=dao.getStudent(email,encryptPassword);
			
			if(student!=null)
			{
				
				session.setAttribute("studentDetails", student);
				response.sendRedirect("StudentHome.jsp");
			}
			else {

				session.setAttribute("message", "incorrect email or password");
				response.sendRedirect("StudentLogin.jsp");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
