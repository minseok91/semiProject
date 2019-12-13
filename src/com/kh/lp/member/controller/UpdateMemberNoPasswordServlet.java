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
 * Servlet implementation class UpdateMemberNoPasswordServlet
 */
@Log4j2
@WebServlet("/updateMemberNP.me")
public class UpdateMemberNoPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberNoPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String memberPhone1 = request.getParameter("memberPhone1");
		String memberPhone2 = request.getParameter("memberPhone2");
		String memberPhone3 = request.getParameter("memberPhone3");
		String memberPhone = memberPhone1 + "-" + memberPhone2 + "-" + memberPhone3;
		String memberEmail1 = request.getParameter("memberEmail1");
		String memberZoneCode = request.getParameter("memberZoneCode");
		String memberAddress1 = request.getParameter("memberAddress1");
		String memberAddress2 = request.getParameter("memberAddress2");
		
		String memberAddress = memberZoneCode + "/" + memberAddress1 + "/" + memberAddress2;
		
		Member requestMember = new Member();
		
		requestMember.setMemberNo(memberNo);
		requestMember.setMemberId(memberId);
		requestMember.setMemberName(memberName);
		requestMember.setMemberPhone(memberPhone);
		requestMember.setMemberEmail(memberEmail1);
		requestMember.setMemberAddress(memberAddress);
		log.debug(requestMember);
		
		int result = new MemberService().updateMemberNP(requestMember);
		
		if(result > 0) {
			Member resultMember = new MemberService().selectOne(memberId);
			request.setAttribute("msg", "successMember");
			request.getRequestDispatcher("views/myPage/memberChange/memberInfoChange.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "failMember");
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
