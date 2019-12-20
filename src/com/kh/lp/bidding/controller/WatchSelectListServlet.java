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
import com.kh.lp.common.PageInfo;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class watchSelectList
 */
@Log4j2
@WebServlet("/watchList.wa")
public class WatchSelectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WatchSelectListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int currentPage;
		int limit;
		int startPage;
		int endPage;
		int maxPage;
		int listCount;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		listCount = new BidService().listCount();
		log.debug(listCount);
		limit = 10;

		maxPage = (int)((double) listCount/ limit + 0.9);

		startPage = (int)(((double)currentPage/limit+0.9)-1)*10 + 1;
		endPage = startPage + 10 - 1;
		if(maxPage <= endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, startPage, endPage , maxPage, listCount);
		
		ArrayList<Bid> list = new BidService().watchSelectList(currentPage,limit); // 페이징버전
		
		log.debug(list);
		
		String page = "";
		if(list != null) {
			page = "views/goods/watchList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "common/errorPage.jsp";
			request.setAttribute("msg", "페이징 보드 실패 !");
		}
		request.getRequestDispatcher(page).forward(request,response);
		
//		ArrayList<Bid> list = new BidService().watchSelectList();
//		
//		String page = "";
//		
//		if(list != null) {
//			page="views/goods/watchList.jsp";
//			request.setAttribute("list", list);
//		} else {
//			page="views/common/errorPage.jsp";
//			request.setAttribute("msg", "잘못된 경로로 접근했습니다.");
//		}
//		
//		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
