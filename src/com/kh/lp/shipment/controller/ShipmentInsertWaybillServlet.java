package com.kh.lp.shipment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.shipment.model.service.ShipmentService;

/**
 * Servlet implementation class ShipmentInsertWaybillServlet
 */
@WebServlet("/insertWayBill.sm")
public class ShipmentInsertWaybillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShipmentInsertWaybillServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int waybill = Integer.parseInt(request.getParameter("waybill"));
		int memberShipmentId = Integer.parseInt(request.getParameter("memberShipmentId"));
		
		int result = new ShipmentService().insertWaybill(waybill , memberShipmentId );
		
		String page = "";
		if(result > 0) {
			page = "/lp/selectAll.sm";
			response.sendRedirect(page);
		} else {
			request.setAttribute("msg", "운송장 정보 입력 실패");
			page = "";
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
