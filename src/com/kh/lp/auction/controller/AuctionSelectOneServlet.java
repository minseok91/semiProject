package com.kh.lp.auction.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.auction.model.service.AuctionService;

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
		
		String page = "";
		
		if(status.equals("1")) {
			System.out.println("여긴 1번");
			page = "/views/admin/Auction/admin_waitingForAuction.jsp";
			HashMap<String,Object> ac = new AuctionService().selectOne(appId);
			request.setAttribute("list", ac);
			System.out.println("ac :" + ac);
			System.out.println("attach : " + ac.get("attach"));
			System.out.println("auction :" + ac.get("auction"));
		} else if(status.equals("2")) {
			System.out.println("여긴 2번");
			page = "/views/admin/Auction/admin_autionNotRunning.jsp";
			HashMap<String,Object> ac = new AuctionService().selectOne(appId);
			request.setAttribute("list", ac);
		} else if(status.equals("3")) {
			System.out.println("여긴 3번");
			page = "/views/admin/Auction/AucBidding.jsp?";
			HashMap<String,Object> ac = new AuctionService().selectOne(appId);
			request.setAttribute("list", ac);
		} else if (status.equals("4")) {
			System.out.println("여긴 4번");
			page = "/views/admin/Auction/AucResultSuccess.jsp";
			HashMap<String,Object> ac = new AuctionService().selectOne(appId);
			request.setAttribute("list", ac);
		} else if(status.equals("5")) {
			System.out.println("여긴 5번");
			page = "/views/admin/Auction/AucResultFail.jsp";
			HashMap<String,Object> ac = new AuctionService().selectOne(appId);
			request.setAttribute("list", ac);
		} else if(status.equals("6")) {
			System.out.println("여긴 6번");
			page = "";
			HashMap<String,Object> ac = new AuctionService().selectOne(appId);
			request.setAttribute("list", ac);
		} else if(status.equals("7")) {
			System.out.println("여긴 7번");
			page = "/views/admin/Auction/AucAllResult.jsp";
			HashMap<String,Object> ac = new AuctionService().selectOne(appId);
			request.setAttribute("list", ac);
		}
		
		
//		if(ac != null) {
//			request.setAttribute("ac", ac);
//			page = "";
//		} else {
//			request.setAttribute("msg", "상세 보기 " + status + " 실패 !" );
//		}
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
