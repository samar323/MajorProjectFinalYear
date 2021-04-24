package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

@WebServlet("/DeleteSubject")
public class DeleteSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
		int subjectId=Integer.parseInt(request.getParameter("id"));
		
		DAO dao=new DAO();
			boolean quesDeleteStatus=dao.deleteSubject(subjectId);
			if(quesDeleteStatus==true) {
				session.setAttribute("message","Subject Deleted Successfully!");
				response.sendRedirect("AddSubject.jsp");
			}else {
				session.setAttribute("message","Unable to delete subject.!");
				response.sendRedirect("AddSubject.jsp");
			}
		}catch(Exception e) {
			
		}
		
	}

}
