package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import javaFiles.*;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		DAO dao= new DAO();
		AES aes=new AES();
		HttpSession session = request.getSession();
		String operation=request.getParameter("operation");
		if(operation.equalsIgnoreCase("send")) {
		OTPGenerate og = new OTPGenerate();
		SendMail sendMail = new SendMail();
		String email = request.getParameter("email");
		try {
			
			if (dao.checkEmail(email) == true) {
				String Sub = "OTP for change password";
				String otp = og.OTP();
				String Body = "OTP for password change: " + otp;
				boolean mailStatus = sendMail.emailSend(email, Sub, Body);
				if (mailStatus == true) {
					session.setAttribute("email", email);
					session.setAttribute("otp", otp);
					session.setMaxInactiveInterval(180);
					session.setAttribute("message", "OTP has been sent to "+email);
					response.sendRedirect("ForgotPassword.jsp");
				} else {
					session.setAttribute("message", "Something went wrong!!");
					response.sendRedirect("ForgotPassword.jsp");
				}
			}else {
				session.setAttribute("message", "Email Doesn't Exist!!");
				response.sendRedirect("ForgotPassword.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}else if(operation.equalsIgnoreCase("otp")) {
		String email=(String) session.getAttribute("email");
		String otp=(String) session.getAttribute("otp");
		String getOtp=request.getParameter("otp");
		if(otp.equals(getOtp)) {
			response.sendRedirect("ChangePassword.jsp");
		}else {
			session.setAttribute("message", "Wrong OTP");
			response.sendRedirect("ForgotPassword.jsp");
		}
	}
	else if(operation.equalsIgnoreCase("newpass")) {
		String password=request.getParameter("password");
		String cnfpassword=request.getParameter("cnfpassword");
		String email=(String) session.getAttribute("email");
		if(email!=null) {
		if(password.equals(cnfpassword)) {
			
			boolean status=dao.changePassword(email, aes.encrypt(password));
			if(status==true) {
				session.removeAttribute("email");
				session.removeAttribute("otp");
				session.setAttribute("message", "Your Password has been changed");
				response.sendRedirect("StudentLogin.jsp");
			}else {
				session.setAttribute("message", "password not changed");
				response.sendRedirect("ChangePassword.jsp");
			}
		}else {
			session.setAttribute("message", "Password Doesn't match");
			response.sendRedirect("ChangePassword.jsp");
		}
		}else {
			session.setAttribute("message", "Something went wrong!!");
			response.sendRedirect("ForgotPassword.jsp");
		}
	}
		}catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	}
}
