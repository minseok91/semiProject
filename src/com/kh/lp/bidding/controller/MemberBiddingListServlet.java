package com.kh.lp.bidding.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.qnaAndReport.model.service.QNAService;
import com.kh.lp.admin.qnaAndReport.model.vo.QNA;
import com.kh.lp.member.model.vo.Member;

@WebServlet("/biddingList.bi.jsp")
public class MemberBiddingListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberBiddingListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//로그인돼있는 회원 Member객체에 담고 회원번호 int변수에 담아두기
		Member loginMember = (Member)(request.getSession().getAttribute("loginMember"));
		int loginMemberNo = loginMember.getMemberNo();




		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

















































