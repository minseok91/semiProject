package com.kh.lp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.member.model.service.MemberService;
import com.kh.lp.member.model.vo.Member;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class LoginMemberServlet
 */
@Log4j2
@WebServlet("/login.me")
public class LoginMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		log.debug("memberId : " + memberId);
		log.debug("memberPwd : " + memberPwd);
		
		Member requestMember = new Member();
		requestMember.setMemberId(memberId);
		requestMember.setMemberPwd(memberPwd);
		
		Member loginMember = new MemberService().loginCheck(requestMember);
		
		if(loginMember.getMemberId() != null) {
			if(loginMember.getMemberId().equals("admin")) {
				request.getSession().setAttribute("loginMember", loginMember);
				response.sendRedirect(request.getContextPath() + "/views/admin/admin_mainPage.jsp");
			} else {
				request.getSession().setAttribute("loginMember", loginMember);
				response.sendRedirect(request.getContextPath() + "/index.jsp");
			}
		}else {
			request.setAttribute("msg", "failLogin");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
