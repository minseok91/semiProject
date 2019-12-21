package com.kh.lp.bidding.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.appraisal.model.vo.Bag;
import com.kh.lp.bidding.model.service.BidService;
import com.kh.lp.bidding.model.vo.Bid;

/**
 * Servlet implementation class BagDetailServlet
 */
@WebServlet("/bagDetail.ba")
public class BagDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BagDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int auctionId = Integer.parseInt(request.getParameter("auctionId"));
		String img = request.getParameter("img");
		ArrayList<Bid> list = new BidService().selectItemDetail(auctionId);
		Bag bag = new BidService().selectBagInfo(auctionId);
		
		String page = "";
		
		if(list != null) {
			page = "views/goods/bagDetail.jsp";
			request.setAttribute("list", list);
			request.setAttribute("img", img);
			request.setAttribute("auctionId", auctionId);
			request.setAttribute("bag", bag);
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
