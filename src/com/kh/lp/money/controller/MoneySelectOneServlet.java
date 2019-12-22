package com.kh.lp.money.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.money.model.service.MoneyService;
import com.kh.lp.money.model.vo.MoneyDetail;

/**
 * Servlet implementation class MoneySelectOneServlet
 */
@WebServlet("/selectOne.mo")
public class MoneySelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoneySelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int auctionId = Integer.parseInt(request.getParameter("auctionId"));
		
		MoneyDetail md = new MoneyService().getMoneyDetail(auctionId);
		
		String page = "";
		if(md != null) {
			page = "views/goods/paymentAfter.jsp";
			request.setAttribute("md", md);
		} else {
			
		}
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
