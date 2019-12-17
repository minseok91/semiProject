package com.kh.lp.admin.board.controller.board;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.board.model.service.BoardService;
import com.kh.lp.admin.board.model.vo.Board;

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
		
		
		int memberNo = new BoardService().selectMn(writer);
		Board b = new Board();
		b.setBoardContent(content);
		b.setBoardTitle(title);
		b.setBoardMemberNo(memberNo);
		b.setBoardType(category);
		
		int result = new BoardService().insertBoard(b);
		
		String page = "selectAll.bo";
		
		  if(result > 0) { 
			  response.sendRedirect(page); 
		  } else {
		  request.setAttribute("msg", "인서트 실패 !");
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
