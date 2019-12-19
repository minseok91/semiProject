package com.kh.lp.bidding.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.bidding.model.service.BidService;
import com.kh.lp.bidding.model.vo.Bid;

/**
 * Servlet implementation class SelectWatchAndBag
 */
@WebServlet("/main.se")
public class SelectWatchAndBag extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectWatchAndBag() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 최근올라온 시계와 가방을 보여줌 -> index전용
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Bid> watchList = new BidService().latelyWatch();
		ArrayList<Bid> bagList = new BidService().latelyBag();
		
		String page = "";
		
		if(watchList != null && bagList != null) {
			page = "views/main/main.jsp";
			request.setAttribute("watchList", watchList);
			request.setAttribute("bagList", bagList);
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
