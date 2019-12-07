package com.kh.lp.common;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.kh.lp.wrapper.EmailCodeWrapper;


public class EmailTemplate {
	private String mailProtocol = "smtp";				//이메일 프로토콜
	private String mailHost = "smtp.gmail.com";			//G메일 호스트주소
	private String mailPort = "587";					//G메일포트번호
	private String mailId = "lauxion04@gmail.com";		//연결할 G메일 ID
	private String mailPwd = "semiioi04@";				//연결할 G메일 Password
	private String fromName = "LauXion 관리자";			//발신자 이름
	private String fromEmail = "lauxion04@gmail.com";	//발신자 이메일
	String debugMode = "false";							//디버깅모드								
	String authMode = "true";							//관리자모드
	
	public EmailTemplate() {}
	
	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 8. 오후 2:00:00
	 * @ModifyDate    : 2019. 12. 8. 오전 2:38:11
	 * @Description   : 이메일 인증번호 템플릿 메소드
	 * @param name
	 * @param email
	 * @param contents
	 */
	public void sendEmailCode(String name, String email, String code) {	//받는사람 이름, 이메일, 내용물(인증코드)만 있으면 된다.
		String toName = name;													
		String toEmail = email;													
		String mailTitle = "이메일 인증코드입니다.";									
		String mailContents = "인증코드 : " + code + "\n 10분 이내로 인증완료하세요";		
														
		
		doEmail(toName, toEmail, mailTitle, mailContents, debugMode, authMode);
	}	
	
	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 8. 오전 2:48:53
	 * @ModifyDate    : 2019. 12. 8. 오전 2:48:53
	 * @Description   : 이메일 타이틀, 내용 템플릿 메소드
	 * @param name
	 * @param email
	 * @param title
	 * @param contents
	 */
	public void sendEmailContents(String name, String email, String title, String contents) {
		String toName = name;
		String toEmail = email;
		String mailTitle = title;
		String mailContents = contents;
		
		doEmail(toName, toEmail, mailTitle, mailContents, debugMode, authMode);
	}
	
	/**
	 * @Author	      : gurwns
	 * @CreateDate    : 2019. 12. 8. 오전 4:12:17
	 * @ModifyDate    : 2019. 12. 8. 오전 4:12:17
	 * @Description   : 이메일을 실질적으로 보내주는 공통 메소드
	 * @param toName
	 * @param toEmail
	 * @param mailTitle
	 * @param mailContents
	 * @param debugMode
	 * @param authMode
	 */
	void doEmail(String toName, String toEmail, String mailTitle, String mailContents, String debugMode, String authMode) {
		boolean debug = Boolean.valueOf(debugMode).booleanValue();
		Properties mailProps = new Properties();
		
		mailProps.put("mail.smtp.starttls.enable", "true");
		mailProps.setProperty("mail.transport.protocol", mailProtocol);
		mailProps.put("mail.debug", debugMode);
		mailProps.put("mail.smtp.host", mailHost);
		mailProps.put("mail.smtp.port", mailPort);
		mailProps.put("mail.smtp.connectiontimeout", "5000");
		mailProps.put("mail.smtp.timeout", "5000");
		mailProps.put("mail.smtp.auth", authMode);
		
		Session msgSession = null;

		if(authMode.equals("true")) {
	        Authenticator auth = new MyAuthentication(mailId, mailPwd);
			msgSession = Session.getInstance(mailProps, auth);
		} else {
			msgSession = Session.getInstance(mailProps, null); 
		}
		msgSession.setDebug(debug);
		MimeMessage msg = new MimeMessage(msgSession);
		try {
			msg.setFrom(new InternetAddress(fromEmail, fromName));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail, toName));
			msg.setSubject(mailTitle);
			msg.setContent(mailContents, "text/html; charset=UTF-8");

			Transport t = msgSession.getTransport(mailProtocol);
			
			t.connect();
			t.sendMessage(msg, msg.getAllRecipients());
			t.close();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	public String createCode() {
		String tempCode = new EmailCodeWrapper().getSha512(String.valueOf((char) (new Random().nextInt(26)) + 97));
		int num = new Random().nextInt(10) + 1;
		String emailCode = tempCode.substring(num, num + 10);
		
		return emailCode;
	}
}

