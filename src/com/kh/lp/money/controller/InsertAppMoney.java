package com.kh.lp.money.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.money.model.service.MoneyService;
import com.kh.lp.money.model.vo.Money;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class InsertAppMoney
 */
@Log4j2
@WebServlet("/appmoney.in")
public class InsertAppMoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAppMoney() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * 감정신청에 따른 결제정보 넣기
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String impId = (String) request.getParameter("impId");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String merId = (String) request.getParameter("merId");
		int amount = Integer.parseInt(request.getParameter("amount")); // 결제금액
		
		log.debug(impId);
		log.debug(memberNo);
		log.debug(merId);
		
		Money m = new Money();
		m.setImpId(impId);
		m.setMemberNo(memberNo);
		m.setMerId(merId);
		m.setAmount(amount);
		
		int result = new MoneyService().insertApp(m);
		
		log.debug(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
