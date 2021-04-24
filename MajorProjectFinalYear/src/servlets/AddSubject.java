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


@WebServlet("/AddSubject")
public class AddSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	try {
		HttpSession session=request.getSession();
		String subjectName=request.getParameter("subjectName");
		String subjectCode=request.getParameter("subjectCode");
		
		HashMap subject=new HashMap();
		subject.put("subjectName", subjectName);
		subject.put("subjectCode", subjectCode);
		DAO dao=new DAO();
		boolean result=dao.insertSubject(subject);
		if(result==true) {
			
			session.setAttribute("message","Subject Added Successfully!");
			response.sendRedirect("AddSubject.jsp");
		}else {
			
			session.setAttribute("message","Subject Already Added!");
			response.sendRedirect("AddSubject.jsp");
		}
		
	
	}catch(Exception ex) {
		ex.printStackTrace();
		response.sendRedirect("ExceptionPage.jsp");
	}
		
	}

}
