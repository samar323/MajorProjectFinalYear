package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.DAO;
@WebServlet("/FAQ")
public class FAQ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
	
try {
	HttpSession session=request.getSession();
	String question=request.getParameter("question");
	String answer=request.getParameter("answer");
	DAO dao=new DAO();
	boolean result=dao.insertFaq(question,answer);
	if(result==true) {
		
		session.setAttribute("message","FAQ Added Successfully!");
		response.sendRedirect("AdminHome.jsp");
	}else {
		
		session.setAttribute("message","FAQ Already Added!");
		response.sendRedirect("AdminHome.jsp");
	}
}catch(Exception ex) {
	ex.printStackTrace();
	response.sendRedirect("ExceptionPage.jsp");
}
}
}