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
 * Servlet implementation class DeleteMessage
 */
@WebServlet("/DeleteMessage")
public class DeleteMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		HashMap adminDetails=(HashMap)session.getAttribute("adminDetails");
		if(adminDetails!=null){
		try {
		String mid=request.getParameter("mid");
		if(mid!=null) {
			DAO dao=new DAO();
			boolean status=dao.deleteMessage(Integer.parseInt(mid));
			if(status==true) {
				session.setAttribute("message","Message Deleted Successfully!");
				response.sendRedirect("Feedback.jsp");
			}else {
				session.setAttribute("message","Message not Deleted");
				response.sendRedirect("Feedback.jsp");
			}
		}else {
			session.setAttribute("message","No Message found!!");
			response.sendRedirect("Feedback.jsp");
		}
		}catch(Exception ex){
			ex.printStackTrace();
			session.setAttribute("message","Something went wrong!!");
			response.sendRedirect("Feedback.jsp");
		}
		}else {
			session.setAttribute("message","Plz LOGIN First!");
			response.sendRedirect("AdminLogin.jsp");
		}
	}

}
