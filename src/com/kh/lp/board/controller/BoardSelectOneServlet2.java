package com.kh.lp.board.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.board.model.service.BoardService;

/**
 * Servlet implementation class BoardSelectOneServlet2
 */
@WebServlet("/BoardSelectOne2")
public class BoardSelectOneServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectOneServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		HashMap<String, Object> list = new BoardService().selectBoardOne(boardId);
		
		System.out.println(list);
		
		String page = "";
		if(list != null) {
			page = "views/board/BoardDetail.jsp";
			request.setAttribute("list", list);
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
