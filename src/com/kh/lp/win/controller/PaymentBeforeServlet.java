package com.kh.lp.win.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class paymentBefore
 */
@Log4j2
@WebServlet("/paymentBefore.pay")
public class PaymentBeforeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentBeforeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String auctionId = request.getParameter("auctionId");
		String image = request.getParameter("image");
		String price = request.getParameter("price");
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		
		String page = "views/goods/paymentBefore.jsp";
		
		request.setAttribute("auctionId", auctionId);
		request.setAttribute("image", image);
		request.setAttribute("price", price);
		request.setAttribute("brand", brand);
		request.setAttribute("model", model);
		
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
