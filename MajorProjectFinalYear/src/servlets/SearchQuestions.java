package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javaFiles.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.DAO;

/**
 * Servlet implementation class SearchQuestion
 */
@WebServlet("/SearchQuestions")
public class SearchQuestions extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {

            DAO dao=new DAO();
            String question=request.getParameter("searchQues");
            
            List<SearchQuestion> slist=dao.getSearchQuestion(question);
            Gson json = new Gson();
            String questionList = json.toJson(slist);
            response.setContentType("text/html");
            response.getWriter().write(questionList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
