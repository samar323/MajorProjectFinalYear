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
 * Servlet implementation class DeleteAssignment
 */
@WebServlet("/DeleteAssignment")
public class DeleteAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
		int id=Integer.parseInt(request.getParameter("id"));
		int aid=Integer.parseInt(request.getParameter("aid"));
	
		DAO dao=new DAO();
			boolean DeleteStatus=dao.deleteAssignment(id);
			if(DeleteStatus==true) {
				session.setAttribute("message","Assignment Deleted Successfully!");
				response.sendRedirect("AddAssignment.jsp?aid="+aid);
			}else {
				session.setAttribute("message","Unable to delete assignment.!");
				response.sendRedirect("AddAssignment.jsp?aid="+aid);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
