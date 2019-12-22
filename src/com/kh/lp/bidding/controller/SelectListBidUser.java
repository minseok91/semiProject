package com.kh.lp.bidding.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.bidding.model.service.BidService;
import com.kh.lp.bidding.model.vo.Bid;
import com.kh.lp.win.model.vo.Win;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class SelectListBidUser
 */
@Log4j2
@WebServlet("/selectBidUser.se")
public class SelectListBidUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectListBidUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int auctionId = Integer.parseInt(request.getParameter("auctionId")); // 경매번호
		ArrayList<Bid> bidList = new BidService().selectListBidUser(auctionId);
//		log.debug(bidList);
//		String msg = "";
//		
//		if(bidList != null) {
//			request.setAttribute("bidList", bidList);
//		} else {
//			msg = "입찰한 회원이 아직 없습니다.";
//			request.setAttribute("msg", msg);
//		}
		
		String msg = "";
		
		PrintWriter out = response.getWriter();
		
		if(bidList != null) {
			for(int n = 0; n < bidList.size(); n++) {
				Bid b = bidList.get(n);
				if(n == bidList.size() - 1)
					msg += b.getBidUserId() + "::" + b.getBidPrice() + "::" + b.getBidInsertTime() + "::" + b.getBidMemberNo();
				else 
					msg += b.getBidUserId() + "::" + b.getBidPrice() + "::" + b.getBidInsertTime() + "::" + b.getBidMemberNo() + "#";
			}
			log.debug(msg);
			out.append(msg);
		} else {
			log.debug("실패");
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
