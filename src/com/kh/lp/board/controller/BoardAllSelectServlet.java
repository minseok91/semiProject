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


/**
 * Servlet implementation class BoardAllSelectServlet
 */
@WebServlet("/BoardAllSelect.bo")
public class BoardAllSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardAllSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		// DB에서 자유게시판 읽어서 ArrayList에 담는 메소드 자유,문의,리뷰,FAQ
		ArrayList<HashMap<String,Object>> free = new BoardService().selectTypeBoard("BT1");
		ArrayList<HashMap<String,Object>> question = new BoardService().selectTypeBoard("BT2");
		ArrayList<HashMap<String,Object>> review = new BoardService().selectTypeBoard("BT3");
		ArrayList<HashMap<String,Object>> FAQ = new BoardService().selectTypeBoard("BT4");
		ArrayList<Object> AllList = new ArrayList<>();
		AllList.add(free);
		AllList.add(question);
		AllList.add(review);
		AllList.add(FAQ);
		
		String Page = "";
		if(free != null) {
		Page = "views/board/Board.jsp";
		request.setAttribute("AllList", AllList);
		}	
		request.getRequestDispatcher(Page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
