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

/**
 * Servlet implementation class DeleteSubjectCombo
 */
@WebServlet("/DeleteSubjectCombo")
public class DeleteSubjectCombo extends HttpServlet {
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
		if(adminDetails!=null){
		try {
		String classId=request.getParameter("classId");
		if(classId!=null) {
			DAO dao=new DAO();
			boolean status=dao.deleteSubjectCombo(Integer.parseInt(classId));
			if(status==true) {
				session.setAttribute("message","Subject Deleted Successfully!");
				response.sendRedirect("SubjectCombo");
			}else {
				session.setAttribute("message","Subject not Deleted");
				response.sendRedirect("SubjectCombo");
			}
		}else {
			session.setAttribute("message","No subject found!!");
			response.sendRedirect("SubjectCombo");
		}
		}catch(Exception ex){
			ex.printStackTrace();
			session.setAttribute("message","Something went wrong!!");
			response.sendRedirect("SubjectCombo");
		}
		}else {
			session.setAttribute("message","Plz LOGIN First!");
			response.sendRedirect("AdminLogin.jsp");
		}
	}

}
