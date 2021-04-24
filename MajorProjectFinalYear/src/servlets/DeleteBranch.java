package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

@WebServlet("/DeleteBranch")
public class DeleteBranch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
		int branchId=Integer.parseInt(request.getParameter("id"));
		
		DAO dao=new DAO();
			boolean quesDeleteStatus=dao.deleteBranch(branchId);
			if(quesDeleteStatus==true) {
				session.setAttribute("message","Branch Deleted Successfully!");
				response.sendRedirect("AddBranch.jsp");
			}else {
				session.setAttribute("message","Unable to delete branch.!");
				response.sendRedirect("AddBranch.jsp");
			}
		}catch(Exception e) {
			
		}
		
	}

}
