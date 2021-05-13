package javaFiles;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	public boolean emailSend(String email, String Sub, String Body) {
		try {
			final String SEmail="fiverphoto123@gmail.com";
			final String SPass="Samar323@";
			final String REmail=email;
			//Mail send
			Properties prop=new Properties();
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.port", "587");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.starttls.enable", "true");
			
			Session ses=Session.getInstance(prop, new javax.mail.Authenticator() {
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
			}catch(Exception e) {
				e.printStackTrace();
			}
		
		return true;
	}
}
