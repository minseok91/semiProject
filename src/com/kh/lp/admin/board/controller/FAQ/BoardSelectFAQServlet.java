package com.kh.lp.admin.board.controller.FAQ;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.board.model.service.BoardService;
import com.kh.lp.admin.board.model.vo.Board;
import com.kh.lp.common.PageInfo;

/**
 * Servlet implementation class BoardSelectFAQServlet
 */
@WebServlet("/selectFAQ.bo")
public class BoardSelectFAQServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectFAQServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		listCount = new BoardService().FAQListCount();
		limit = 10;
		maxPage = (int)((double) listCount / limit + 0.9);
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * 10 + 1;
		endPage = startPage + 10 - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, startPage, endPage , maxPage, listCount);
		
		ArrayList<Board> list = new BoardService().selectFAQ(currentPage, limit);
	
		String page = "";
		if(list != null) {
			page = "views/admin/Board/FAQ/admin_FAQPage.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			
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
