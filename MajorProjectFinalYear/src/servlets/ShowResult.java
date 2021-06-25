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
import javaFiles.*;

/**
 * Servlet implementation class ShowResult
 */
@WebServlet("/ShowResult")
public class ShowResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try (PrintWriter out = response.getWriter()) {
			
			String school=request.getParameter("school");
			String sid=request.getParameter("sid");
			String semester=request.getParameter("semester");
			DAO dao=new DAO();
			if(school!=null && sid!=null && semester!=null) {
				List<Result> rlist = dao.getAllResult(school, sid, Integer.parseInt(semester));
				Gson json = new Gson();
                String resultList = json.toJson(rlist);
                response.setContentType("text/html");
                response.getWriter().write(resultList);
			}
            
            
            
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
