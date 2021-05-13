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


@WebServlet("/AddBranch")
public class AddBranch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	try {
		HttpSession session=request.getSession();
		int semester=(Integer.parseInt(request.getParameter("sem")));
		String school=request.getParameter("school");
		String branchName=request.getParameter("branch");
		int status=0;
		DAO dao=new DAO();
		if(dao.checkBranch(school,branchName)) {
		for(int sem=1;sem<=semester;sem++) {
		HashMap branch=new HashMap();
		branch.put("semester", sem);
		branch.put("school", school);
		branch.put("branch", branchName);
		
		
		dao.insertBranch(branch);
		status++;
//		if(result==true) {
//			
//			session.setAttribute("message","Branch Added Successfully!");
//			response.sendRedirect("AddBranch.jsp");
//		}else {
//			
//			session.setAttribute("message","Branch Already Added!");
//			response.sendRedirect("AddBranch.jsp");
//		}
		}
		if(status==semester) {
			
			session.setAttribute("message","Branch Added Successfully!");
			response.sendRedirect("AddBranch.jsp");
		}else {
			
			session.setAttribute("message","Something went wrong!");
			response.sendRedirect("AddBranch.jsp");
		}
		}
		else {
			session.setAttribute("message","Branch Already Added!");
			response.sendRedirect("AddBranch.jsp");
		}
	}catch(Exception ex) {
		ex.printStackTrace();
		response.sendRedirect("ExceptionPage.jsp");
	}
		
	}

}
