package com.kh.lp.auction.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.auction.model.service.AuctionService;
import com.kh.lp.auction.model.vo.Auction;
import com.kh.lp.member.model.vo.Member;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class ServerSelectAllServlet
 */
@Log4j2
@WebServlet("/serverSelectAll")
public class ServerSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerSelectAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		ArrayList<ArrayList<Object>> list = new AuctionService().serverSelectList();
		String msg = "";
		PrintWriter out = response.getWriter();
		if(list != null) {
			log.debug(list.size());
			for(int n = 0; n < list.size(); n++) {
				Auction ac = (Auction) list.get(n).get(0);
				Member m = (Member) list.get(n).get(1);
				
				if(n == list.size() - 1) {
					msg += ac.getAuctionId() + "::" + m.getMemberId() + "::" + ac.getAuctionStartPrice() + "::" + ac.getAuctionPeriod();
				} else {
					msg += ac.getAuctionId() + "::" + m.getMemberId() + "::" + ac.getAuctionStartPrice() + "::" + ac.getAuctionPeriod() + "#";
				}
			}
			out.append(msg);
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
