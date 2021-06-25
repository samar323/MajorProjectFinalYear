package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

@WebServlet("/DeleteAnswer")
public class DeleteAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
		int quesId=Integer.parseInt(request.getParameter("id"));
		
		DAO dao=new DAO();
			boolean quesDeleteStatus=dao.deleteAnswer(quesId);
			if(quesDeleteStatus==true) {
				session.setAttribute("message","Answer Deleted Successfully!");
				response.sendRedirect("YourAnswers");
			}else {
				session.setAttribute("message","Unable to delete ques.!");
				response.sendRedirect("YourAnswers");
			}
		}catch(Exception e) {
			
		}
		
	}

}
