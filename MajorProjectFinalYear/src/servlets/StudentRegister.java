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


/**
 * Servlet implementation class StudentRegister
 */
@MultipartConfig
@WebServlet("/StudentRegister")
public class StudentRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public StudentRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String gender=request.getParameter("gender");
			String school=request.getParameter("school");
			String branch=request.getParameter("branch");
			String roll=request.getParameter("roll");
			Part p1=request.getPart("photo");
			InputStream photo=null;
			if(p1!=null) {
				photo=p1.getInputStream();
			}
			Part p2=request.getPart("id");
			InputStream id=null;
			if(p2!=null) {
				id=p2.getInputStream();
			}
			HashMap student=new HashMap();
			student.put("email", email);
			student.put("password", password);
			student.put("name", name);
			student.put("phone", phone);
			student.put("gender", gender);
			student.put("school", school);
			student.put("branch", branch);
			student.put("roll", roll);
			student.put("id", id);
			student.put("photo", photo);
			
			DAO dao=new DAO();
			boolean result=dao.insertStudent(student);
			if(result==true) {
				HttpSession session=request.getSession();
				session.setAttribute("message","Student Registered Successfully!");
				response.sendRedirect("StudentLogin.jsp");
			}else {
				HttpSession session=request.getSession();
				session.setAttribute("message","Student Already Registered!");
				response.sendRedirect("StudentRegister.jsp");
			}
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
		
	}

}
