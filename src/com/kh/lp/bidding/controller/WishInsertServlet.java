package com.kh.lp.bidding.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
@WebServlet("/wish.in")
// 위시리스트 넣기(BIDDING_HISTORY에 넣음)
public class WishInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int auctionId = Integer.parseInt(request.getParameter("auctionId"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		log.debug(auctionId);
		log.debug(memberNo);
		
		Bid b = new Bid();
		b.setBidAuctionId(auctionId);
		b.setBidMemberNo(memberNo);
		String yh = "";
		
		String result = new BidService().insertWish(b);
		
		String msg = "";
		
		PrintWriter out = response.getWriter();
		
		if(result.charAt(0) != 0 && result.charAt(1) == 'Y') {
			msg = "successWishY";
			log.debug(msg);
			out.append(msg);
		} else if(result.charAt(0) != 0 && result.charAt(1) == 'N') {
			msg = "successWishN";
			log.debug(msg);
			out.append(msg);
		} else {
			msg = "fail";
			log.debug(msg);
			out.append(msg);
		}
		
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
