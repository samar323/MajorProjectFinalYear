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
 * Servlet implementation class JoinClass
 */
@WebServlet("/JoinClass")
public class JoinClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		HashMap studentDetails = (HashMap) session.getAttribute("studentDetails");
		if (studentDetails != null) {
			try {

				String studentId = (String) studentDetails.get("roll");
				String classCode = request.getParameter("classCode");
				
				if(studentId!=null && classCode!=null) {
					
					DAO dao=new DAO();
					HashMap classDetails=new HashMap();
					classDetails.put("studentId", studentId);
					classDetails.put("classCode", classCode);
					
					boolean status=dao.insertStudentClass(classDetails);
					if(status==true) {
						session.setAttribute("message","Class Joined Succesfully");
						response.sendRedirect("AssignmentClass.jsp");
					}else {
						session.setAttribute("message","Class not Joined");
						response.sendRedirect("AssignmentClass.jsp");
					}
					
				}else {
					session.setAttribute("message","Plz Enter Class Code");
					response.sendRedirect("AssignmentClass.jsp");
				}

			} catch (Exception ex) {
				ex.printStackTrace();
				session.setAttribute("message","Something went wrong!!");
				response.sendRedirect("AssignmentClass.jsp");
			}
		}else {
			session.setAttribute("message","Plz LOGIN First!");
			response.sendRedirect("StudentLogin.jsp");
		}

	}

}
