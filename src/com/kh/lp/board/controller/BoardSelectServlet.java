package com.kh.lp.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.board.model.service.BoardService;
import com.kh.lp.common.PageInfo;

/**
 * Servlet implementation class BoardSelectServlet
 */
@WebServlet("/BoardSelect.bo")
public class BoardSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		if(type == null) {
			type = request.getAttribute("type").toString();
		}
		
		System.out.println("검색하는 서블릿 : "+type);
		int currentPage;
		int limit;
		int startPage;
		int endPage;
		int maxPage;
		int listCount;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		listCount = new BoardService().listCount(type);
		limit = 10;
		maxPage = (int)((double) listCount/limit + 0.9);
		startPage = (int)(((double)currentPage/5+0.8)-1)*5 + 1;
		endPage = startPage + 5 - 1;
		if(maxPage <= endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, startPage, endPage , maxPage, listCount);
		String page = "";
		ArrayList<HashMap<String, Object>> list = new BoardService().selectBoard(currentPage,limit, type);
		
		if(list != null) {
			page = "views/board/BoardInBoard.jsp";
			request.setAttribute("list", list);
			request.setAttribute("type", type);
			request.setAttribute("pi", pi);
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
