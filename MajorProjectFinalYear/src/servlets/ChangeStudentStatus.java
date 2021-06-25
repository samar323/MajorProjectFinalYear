package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
		PrintWriter out=response.getWriter();
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
					try {
					final String SEmail="fiverphoto123@gmail.com";
					final String SPass="Samar323@";
					final String REmail=email;
					//Mail send
					Properties props = new Properties();
					props.put("mail.smtp.auth", "true");
					props.put("mail.smtp.starttls.enable", "true");
			        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
					props.put("mail.smtp.host", "smtp.gmail.com");
					props.put("mail.smtp.port", "587");
				
					Session ses=Session.getInstance(props, new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(SEmail,SPass);
						}
					});
					Message message=new MimeMessage(ses);
					message.setFrom(new InternetAddress(SEmail));
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(REmail));
					message.setSubject(Sub);
					message.setContent(Body,"text/html");
					
					Transport.send(message);
					session.setAttribute("message", "Student's status is updated successfully");
					response.sendRedirect("AdminHome");
					
					//boolean mailStatus=sendMail.emailSend(email,Sub,Body);
//					if(mailStatus==true) {
//						session.setAttribute("message", "Student's status is updated successfully");
//						response.sendRedirect("AdminHome");
//					}else {
//						session.setAttribute("message", "Something went wrong with mail!!");
//						response.sendRedirect("AdminHome");
//					}
					}catch(Exception ex) {
						out.println(ex);
					}
				}
				
				}catch(Exception e) {
					e.printStackTrace();
					session.setAttribute("message", "Something went wrong with mail!!");
					response.sendRedirect("AdminHome");
				}
			}else {
				session.setAttribute("message", "Student's status is not updated!!");
				response.sendRedirect("AdminHome");
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
