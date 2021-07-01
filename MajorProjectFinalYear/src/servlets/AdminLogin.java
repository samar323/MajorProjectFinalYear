package servlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DAO;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String aid=request.getParameter("aid");
			String password=request.getParameter("password");
			
			DAO dao=new DAO();
			HashMap admin=dao.getAdmin(aid, password);
			if(admin!=null) {
				HttpSession session=request.getSession();
				session.setAttribute("adminDetails", admin);
				response.sendRedirect("AdminHome?status=pending");
			}else {
				HttpSession session=request.getSession();
				session.setAttribute("message", "ID/Password wrong!");
				response.sendRedirect("LoginAdmin");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
