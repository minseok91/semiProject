package com.kh.lp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.member.model.vo.Member;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@Log4j2
@WebServlet("/updateMember.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
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
		String memberPhone1 = request.getParameter("memberPhone1");
		String memberPhone2 = request.getParameter("memberPhone2");
		String memberPhone3 = request.getParameter("memberPhone3");
		String memberPhone = memberPhone1 + "-" + memberPhone2 + "-" + memberPhone3;
		String memberEmail1 = request.getParameter("memberEmail1");
		String memberAddress = request.getParameter("memberAddress");
		
		Member requestMember = new Member();
		
		requestMember.setMemberId(memberId);
		requestMember.setMemberPwd(memberPwd);
		requestMember.setMemberName(memberName);
		requestMember.setMemberPhone(memberPhone);
		requestMember.setMemberEmail(memberEmail1);
		requestMember.setMemberAddress(memberAddress);
		log.debug(requestMember);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
