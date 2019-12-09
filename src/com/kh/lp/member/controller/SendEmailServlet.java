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

import com.kh.lp.common.EmailTemplate;
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
