package com.kh.lp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.board.model.service.BoardService;
import com.kh.lp.board.model.vo.Board;

/**
 * Servlet implementation class BoardInsertServlet
 */
@WebServlet("/insert.bo")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		String writer = request.getParameter("writer");
		String date = request.getParameter("date");
		
		
		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("category : " + category);
		System.out.println("writer : " + writer);
		System.out.println("date : " + date);
		Board b = new Board();
		b.setbContent(content);
		b.setbTitle(title);
//		b.setbDate(date);
//		b.setbWriter(bWriter);
//		b.setCid(cid);
		
		//int result = new BoardService().insertBoard(b);
		
//		String page = "";
//		if(result > 0) {
//			response.sendRedirect(page);
//		} else {
//			request.setAttribute("msg", "인서트 실패 !");
//			request.getRequestDispatcher(page).forward(request, response);
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
