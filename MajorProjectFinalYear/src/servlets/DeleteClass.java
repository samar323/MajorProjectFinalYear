package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

/**
 * Servlet implementation class DeleteClass
 */
@WebServlet("/DeleteClass")
public class DeleteClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
		int classId=Integer.parseInt(request.getParameter("id"));
	
		DAO dao=new DAO();
			boolean DeleteStatus=dao.deleteClass(classId);
			if(DeleteStatus==true) {
				session.setAttribute("message","Class Deleted Successfully!");
				response.sendRedirect("TeacherHome.jsp");
			}else {
				session.setAttribute("message","Unable to delete class.!");
				response.sendRedirect("TeacherHome.jsp");
			}
		}catch(Exception e) {
			
		}
	}

}
