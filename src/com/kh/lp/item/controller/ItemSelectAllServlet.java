package com.kh.lp.item.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.common.PageInfo;
import com.kh.lp.item.model.service.ItemService;
import com.kh.lp.item.model.vo.Item;

/**
 * Servlet implementation class ItemSelectAllServlet
 */
@WebServlet("/selectAll.it")
public class ItemSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemSelectAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int currentPage;
		int maxPage;
		int startPage;
		int endPage;
		int limit;
		int listCount;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		listCount = new ItemService().listCount();
		limit = 10;
		
		System.out.println("lc : " + listCount);
		
		maxPage = (int)((double) listCount/ limit + 0.9);
		System.out.println("maxPage :" + maxPage );
		startPage = (((int)((double)currentPage/ limit +0.9)) -1) * 10 + 1;
		endPage = startPage + 10 - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, startPage, endPage , maxPage, listCount);
		System.out.println("pi : "+ pi);
		
		ArrayList<Item> list = new ItemService().ItemPaging(currentPage,limit);
		System.out.println("list :" + list);
		
		
		String page = "";
		if(list != null) {
			page = "views/admin/Goods/appRequest.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "common/errorPage.jsp";
			request.setAttribute("msg", "아이템 페이징 보드 실패 !");
		}
		request.getRequestDispatcher(page).forward(request,response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
