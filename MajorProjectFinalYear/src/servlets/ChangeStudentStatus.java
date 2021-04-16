package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import dao.DAO;
@MultipartConfig
@WebServlet("/ChangeStudentStatus")
public class ChangeStudentStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String status=request.getParameter("status");
		HttpSession session=request.getSession();
		try {
			DAO dao=new DAO();
			boolean result=dao.changeStudentStatus(email, status);
			if(result==true) {
				session.setAttribute("message", "Student's status is updated successfully");
				response.sendRedirect("AdminHome.jsp");
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
