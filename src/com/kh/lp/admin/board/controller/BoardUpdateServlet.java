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
		int memberId = Integer.parseInt(request.getParameter("boardId"));
		String title = request.getParameter("title");
		String type = request.getParameter("category");
		String content = request.getParameter("content");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		System.out.println("게시판 번호"+memberId);
		System.out.println(type);
		System.out.println("회원 버호"+memberNo);
		
		Board b = new Board();
		b.setBoardId(memberId);
		b.setBoardType(type);
		b.setBoardTitle(title);
		b.setBoardMemberNo(memberNo);
		b.setBoardContent(content);
		
		int updateBoard = new BoardService().updateBoard(b);
		
		String page = "";
		if(updateBoard > 0) {
			if(!b.getBoardType().equals("BT4")) {
				page = "selectAll.bo";
			} else {
				page = "selectFAQ.bo";
			}
				
			response.sendRedirect(page);
		} else {
			//에러 처리
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
