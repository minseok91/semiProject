package com.kh.lp.admin.member.controller;

import java.io.IOException;

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

/**
 * Servlet implementation class userInformationDetailServlet
 */
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
		String userId = request.getParameter("userId");
		
		Member user = new MemberService().selectOne(userId);
		/* 판매 상품, 구매상품 조회 할 수 없어서 주석 처리함
		 * int salesHistoryCount = new MemberService().selectsalesHistoryCount();
		 * 
		 * int salesCount = new salesHistoryService().listCount(userId); int
		 * purchaseCount = new purchaseHistoryService().listPurchase(userId);
		 */
		 int resportCount = new ReportService().listReportCount(userId);
		 
		// user.setSaleshistory(salesCount); 
		//user.setPurchasehistory(purchaseCount) ;
		String page = "";
		if(user != null) {
			page = "views/admin/Member/member/admin_memberDetailPage.jsp";
			request.setAttribute("user", user);
			request.setAttribute("userInfo","1");
			request.setAttribute("resportCount", resportCount);
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
