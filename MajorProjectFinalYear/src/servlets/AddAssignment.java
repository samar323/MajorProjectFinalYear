package servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

/**
 * Servlet implementation class AddAssignment
 */
@WebServlet("/AddAssignment")
public class AddAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String aid=request.getParameter("aid");
		try {
		
		String assignment=request.getParameter("assignment");
		String dt=request.getParameter("dueDate");
		
		if(aid!=null && assignment!=null && dt!=null) {
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date=df.parse(dt);
		java.sql.Date dueDate=new java.sql.Date(date.getTime());
		
		HashMap assignmentDetails=new HashMap();
		assignmentDetails.put("aid", Integer.parseInt(aid));
		assignmentDetails.put("assignment", assignment);
		assignmentDetails.put("dueDate", dueDate);
		
		DAO dao=new DAO();
		boolean status=dao.insertAssignment(assignmentDetails);
		if(status==true) {
			session.setAttribute("message", "Assignment Added Successfully");
			response.sendRedirect("AddAssignment.jsp?aid="+aid);
		}else {
			session.setAttribute("message", "Assignment not Added");
			response.sendRedirect("AddAssignment.jsp?aid="+aid);
		}
		
		}else {
			session.setAttribute("message", "Plzz fill all details");
			response.sendRedirect("AddAssignment.jsp?aid="+aid);
		}
		}catch(Exception ex) {
			ex.printStackTrace();
			session.setAttribute("message", "Something went wrong!!");
			response.sendRedirect("AddAssignment.jsp?aid="+aid);
		}
	}

}
