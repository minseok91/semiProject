package com.kh.lp.test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class test
 */
@WebServlet("/test.t")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * paymentBefore에서 값받아오기 테스트
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String impId = request.getParameter("impId");
		String merId = request.getParameter("merId");
		String name = request.getParameter("name");
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		System.out.println("impId : "+impId);
		System.out.println("merId : "+merId);
		System.out.println("amount : "+amount);
		System.out.println("name : "+name);
		
		String page = "views/goods/paymentAfter.jsp";
		
		request.setAttribute("amount", amount);
		
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
