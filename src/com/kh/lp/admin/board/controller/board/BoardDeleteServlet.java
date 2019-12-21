package com.kh.lp.admin.board.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.board.model.service.BoardService;


/**
 * Servlet implementation class BoardDeleteServlet
 * 안동환
 * 게시판 삭제
 */
@WebServlet("/deleteBoard.bo")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		String type = request.getParameter("type");
		String pageaddress = request.getParameter("pageaddress");
		
		System.out.println("게시판 삭제 servlet : " + boardId);
		int result = new BoardService().deleteBoard(boardId); 
		String page = ""; 
		if(result > 0) { 
			//타입을 구분하여 삭제후 해당 게시판으로 이동한다.
			if(pageaddress.equals(null)) {
				if(type.equals("BT4")) {
					page = "selectFAQ.bo";
				} else {
					page = "selectAll.bo";
				}
			} else if(pageaddress.equals("BT1")) {
				page = "BoardAllSelect.bo";
			}
			response.sendRedirect(page);
		} else { 
			request.setAttribute("msg","삭제 실패 !");
			request.getRequestDispatcher(page).forward(request, response); }
		}

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}

	}
