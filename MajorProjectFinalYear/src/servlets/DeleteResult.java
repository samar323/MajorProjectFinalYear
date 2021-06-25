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
 * Servlet implementation class DeleteResult
 */
@WebServlet("/DeleteResult")
public class DeleteResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
		if(adminDetails!=null) {
		String studentId=request.getParameter("studentId");
		String classId=request.getParameter("classId");
		
		try {
			DAO dao=new DAO();
			
		if(studentId!=null && classId!=null) {
			boolean status=dao.deleteResult(studentId, Integer.parseInt(classId));
			if(status==true) {
				session.setAttribute("message", "Result Deleted Successfully");
				response.sendRedirect("ResultAdd");
			}else {
				session.setAttribute("message", "Something went wrong with Result Deletion!!");
				response.sendRedirect("ResultAdd");
			}
		}else {
			session.setAttribute("message", "Something went wrong!!");
			response.sendRedirect("ResultAdd");
		}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}else{
			session.setAttribute("message","Plz LOGIN First!");
			response.sendRedirect("AdminLogin.jsp");
		}
	}

}
