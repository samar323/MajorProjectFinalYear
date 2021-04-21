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

@WebServlet("/AddAnswer")
public class AddAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
			
			HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
			String answer =request.getParameter("answer");
			String studentId=(String)studentDetails.get("roll");
			int qid=Integer.parseInt(request.getParameter("qid"));
			HashMap answerDetails=new HashMap();
			answerDetails.put("qid", qid);
			answerDetails.put("studentId", studentId);
			answerDetails.put("answer", answer);
			DAO dao = new DAO();
			boolean status=dao.insertAnswer(answerDetails);
			if(status==true) {
				session.setAttribute("message", "Answer Added succesfully");
				response.sendRedirect("ViewAnswer.jsp?quesId="+qid);
			}else {
				session.setAttribute("message", "Some went wrong");
				response.sendRedirect("ViewAnswer.jsp?quesId="+qid);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
