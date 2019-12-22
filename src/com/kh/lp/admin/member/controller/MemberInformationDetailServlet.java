package com.kh.lp.admin.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.member.model.service.MemberService;
import com.kh.lp.admin.report.model.service.ReportService;
/*import com.kh.lp.member.model.service.purchaseHistoryService;
import com.kh.lp.member.model.service.salesHistoryService;*/ //구매이력 판매이력  아직 미 구성
import com.kh.lp.member.model.vo.Member;
import com.kh.lp.money.model.service.MoneyService;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class userInformationDetailServlet
 */
@Log4j2
@WebServlet("/memberInfoDetail.me")
public class MemberInformationDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInformationDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		Member user = new MemberService().selectOne(memberNo);
		/* 판매 상품, 구매상품 조회 할 수 없어서 주석 처리함
		 * int salesHistoryCount = new MemberService().selectsalesHistoryCount();
		 * 
		 * int salesCount = new salesHistoryService().listCount(userId); 
		 * 
		 */
		log.debug(memberNo);
		//구매상품 갯수 조회
		int purchaseCount = new MoneyService().purchaseCount(memberNo);
		
		int salesCount = new MoneyService().salesCount(memberNo); 
		
		//신고 이력 갯수 조회
		int resportCount = new ReportService().listReportCount(memberId);
		 
		 ArrayList<Object> list = new ArrayList<>();
		 
		 list.add(user);
		 list.add(purchaseCount);
		 list.add(resportCount);
		 list.add(salesCount);
		 
		 log.debug(salesCount);
		
		String page = "";
		if(user != null) {
			page = "views/admin/Member/member/admin_memberDetailPage.jsp";
			request.setAttribute("userInfo","1");
			request.setAttribute("list", list);
		} else {
			
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
