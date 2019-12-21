package com.kh.lp.wishlist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
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
		
		
		//검색 종류(전체/시계/가방)를 스트링 변수에 담기
		String selected = request.getParameter("selected");
		String selectedView = "all";
		
		if(selected!=null) {
			switch(selected) {
			case "viewAll" : selectedView = "all"; break;
			case "viewWatches" : selectedView = "watch"; break;
			case "viewBags" : selectedView= "bag"; break;
			}
		}
		
		//로그인되어있는 멤버의 위시리스트 중 view값(전체/시계/가방)에 해당하는 리스트를  담아올 서비스 메소드로 이동
		ArrayList<WishList> memberWishList = new WishListService().getMemberWishList(loginMemberNo, selectedView);
		System.out.println("memberWishList 정보 : " + memberWishList);
		
		
		String page = "";

		if(memberWishList != null) {
			page = "views/myPage/buy/wishList.jsp";
			request.setAttribute("memberWishList", memberWishList);
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












































