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
 * Servlet implementation class BagSixListServlet
 */
@WebServlet("/bagsix.se")
@Log4j2
public class BagSixListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BagSixListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 제일 최신의 가방상품 6개
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Bid> bagList = new BidService().latelyBag(); // 최근올라온 가방상품6개
		
		String msgBag = "";
		
		PrintWriter out = response.getWriter();
		
		if(bagList != null) {
			for(int n = 0; n < bagList.size(); n++) {
				Bid b = bagList.get(n);
				if(n == bagList.size() - 1)
					msgBag += b.getBidAuctionId() + "::" + b.getBidId() + "::" + b.getBidPrice() + "::" 			// 경매번호, 입찰번호, 최고입찰가
					+ b.getBidAttachment() + "::" + b.getBidBrand() + "::" + b.getBidModel() + "::" 	// 사진이름, 브랜드명, 모델명
					+ b.getBidAuctionStartTime() + "::" + b.getBidAuctionPeriod();						// 경매시작시간, 경매기간(당장은 시작날짜로 보여지게 함)
				else 
					msgBag += b.getBidAuctionId() + "::" + b.getBidId() + "::" + b.getBidPrice() + "::" 			// 경매번호, 입찰번호, 최고입찰가
					+ b.getBidAttachment() + "::" + b.getBidBrand() + "::" + b.getBidModel() + "::" 	// 사진이름, 브랜드명, 모델명
					+ b.getBidAuctionStartTime() + "::" + b.getBidAuctionPeriod() + "#";
			}
			out.append(msgBag);
			log.debug(msgBag);
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
