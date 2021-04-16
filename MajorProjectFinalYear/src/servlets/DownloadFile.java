package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

/**
 * Servlet implementation class DownloadFile
 */
@WebServlet("/DownloadFile")
public class DownloadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		String id=request.getParameter("id");
		String fname=request.getParameter("fname");
		HttpSession session=request.getSession();
		try {
			DAO dao=new DAO();
			byte [] file=dao.getFile(email);
			if(file!=null) {
				response.setContentType("APPLICATION/OCTET-STREAM");
				response.setHeader("Content-Disposition","attachment; filename="+fname);
				 response.getOutputStream().write(file);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}
	}


