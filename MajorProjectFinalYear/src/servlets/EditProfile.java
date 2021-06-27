package servlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

/**
 * Servlet implementation class EditProfile
 */
@MultipartConfig
@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
			HashMap studentDetails=(HashMap)session.getAttribute("studentDetails");
			String email=request.getParameter("email");
			String oldEmail=(String) studentDetails.get("email");
			String password=(String) studentDetails.get("password");
			
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			
			String school=request.getParameter("school");
			String branch=request.getParameter("branch");
			String roll=request.getParameter("roll");
			String	aadhar=request.getParameter("aadhar");
			HashMap student=new HashMap();
			student.put("email", email);
			
			student.put("name", name);
			student.put("phone", phone);
			
			student.put("school", school);
			student.put("branch", branch);
			student.put("roll", roll);
			student.put("aadhar", aadhar);
			
			DAO dao=new DAO();
			boolean result=dao.updateStudent(student,oldEmail);
			if(result==true) {
				session=request.getSession();
				HashMap students=dao.getStudent(email,password);
				session.setAttribute("studentDetails", students);
				session.setAttribute("message","Profile Updated Successfully!");
				response.sendRedirect("StudentHome");
			}else {
				 session=request.getSession();
				session.setAttribute("message","Something went wrong!");
				response.sendRedirect("EditProfile.jsp");
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
