package com.kh.lp.bidding.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.bidding.model.service.BidService;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class WishStatusServlet
 */
@WebServlet("/wishstatus.se")
@Log4j2
public class WishStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 특정상품에 대한 위시등록 확인
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int auctionId = Integer.parseInt(request.getParameter("auctionId"));
		
		String result = new BidService().wishStatus(memberNo, auctionId);
		
		log.debug(result);
		
		PrintWriter out = response.getWriter();
		
		if(result.equals(""))
			result = "null";
		
		out.append(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
