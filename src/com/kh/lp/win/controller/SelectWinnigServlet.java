package com.kh.lp.win.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.appraisal.model.vo.AR1;
import com.kh.lp.common.Attachment;
import com.kh.lp.win.model.service.WinService;
import com.kh.lp.win.model.vo.Win;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class selectWinnig
 */
@Log4j2
@WebServlet("/selectWin.wi")
public class SelectWinnigServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectWinnigServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 낙찰리스트 불러오기 테스트
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		log.debug(memberNo);
		
		ArrayList<Win> list = new WinService().selectListTest(memberNo);
		log.debug(list);
		
		String msg = "";
		
		PrintWriter out = response.getWriter();
		
		if(list != null) {
			for(int n = 0; n < list.size(); n++) {
				Win w = list.get(n);
				if(n == list.size() - 1)
					msg += w.getWinAuctionId() + "::" + w.getWinMemberNo() + "::" + w.getWinPrice()
						+ "::" + w.getWinSecondMemberNo() + "::" + w.getWinsecondPrice() + "::" + w.getWinStatus()
						+ "::" + w.getAttRename() + "::" + w.getWinDate() + "::" + w.getWinBrand() + "::" + w.getWinModel();
				else 
					msg += w.getWinAuctionId() + "::" + w.getWinMemberNo() + "::" + w.getWinPrice()
						+ "::" + w.getWinSecondMemberNo() + "::" + w.getWinsecondPrice() + "::" + w.getWinStatus()
						+ "::" + w.getAttRename() + "::" + w.getWinDate() + "::" + w.getWinBrand() + "::" + w.getWinModel() + "#";
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
