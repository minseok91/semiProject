package com.kh.lp.wishlist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.lp.auction.model.service.AuctionService;
import com.kh.lp.common.PageInfo;
import com.kh.lp.member.model.vo.Member;
import com.kh.lp.wishlist.model.service.WishListService;
import com.kh.lp.wishlist.model.vo.WishList;

/**
 * @Author         : 오수민
 * @CreateDate    : 2019. 12. 21
 * @ModifyDate    : 2019. 12. 21
 * @Description   :  유저페이지 > 마이페이지 > 구매정보 > 위시리스트에 유저 위시리스트 띄우는 서블렛
 * @param
 * @return
 */
@WebServlet("/wishList.wi.jsp")
public class WishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WishListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//로그인돼있는 회원 Member객체에 담기
		Member loginMember = (Member)(request.getSession().getAttribute("loginMember"));
		int loginMemberNo = loginMember.getMemberNo();
		
		

		//----------------------------------------------페이징 처리 로직------------------------------------------------//

		//페이징 처리를 위한 변수들 선언
		int currentPage;	//현재페이지 정보를 동적으로 담을 변수
		int limit;			//한 페이지에 띄울 목록 갯수
		int pagingSize =1;	//한번에 보여줄 페이징 갯수 (아래에서 pagingSize가 분모가되기때문에 0이 아닌수로 초기화)
		int maxPage;		//목록 갯수에 따른 맨 마지막 페이지 번호를 담을 변수
		int startPage;		//한번에 보여주는 페이지들 중 맨 처음 페이지 번호를 동적으로 담을 변수
		int endPage;		//한번에 보여주는 페이지들 중 맨 마지막 페이지 번호를 동적으로 담을 변수

		//현재페이지 1로 초기화 (아무것도 클릭 안했을땐 1페이지여야 하므로)
		currentPage = 1;

		//웹페이지에서 다른 페이지 번호를 클릭했을 경우 parameter로 넘어간 currentPage value를 받아서 currentPage 변수에 담음
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		//한 페이지 리스트 갯수는 10개로 제한
		limit = 12;

		//페이징은 한 번에 5개씩 보여주기
		pagingSize = 5;

		//현재 로그인된 회원의 위시리스트 갯수를 불러오는 메소드 소환
		int listCount = new WishListService().memberWishListCount(loginMemberNo);

		//총 페이징 갯수 계산(=맨 마지막 페이지 번호)
		maxPage = (int)((double)listCount/limit+0.9);

		//현재 페이지에 따른 페이징시작번호 및 페이징 끝번호 (ex. 현재페이지:4, 페이징시작번호:1, 페이징끝번호:5)
		double var = 1 - (1/pagingSize);//아래계산식에서 쓰일 변수
		startPage = (int)(((double)currentPage/pagingSize+var)-1)*pagingSize + 1;
		endPage = startPage + 5 -1;

		//페이징 끝번호가 마지막페이지번호 이상일 땐 페이징 끝번호 = 마지막페이지번호
		if(endPage >= maxPage) {
			endPage = maxPage;
		}
		
		
		System.out.println("listCount : " + listCount);
		System.out.println("maxPage : " + maxPage);


		//PageInfo 객체에 페이지 정보 저장
		PageInfo pInfo = new PageInfo(currentPage, limit, startPage,endPage ,maxPage, listCount);

		//--------------------------------------------------------------------------------------------------------//

		
		
		
		
		//검색 종류(전체/시계/가방)를 스트링 변수에 담기 (메뉴에서 눌렀을때 ajax없이 바로 들어오는 서블렛이므로 무조건 all)
		String selectedView = "all";
		
		
		//로그인되어있는 멤버의 위시리스트 중 view값(전체/시계/가방)에 해당하는 리스트를  담아올 서비스 메소드로 이동
		ArrayList<WishList> memberWishList = new WishListService().getMemberWishList(loginMemberNo, selectedView, currentPage, limit);
		System.out.println("memberWishList 정보 : " + memberWishList);
		
		
		String page = "";

		if(memberWishList != null) {
			page = "views/myPage/buy/wishList.jsp";
			request.setAttribute("memberWishList", memberWishList);
			request.setAttribute("pInfo", pInfo);
		} else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "내 위시리스트 불러오기 실패");
		}

		request.getRequestDispatcher(page).forward(request, response);
		
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}












































