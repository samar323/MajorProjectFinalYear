package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.DAO;
import javaFiles.Semester;
import javaFiles.Subject;

/**
 * Servlet implementation class GetSubjectCombination
 */
@WebServlet("/GetSubjectCombination")
public class GetSubjectCombination extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try (PrintWriter out = response.getWriter()) {
			DAO dao=new DAO();
		String branch=request.getParameter("sid");
		String semester=request.getParameter("semester");
		
		if(branch!=null && semester!=null) {
			List<Subject> slist = dao.getSubjectCombination(branch, Integer.parseInt(semester));
            Gson json = new Gson();
            String semesterList = json.toJson(slist);
            response.setContentType("text/html");
            response.getWriter().write(semesterList);
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}
}
