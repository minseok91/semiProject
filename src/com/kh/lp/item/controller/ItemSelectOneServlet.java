package com.kh.lp.item.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.item.model.service.ItemService;
import com.kh.lp.item.model.vo.Item;

/**
 * Servlet implementation class ItemSelectOneServlet
 */
@WebServlet("/selectOne.it")
public class ItemSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemId = request.getParameter("itemId");
		
		Item item = new ItemService().selectOne(itemId);
		
		String page = "";
		if(item != null) {
			page = "views/admin/Auction/appRequestDetail.jsp";
			request.setAttribute("item", item);
			
		} else {
			request.setAttribute("msg", "셀렉트원 실패 ");
			page = "";
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
