package com.kh.lp.shipment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.common.PageInfo;
import com.kh.lp.shipment.model.service.ShipmentService;
import com.kh.lp.shipment.model.vo.Shipment;

/**
 * Servlet implementation class ShipmentSelectAllServlet
 */
@WebServlet("/selectAll.sm")
public class ShipmentSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShipmentSelectAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int maxPage;
		int endPage;
		int startPage;
		int limit;
		int listCount;
		
		currentPage = 1;
		limit = 10;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		listCount = new ShipmentService().listCount();
		
		maxPage = (int)((double) listCount/ limit + 0.9);
		System.out.println("maxPage :" + maxPage );
		startPage = (((int)((double)currentPage/ limit +0.9)) -1) * 10 + 1;
		endPage = startPage + 10 - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		
		PageInfo pi = new PageInfo(currentPage, limit, startPage, endPage , maxPage, listCount);
		
		ArrayList<Shipment> list = new ShipmentService().smPaging(currentPage, limit);
		
		String page = "";
		if(list != null) {
			page = "views/admin/delivery/deliveryList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "";
			request.setAttribute("msg", "배송 에러 페이지 ");
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
