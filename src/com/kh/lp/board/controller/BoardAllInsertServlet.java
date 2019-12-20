package com.kh.lp.board.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.print.attribute.ResolutionSyntax;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.board.model.service.BoardService;

/**
 * Servlet implementation class BoardAllInsertServlet
 */
@WebServlet("/BoardAllInsert.bo")
public class BoardAllInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardAllInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String memberNo = request.getParameter("memberNo");
		String boardKinds = request.getParameter("boardKinds");
		String content = request.getParameter("content");
		
		HashMap<String, Object> list = new HashMap<>();
		
		list.put("title", title);
		list.put("memberNo", memberNo);
		list.put("boardKinds", boardKinds);
		list.put("content", content);
		
		//게시판 작성
		int insertBoard = new BoardService().insertBoard(list);
		
		String page = "";
		if(insertBoard > 0) {
			page = "BoardAllSelect.bo";
			request.setAttribute("insertBoard", insertBoard);
			response.sendRedirect(page);
		} else {
			
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
