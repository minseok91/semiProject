package com.kh.lp.admin.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.board.model.service.BoardService;
import com.kh.lp.admin.board.model.vo.Board;
import com.kh.lp.admin.reply.model.service.ReplyService;
import com.kh.lp.admin.reply.model.vo.Reply;

/**
 * Servlet implementation class BoardFAQDetailServlet
 */
@WebServlet("/boardFAQDetail.bo")
public class BoardFAQDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFAQDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		String MemberName = request.getParameter("MemberName");
		
		Board list = new BoardService().selectOne(boardId);
		System.out.println(list);
		String page = "";
		if(list != null) {
			page = "views/admin/admin_FQAUpdatePage.jsp";
			list.setBoardMemberName(MemberName);
			request.setAttribute("list", list);
		} else {
			page = "common/errorPage.jsp";
			request.setAttribute("msg", "상세보기 실패 !");
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
