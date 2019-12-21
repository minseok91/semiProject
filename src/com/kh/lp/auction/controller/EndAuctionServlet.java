package com.kh.lp.auction.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.auction.model.service.AuctionService;
import com.kh.lp.auction.model.vo.Auction;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class EndAuctionServlet
 */
@Log4j2
@WebServlet("/endAuction.au")
public class EndAuctionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EndAuctionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int auctionId = Integer.parseInt(request.getParameter("auctionId"));
		String count = request.getParameter("biddingCount");
		String[] biddingCount = count.split("명");
		log.debug(auctionId);
		Auction requestAuction = new Auction();
		requestAuction.setAuctionId(auctionId);
		requestAuction.setAuctionBiddingCount(Integer.parseInt(biddingCount[0]));
		
		int result = new AuctionService().endAuction(requestAuction);
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.append("success");
		} else {
			out.append("fail");
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
