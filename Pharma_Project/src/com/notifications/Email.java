package com.notifications;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.dbutils.ConnectDB;
public class Email {
	private String emailID;
	private boolean role;

	public Email(String email, boolean role) {
		super();
		this.emailID = email;
		this.role = role;
	}
	public boolean checkemail()
	{	

		String userEmail = emailID;
		try (Connection con = ConnectDB.getConnection()){
			String sqlQuery;
			if(role)
			{//role is true for admin
				sqlQuery="select admin_email from admin where admin_email=?";
			}
			else
			{
				sqlQuery="select operator_email from operator where operator_email=?";
			}
			PreparedStatement pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1,userEmail);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next() )
			{
				//If row exit valid credentials
				return true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return false;

	}
	public boolean sendemail()
	{

		final String username = "project.pharmachain@gmail.com";
		final String pwd = "Passw0rd@1";
		String userEmail = emailID;
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, pwd);
			}
		});
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("project.pharmachain@gmail.com"));

			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(userEmail));

			message.setSubject("Testing Subject");
			message.setText("Hey Mahesh,"
					+ "\n\n I am sending this for testing purpose.");

			Transport.send(message);

			System.out.println("Done");
			return true;

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		

	}
}
