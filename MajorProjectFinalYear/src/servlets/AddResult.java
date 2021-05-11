package servlets;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

@WebServlet("/AddResult")
public class AddResult extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String school = request.getParameter("school");
			String branch = request.getParameter("branch");
			String semester = request.getParameter("semester");
			String roll = request.getParameter("roll");
			String subjectId[] = request.getParameterValues("subjectId");
			String marks[] = request.getParameterValues("marks");
			int flag=0;
			DAO dao = new DAO();
			if (school != null && branch != null && semester != null && roll != null && subjectId != null && marks != null) {
				int classId = dao.getBranchId(school, branch, Integer.parseInt(semester));
				if(subjectId.length==marks.length) {
				for(int i=0;i<marks.length;i++) {
					if(i<marks.length) {
					HashMap result=new HashMap();
					result.put("roll", roll);
					result.put("classId", classId);
					result.put("subjectId", Integer.parseInt(subjectId[i]));
					result.put("mark", Integer.parseInt(marks[i]));
					boolean status=dao.insertResult(result);
					if(status==true) {
						flag++;
					}
					}
				}
				if(flag==marks.length) {
					HttpSession session=request.getSession();
					session.setAttribute("message","Result Added Successfully");
					response.sendRedirect("AddResult.jsp");
				}else {
					HttpSession session=request.getSession();
					session.setAttribute("message","Result Doesn't added!!");
					response.sendRedirect("AddResult.jsp");
				}
				}else {
					HttpSession session=request.getSession();
					session.setAttribute("message","Some Went Wrong!!");
					response.sendRedirect("AddResult.jsp");
				}
			}else {
				HttpSession session=request.getSession();
				session.setAttribute("message","Please select & Enter all options");
				response.sendRedirect("AddResult.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
