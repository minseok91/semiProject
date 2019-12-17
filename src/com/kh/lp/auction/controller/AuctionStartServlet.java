package com.kh.lp.auction.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.auction.model.service.AuctionService;
import com.kh.lp.auction.model.vo.Auction;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class AuctionStartServlet
 */
@Log4j2
@WebServlet("/startAuction.au")
public class AuctionStartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuctionStartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String auctionStartPrice = request.getParameter("itemStartPrice");
		String auctionPeriod = request.getParameter("auctionDay");
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		
		log.debug(itemId);
		log.debug(auctionStartPrice);
		log.debug(auctionPeriod);
		
		Auction requestAuction = new Auction();
		requestAuction.setAuctionAr1Id(itemId);
		requestAuction.setAuctionStartPrice(Integer.parseInt(auctionStartPrice));
		requestAuction.setAuctionPeriod(Integer.parseInt(auctionPeriod));
		
		int result = new AuctionService().startAuction(requestAuction);
		if(result > 0) {
			response.sendRedirect("views/common/successAuction.jsp");
		} else {
			request.setAttribute("msg", "failAuctionStart");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
