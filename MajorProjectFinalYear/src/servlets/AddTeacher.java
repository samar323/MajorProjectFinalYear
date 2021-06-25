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


@WebServlet("/AddTeacher")
public class AddTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	try {
		HttpSession session=request.getSession();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		DAO dao=new DAO();
		HashMap teacher=new HashMap();
		teacher.put("name", name);
		teacher.put("email", email);
		teacher.put("phone", phone);
		if(dao.checkTeacher(name, email)) {
		boolean result=dao.insertTeacher(teacher);
		if(result==true) {
			
			session.setAttribute("message","Teacher Added Successfully!");
			response.sendRedirect("AddTeacher.jsp");
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
