package com.kh.lp.admin.qnaAndReport.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.qnaAndReport.model.service.QNAService;
import com.kh.lp.admin.qnaAndReport.model.vo.QNA;
import com.kh.lp.common.PageInfo;
import com.kh.lp.member.model.vo.Member;

/**
 * @Author         : 오수민
 * @CreateDate    : 2019. 12. 18
 * @ModifyDate    : 2019. 12. 18
 * @Description   :  유저페이지 > 마이페이지 > 문의및신고 > 문의내역에서 유저 문의 리스트 띄우는 서블렛
 * @param
 * @return
 */

@WebServlet("/qnaList.qr.jsp")
public class QNAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QNAListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//로그인돼있는 회원 Member객체에 담기
		Member loginMember = (Member)(request.getSession().getAttribute("loginMember"));
		int loginMemberNo = loginMember.getMemberNo();
		
		
		
		//----------------------------------------------페이징 처리 로직------------------------------------------------
		//페이징 처리를 위한 변수들 선언
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		//현재페이지 1로 초기화 (아무것도 클릭 안했을땐 1페이지여야 하므로)
		currentPage = 1;
		
		//웹페이지에서 다른 페이지 번호를 클릭했을 경우 parameter로 넘어간 currentPage value를 받아서 currentPage 변수에 담음
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
		//한 페이지 리스트 갯수는 10개로 제한
		limit = 10;
		
		//현재 로그인된 회원의 전체 문의 리스트 갯수 가져오는 service메소드 불러오기
		int listCount = new QNAService().memberQnaCount(loginMemberNo);
		
		//총 페이징 갯수 계산(=맨마지막페이지)
		maxPage = (int)((double)listCount/limit+0.9);
		//현재 페이지에 따른 페이징시작번호 및 페이징끝번호 (ex. 현재페이지:4, 페이징시작번호:1, 페이징끝번호:5)
		startPage = (int)(((double)currentPage/5+0.8)-1)*5 + 1;
		endPage = startPage + 5 -1;
		//페이징 끝번호가 마지막페이지번호 이상일 땐 페이징 끝번호 = 마지막페이지번호
		if(endPage >= maxPage) {
			endPage = maxPage;
		}
		
		//PageInfo 객체에 페이지 정보 저장
		PageInfo pInfo = new PageInfo(currentPage, limit, startPage,endPage ,maxPage, listCount);
		
		//-------------------------------------------------------------------------------------------------------
		
		
		
		
		//해당 페이지에 들어갈  리스트 10개를 담아올 서비스 메소드 호출
		ArrayList<QNA> memberQnaList = new QNAService().memberQnaList(loginMemberNo, currentPage, limit);
		
		
		
		String page = "";
		
		if(memberQnaList != null) {
			page = "views/myPage/queAndReport/questionList.jsp";
			request.setAttribute("memberQnaList", memberQnaList);
			request.setAttribute("pInfo", pInfo);
		} else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "내 문의내역 불러오기 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}














































