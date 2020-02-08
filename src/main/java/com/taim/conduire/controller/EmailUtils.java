package com.taim.conduire.controller;

import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;


public class EmailUtils {
	private Logger logger;
	
	
	public EmailUtils() {
		logger = LogManager.getLogger();
	}
	
	public EmailUtils(Logger logger) {
		this.logger = logger;
	}
	
	/*
	 * ccMailId field should be Comma separated
	 */
	
	public void sendEmail(String toMailId,String ccMailId,String subject,String body) {
		logger.debug("Inside send email");
		Properties properties = new Properties();
		 properties.put("mail.smtp.host", "smtp.gmail.com");
         properties.put("mail.smtp.port", "587");
         properties.put("mail.smtp.auth", "true");
         properties.put("mail.smtp.starttls.enable", "true");
		Authenticator authenticator =  new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("purchasing@stoneandtileshoppe.com", "plcvjegpnfghrglb");
			}
		};
		Session session = Session.getDefaultInstance(properties,authenticator);
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress("purchasing@stoneandtileshoppe.com","Stone & Tile Shoppe"));
			message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(toMailId));
			if(!ccMailId.isEmpty() || ccMailId != null) {
				message.setRecipients(MimeMessage.RecipientType.CC, InternetAddress.parse(ccMailId));	
			}			
			message.setSubject(subject);
		    Multipart multipart = new MimeMultipart();
	        message.setContent(multipart);
	        
	        BodyPart messageBodyPart = new MimeBodyPart();
	        messageBodyPart.setContent(body, "text/html");
			multipart.addBodyPart(messageBodyPart);
	        
			logger.debug("mail sent");
			Transport.send(message);
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		logger.debug("Leaving send email");
	}
	

}