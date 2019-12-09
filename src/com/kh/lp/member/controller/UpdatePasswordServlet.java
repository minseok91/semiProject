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
 * Servlet implementation class UpdatePasswordServlet
 */
@Log4j2
@WebServlet("/updatePwd.me")
public class UpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePasswordServlet() {
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
		String memberPwd = request.getParameter("memberPwd");
		String memberName = request.getParameter("memberName");
		String memberEmail = request.getParameter("memberEmail");
		
		Member requestMember = new Member();
		
		requestMember.setMemberId(memberId);
		requestMember.setMemberPwd(memberPwd);
		requestMember.setMemberName(memberName);
		requestMember.setMemberEmail(memberEmail);
		
		log.debug(memberId);
		log.debug(memberPwd);
		log.debug(memberName);
		log.debug(memberEmail);
		
		int result = new MemberService().updatePassword(requestMember);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/views/member/findPasswordResult.jsp");
		} else {
			request.setAttribute("msg", "비밀번호변경실패");
			request.getRequestDispatcher(request.getContextPath() + "/views/common/errorPage.jsp");
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
