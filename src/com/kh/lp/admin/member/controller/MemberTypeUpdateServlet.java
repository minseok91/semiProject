package com.kh.lp.admin.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.member.model.service.MemberService;
import com.kh.lp.admin.member.model.vo.MemberHistory;


/**
 * Servlet implementation class userReleaseServlet
 */
@WebServlet("/memberTypeUpdate.me")
public class MemberTypeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberTypeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userid");
		int MemberNo = Integer.parseInt(request.getParameter("MemberNo"));
		String type = request.getParameter("type");
		String text = request.getParameter("text");
		String status = request.getParameter("status");
		
		MemberHistory memberHistory = new MemberHistory();
		memberHistory.setMemberNo(MemberNo);
		memberHistory.setMemberHistoryType(type);
		memberHistory.setMemberHistoryDetail(text);
		
		
		  int result = new MemberService().typeUpdate(MemberNo,type); 
		  int historyUpdate =0; 
		  
		  if(result > 0) {
		  
		  historyUpdate = new MemberService().historyUpdate(memberHistory);
		 
		 }
		 
		 
		System.out.println("ser"+userId);
		
		String page = "";
		
		  if(historyUpdate > 0) { 
			  
			  if(status == null) {
				  page = "blackList.me"; 
			  } else {
				  page = "QNASelect.qr"; 
			  }
			  
		  } else {
			  // 회원 타입변경 히스토리 저장 실패
		  }
		 
		response.sendRedirect(page);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
