package com.kh.lp.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.common.MyAuthentication;
import com.kh.lp.member.model.service.MemberService;
import com.kh.lp.member.model.vo.Member;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class SendEmailServlet
 */
@Log4j2
@WebServlet("/sendEmail.me")
public class SendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String memberId = request.getParameter("memberId");
		String memberEmail1 = request.getParameter("memberEmail1");
		String memberEmail2 = request.getParameter("memberEmail2");
		String memberEmail = memberEmail1 + "@" + memberEmail2;
		
		log.debug(memberId + ", " + memberEmail);
		
		Member requestMember = new Member();
		
		requestMember.setMemberId(memberId);
		requestMember.setMemberEmail(memberEmail);
		
		String result = new MemberService().sendEmail(requestMember);
		
		PrintWriter out = response.getWriter();
		
		if(result != null) {
			String mailProtocol = "smtp";
			String mailHost = "smtp.gmail.com";
			String mailPort = "587";
			String mailId = "lauxion04@gmail.com";
			String mailPwd = "semiioi04@";
			
			String fromName = "LauXion 관리자";
			String fromEmail = "lauxion04@gmail.com";
			String toName = requestMember.getMemberId();
			String toEmail = requestMember.getMemberEmail();
			String mailTitle = "이메일 인증코드입니다.";
			String mailContents = "인증코드 : " + result + "\n 1시간 이내로 인증완료하세요";
			String debugMode = "false";
			String authMode = "true";
			
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
			}
			out.append("true");
		} else {
			out.append("false");
		}
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
