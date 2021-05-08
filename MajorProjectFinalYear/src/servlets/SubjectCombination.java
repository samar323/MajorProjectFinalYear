package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

@WebServlet("/SubjectCombination")
public class SubjectCombination extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String school = request.getParameter("school");
		String branch = request.getParameter("branch");
		String subject[] = request.getParameterValues("subject");
		String semester = request.getParameter("semester");
		
		try {
			DAO dao = new DAO();
			
			if (school != null && branch != null && semester != null) {
				int sem=Integer.parseInt(semester);
				int branchId = dao.getBranchId(school, branch, sem);
				int flag=0;
				for(String sub:subject) {
					flag++;
					dao.insertSubjectCombination(branchId, Integer.parseInt(sub));
				}
				if(flag==subject.length) {
					HttpSession session=request.getSession();
					session.setAttribute("message","Subjects Combination Stored Successfully");
					response.sendRedirect("SubjectCombination.jsp");
				}else {
					HttpSession session=request.getSession();
					session.setAttribute("message","Something went wrong!!");
					response.sendRedirect("SubjectCombination.jsp");
				}
				
			}else {
				HttpSession session=request.getSession();
				session.setAttribute("message","Please select all options");
				response.sendRedirect("SubjectCombination.jsp");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
