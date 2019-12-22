package com.kh.lp.bidding.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.appraisal.model.vo.Watch;
import com.kh.lp.auction.model.service.AuctionService;
import com.kh.lp.auction.model.vo.Auction;
import com.kh.lp.bidding.model.service.BidService;
import com.kh.lp.bidding.model.vo.Bid;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class watchDetail
 */
@WebServlet("/watchDetail.wa")
@Log4j2
public class WatchDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WatchDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int auctionId = Integer.parseInt(request.getParameter("auctionId")); // 경매번호
		String img = request.getParameter("img");
		ArrayList<Bid> list = new BidService().selectItemDetail(auctionId);
		Watch watch = new BidService().selectWatchInfo(auctionId);
		Auction ac = new AuctionService().selectAuctionOne(auctionId);
		String page = "";
		
		if(list != null) {
			page = "views/goods/watchDetail.jsp";
			request.setAttribute("list", list);
			request.setAttribute("img", img);
			request.setAttribute("auctionId", auctionId);
			request.setAttribute("watch", watch);
			request.setAttribute("auction", ac);
		} else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "잘못된 경로로 접근했습니다.");
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
