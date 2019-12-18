package com.kh.lp.bidding.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.appraisal.controller.AppraisalSelectItemResultServlet;
import com.kh.lp.bidding.model.service.bidService;
import com.kh.lp.bidding.model.vo.Bid;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class watchDetail
 */
@WebServlet("/watchDetail.wa")
@Log4j2
public class watchDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public watchDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		ArrayList<Bid> list = new bidService().selectWatchDetail(num);
		ArrayList<Bid> bidList = new bidService().selectListBidUser(num);
		
		String page = "";
		
		if(list != null) {
			page = "views/goods/watchDetail.jsp";
			request.setAttribute("list", list);
			request.setAttribute("bidList", bidList);
		} else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "잘못된 경로로 접근했습니다.");
		}
		
		log.debug(list);
		log.debug(list.size());
		log.debug(bidList);
		log.debug(bidList.size());
		
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
