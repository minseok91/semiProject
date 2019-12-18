package com.kh.lp.bidding.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.bidding.model.service.BidService;
import com.kh.lp.bidding.model.vo.BiddingList;
import com.kh.lp.member.model.vo.Member;


/**
 * @Author         : 오수민
 * @CreateDate    : 2019. 12. 18
 * @ModifyDate    : 2019. 12. 18
 * @Description   : 유저페이지 > 마이페이지 > 구매정보 > 입찰리스트에 유저의 경매상품 입찰 목록 띄우는 써블렛
 * @param
 * @return
 */


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

		
		//로그인돼있는 회원이 지금까지 입찰한 BIDDING_AUCTION_ID 불러다가 저장할 int ArrayList 객체 생성
		ArrayList<Integer> memberBiddingAuctionIds = new BidService().getBiddingAuctionIds(loginMemberNo);

		//받아온 memberBiddingIds에 해당하는 입찰리스트 저장할 ArrayList<biddingList>객체 생성
		ArrayList<BiddingList> memberBiddingList = new BidService().getBiddingList(loginMemberNo, memberBiddingAuctionIds);
		
		//memberBiddingList 목록 각각 loginMemberNo로 biddingMemberNo 입력
		for(int i=0; i<memberBiddingList.size(); i++) {
			memberBiddingList.get(i).setBiddingMemberNo(loginMemberNo);
		}
		
		
		String page = "";
		
		if(memberBiddingList != null) {
			page = "views/myPage/buy/biddingList.jsp";
			request.setAttribute("memberBiddingList", memberBiddingList);
		}/*else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "마이페이지 입찰리스트 불러오기 실패");
		}*/
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

















































