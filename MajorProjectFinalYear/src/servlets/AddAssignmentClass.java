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
import javaFiles.ClassCode;

/**
 * Servlet implementation class AddAssignment
 */
@WebServlet("/AddAssignmentClass")
public class AddAssignmentClass extends HttpServlet {
	
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		try {
		
		String className=request.getParameter("class");
		String subject=request.getParameter("subject");
		ClassCode code=new ClassCode();
		String randomCode=code.getClassCode();
		
		HashMap teacherDetails=(HashMap)session.getAttribute("teacherDetails");
		int teacherId=(int)teacherDetails.get("tid");
		
		HashMap assignmentclass=new HashMap();
		assignmentclass.put("teacherId", teacherId);
		assignmentclass.put("className", className);
		assignmentclass.put("subject", subject);
		assignmentclass.put("randomCode", randomCode);
		
		DAO dao=new DAO();
		
		boolean status=dao.insertAssignmentClass(assignmentclass);
		if(status==true) {
			session.setAttribute("message", "Class Added Successfully");
			response.sendRedirect("TeacherHome.jsp");
		}else {
			session.setAttribute("message", "Class Not Added");
			response.sendRedirect("TeacherHome.jsp");
		}
		}catch(Exception ex) {
			ex.printStackTrace();
			session.setAttribute("message", "Something went wrong!!");
			response.sendRedirect("TeacherHome.jsp");
		}
	}

}
