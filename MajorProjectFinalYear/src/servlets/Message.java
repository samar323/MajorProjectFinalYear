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
 * Servlet implementation class Message
 */
@WebServlet("/Message")
public class Message extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
			String	studentEmail=(String) session.getAttribute("email");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String message=request.getParameter("message");
			//String	studentEmail=request.getParameter("studentEmail");
			//if(email==studentEmail) {
				
			
			DAO dao=new DAO();
			HashMap messages=new HashMap();
			
			messages.put("name", name);
			messages.put("email", email);
			messages.put("message", message);
			boolean result=dao.insertMessage(messages);
			if(result==true) {
				
				session.setAttribute("message","Message Added Successfully!");
				response.sendRedirect("Message.jsp");
			}else {
				
				session.setAttribute("message","Message Already Added!");
				response.sendRedirect("Message.jsp");
			}
//			}else {
//				
//				session.setAttribute("message","Galat ha");
//				response.sendRedirect("Message.jsp");
//			}
		}catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
		
	
	}
	
}
