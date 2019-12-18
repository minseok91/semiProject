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
import com.kh.lp.common.Attachment;
import com.kh.lp.item.model.vo.Item;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class AuctionDoSelectServlet
 */
@Log4j2
@WebServlet("/selectDoAuction.au")
public class AuctionDoSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuctionDoSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		ArrayList<ArrayList<Object>> list = new AuctionService().doAuction(memberNo);
		PrintWriter out = response.getWriter();
		String msg = "";
		if(list != null) {
			for(int n = 0; n < list.size(); n++) {
				log.debug(list.size());
				Item i = (Item) list.get(n).get(0);
				Attachment at = (Attachment) list.get(n).get(1);
				Auction au = (Auction) list.get(n).get(2);
				
				if(n == list.size() - 1) {
					msg += au.getAuctionId() + "::" + at.getAttachmentRename() + "::" + i.getItemBrandModel() + "::" + au.getAuctionStartPrice() + "::" + au.getAuctionDoPrice() + "::" + au.getAuctionBiddingCount() + "::" + au.getEndTime();
				} else {
					msg += au.getAuctionId() + "::" + at.getAttachmentRename() + "::" + i.getItemBrandModel() + "::" + au.getAuctionStartPrice() + "::" + au.getAuctionDoPrice() + "::" + au.getAuctionBiddingCount() + "::" + au.getEndTime() + "#";
				}
			}
			out.append(msg);
		} else {
			log.debug("진행경매불러오기실패");
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
