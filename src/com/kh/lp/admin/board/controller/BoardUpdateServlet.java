package com.kh.lp.admin.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.board.model.service.BoardService;
import com.kh.lp.admin.board.model.vo.Board;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/updateBoard.bo")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		System.out.println("update서블릿 : "+boardId);
		String title = request.getParameter("title");
		String type = request.getParameter("category");
		String content = request.getParameter("content");
		int memberNo = 0;

		if(request.getParameter("memberNo") != null) {
			memberNo = Integer.parseInt(request.getParameter("memberNo"));
		}

		System.out.println("게시판 번호"+boardId);

		System.out.println("회원 버호"+memberNo);
		System.out.println(title);

		switch(type) {
		case "자유 게시판" : type = "BT1"; break;
		case "문의 게시판" : type = "BT2"; break;
		case "리뷰 게시판" : type = "BT3"; break;
		case "FAQ 게시판" : type = "BT4"; break;
		}
		Board b = new Board();
		b.setBoardId(boardId);
		b.setBoardType(type);
		b.setBoardTitle(title);
		b.setBoardMemberNo(memberNo);
		b.setBoardContent(content);


		int updateBoard = new BoardService().updateBoard(b);

		String page = ""; 
		if(updateBoard > 0) { 
			page = "BoardSelectOne2?boardId="+boardId;
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
