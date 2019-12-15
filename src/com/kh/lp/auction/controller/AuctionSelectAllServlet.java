package com.kh.lp.auction.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.appraisal.model.service.AppraisalService;
import com.kh.lp.appraisal.model.vo.AppCom;
import com.kh.lp.auction.model.service.AuctionService;
import com.kh.lp.auction.model.vo.Auction;
import com.kh.lp.common.PageInfo;

/**
 * Servlet implementation class AuctionSelectAllServlet
 */
@WebServlet("/selectAll.au")
public class AuctionSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuctionSelectAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int maxPage;
		int startPage;
		int endPage;
		int listCount;
		int limit;
		
		currentPage = 1;
		limit = 10;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		listCount = new AuctionService().listCount();
		
		maxPage = (int)((double) listCount/ limit + 0.9);
		System.out.println("maxPage :" + maxPage );
		startPage = (((int)((double)currentPage/ limit +0.9)) -1) * 10 + 1;
		endPage = startPage + 10 - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		
		PageInfo pi = new PageInfo(currentPage, limit, startPage, endPage , maxPage, listCount);
		System.out.println("pi : "+ pi);
		
		
		
		
		ArrayList<Auction> list = new AuctionService().AuPaging(currentPage, limit);
		
		String page = "";
		if(list != null) {
			page = "views/admin/itemAuc.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "";
			request.setAttribute("msg", "경매 페이징 실패 !");
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
