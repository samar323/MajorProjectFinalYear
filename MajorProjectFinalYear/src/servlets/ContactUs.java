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
 * Servlet implementation class ContactUs
 */
@WebServlet("/ContactUs")
public class ContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
			
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String message=request.getParameter("message");
			DAO dao=new DAO();
			if(dao.checkEmail(email)) {
				
			
			
			HashMap messages=new HashMap();
			
			messages.put("name", name);
			messages.put("email", email);
			messages.put("message", message);
			boolean result=dao.insertMessage(messages);
			if(result==true) {
				
				session.setAttribute("message","Message Added Successfully!");
				response.sendRedirect("ContactUs.jsp");
			}else {
				
				session.setAttribute("message","Message  not Added!");
				response.sendRedirect("ContactUs.jsp");
			}
			}else {
				
				session.setAttribute("message","This email does not exist");
				response.sendRedirect("StudentLogin.jsp");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
		
	
	}
	
}
