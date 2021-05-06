package servlets;

import javaFiles.*;
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
@WebServlet("/GetSchoolBranchSubject")
public class GetSchoolBranchSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try (PrintWriter out = response.getWriter()) {

            DAO dao=new DAO();
            
            String op = request.getParameter("operation");
            
            if (op.equals("school")) {
                List<School> slist = dao.getAllSchools();
                Gson json = new Gson();
                String schoolList = json.toJson(slist);
                response.setContentType("text/html");
                response.getWriter().write(schoolList);
            }

            if (op.equals("branch")) {
                String school = request.getParameter("name");
                List<Branch> blist = dao.getAllBranchesBySchool(school);
                Gson json = new Gson();
                String branchList = json.toJson(blist);
                response.setContentType("text/html");
                response.getWriter().write(branchList);
            }

            
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
