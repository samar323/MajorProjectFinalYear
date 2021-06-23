package servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

/**
 * Servlet implementation class PostQuestion
 */
@WebServlet("/PostQuestion")
public class PostQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		//
		HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
		if(studentDetails!=null) {
			String status=(String) studentDetails.get("status");
			if(status.equalsIgnoreCase("accept")) {
		String studentId=(String)studentDetails.get("roll");
		try {
			String question=request.getParameter("question");
			HashMap student=new HashMap();
			
			student.put("question", question);
			student.put("studentId", studentId);
			
			DAO dao=new DAO();
			boolean result=dao.insertQuestion(student);
			if(result==true) {
				
				session.setAttribute("message","Question Posted Successfully!");
				response.sendRedirect("StudentHome");
			}else {
				
				session.setAttribute("message","Question Already Posted!");
				response.sendRedirect("StudentHome");
			}
			
		}
	
		catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
			}else {
				session.setAttribute("message","Your status is pending");
				response.sendRedirect("home");
			}
		}else {
			session.setAttribute("message","Login First for post Questions");
			response.sendRedirect("home");
		}
	}

}
