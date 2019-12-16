package com.kh.lp.auction.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AuctionSelectOneServlet
 */
@WebServlet("/selectOne.au")
public class AuctionSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuctionSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String appId = request.getParameter("appId");
//		int count = Integer.parseInt(request.getParameter(""));
//		String type = request.getParameter("type");
		String status = request.getParameter("status");
		
		System.out.println("appId : " + appId);
//		System.out.println("count : " + count);
//		System.out.println("type : " + type);
		System.out.println("status : " + status);
		
		
		//Auction ac = new AuctionService().selectOne();
		
		String page = "";
//		if(ac != null) {
//			request.setAttribute("ac", ac);
//			page = "";
//		} else {
//			
//		}
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
