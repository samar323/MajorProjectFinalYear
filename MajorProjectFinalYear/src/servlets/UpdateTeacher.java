package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.DAO;


@MultipartConfig
@WebServlet("/UpdateTeacher")
public class UpdateTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
			HashMap teacherDetails=(HashMap)session.getAttribute("teacherDetails");
			
			String oldEmail=(String) teacherDetails.get("email");
			
			
			String email=request.getParameter("email");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String password=request.getParameter("password");
			Part p1=request.getPart("photo");
			InputStream photo=null;
			if(p1!=null) {
				photo=p1.getInputStream();
			}
			HashMap teacher=new HashMap();
			teacher.put("email", email);
			teacher.put("name", name);
			teacher.put("phone", phone);
			teacher.put("password", password);
			teacher.put("photo", photo);
			
			DAO dao=new DAO();
			boolean result=dao.updateTeacher(teacher, oldEmail, photo);
			if(result==true) {
				session=request.getSession();
				HashMap teachers=dao.getTeacher(email,password);
				session.setAttribute("teacherDetails", teachers);
				session.setAttribute("message","Profile Updated Successfully!");
				response.sendRedirect("TeacherHome.jsp");
			}else {
				 session=request.getSession();
				session.setAttribute("message","Something went wrong!");
				response.sendRedirect("UpdateTeacher.jsp");
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
