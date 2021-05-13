package servlets;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import dao.DAO;
import javaFiles.SendMail;
@MultipartConfig
@WebServlet("/ChangeStudentStatus")
public class ChangeStudentStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String status=request.getParameter("status");
		HttpSession session=request.getSession();
		try {
			SendMail sendMail=new SendMail();
			DAO dao=new DAO();
			boolean result=dao.changeStudentStatus(email, status);
			if(result==true) {
				String Sub = null;
				String Body = null;
				try {
				if(status.equalsIgnoreCase("accept")) {
					Sub="Status Changed GBUVerse";
					Body="You are accepted and login now";
					}else if(status.equalsIgnoreCase("reject")) {
						Sub="Status Changed GBUVerse";
						Body="You are rejected, You can Register again with correct credentials";
					}
				if(Sub!=null && Body!=null && (status.equalsIgnoreCase("accept") || status.equalsIgnoreCase("reject"))) {
					boolean mailStatus=sendMail.emailSend(email,Sub,Body);
					if(mailStatus==true) {
						session.setAttribute("message", "Student's status is updated successfully");
						response.sendRedirect("AdminHome.jsp");
					}else {
						session.setAttribute("message", "Student's status is not updated!!");
						response.sendRedirect("AdminHome.jsp");
					}
				}
				
				
				
				
				}catch(Exception e) {
					e.printStackTrace();
					session.setAttribute("message", "Something went wrong with mail!!");
					response.sendRedirect("AdminHome.jsp");
				}
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
