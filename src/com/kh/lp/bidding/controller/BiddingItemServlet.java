package com.kh.lp.bidding.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.bidding.model.service.BidService;
import com.kh.lp.bidding.model.vo.Bid;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class BiddingItemServlet
 */
@Log4j2
@WebServlet("/bidding.bi")
// 입찰하기(BIDDING_HISTORY에 넣음)
public class BiddingItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BiddingItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int auctionId = Integer.parseInt(request.getParameter("auctionId"));
		int bidPrice = Integer.parseInt(request.getParameter("bidPrice"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		log.debug(auctionId);
		log.debug(bidPrice);
		log.debug(memberNo);
		
		Bid b = new Bid();
		b.setBidAuctionId(auctionId);
		b.setBidPrice(bidPrice);
		b.setBidMemberNo(memberNo);
		
		int result = new BidService().insertBidding(b); // 0이라면 입찰불가능하다는걸 알림
		
		String page
		
		if(result > 0) { // 데이터 삽입됨
			
		} else { // 횟수제한에 걸림 -> 데이터 삽입되지않음
			
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
