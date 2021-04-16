package servlets;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;


/**
 * Servlet implementation class GetPhoto
 */
@WebServlet("/GetId")
public class GetId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email=request.getParameter("email");
			//String type=request.getParameter("type");
			DAO dao=new DAO();
			byte [] id=dao.getId(email);
			
			
			if(id==null) {
				id=new byte[3500];
				ServletContext ctx=getServletContext();
				InputStream i=ctx.getResourceAsStream("pictures/defaultUser.png");
				i.read(id);
			}
			response.getOutputStream().write(id);
		}catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
