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

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class WatchSixListServlet
 */
@WebServlet("/watchsix.se")
@Log4j2
public class WatchSixListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WatchSixListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 제일 최신의 시계상품6개
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Bid> watchList = new BidService().latelyWatch(); // 최근올라온 시계상품6개
		
		String msgWatch = "";
		
		PrintWriter out = response.getWriter();
		
		if(watchList != null) {
			for(int n = 0; n < watchList.size(); n++) {
				Bid w = watchList.get(n);
				if(n == watchList.size() - 1)
					msgWatch += w.getBidAuctionId() + "::" + w.getBidId() + "::" + w.getBidPrice() + "::" 			// 경매번호, 입찰번호, 최고입찰가
							+ w.getBidAttachment() + "::" + w.getBidBrand() + "::" + w.getBidModel() + "::" 	// 사진이름, 브랜드명, 모델명
							+ w.getBidAuctionStartTime() + "::" + w.getBidAuctionPeriod();						// 경매시작시간, 경매기간(당장은 시작날짜로 보여지게 함)
				else 
					msgWatch += w.getBidAuctionId() + "::" + w.getBidId() + "::" + w.getBidPrice() + "::" 			// 경매번호, 입찰번호, 최고입찰가
					+ w.getBidAttachment() + "::" + w.getBidBrand() + "::" + w.getBidModel() + "::" 			// 사진이름, 브랜드명, 모델명
					+ w.getBidAuctionStartTime() + "::" + w.getBidAuctionPeriod() + "#";						// 경매시작시간, 경매기간(당장은 시작날짜로 보여지게 함)
			}
			out.append(msgWatch);
			log.debug(msgWatch);
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
