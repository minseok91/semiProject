package com.kh.lp.admin.board.controller.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.lp.admin.board.model.service.BoardService;
import com.kh.lp.admin.reply.model.service.ReplyService;
import com.kh.lp.admin.reply.model.vo.Reply;

/**
 * Servlet implementation class BoardDeleteReplyServlet
 */
@WebServlet("/BoardDeleteReply.bo")
public class BoardDeleteReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardReply = Integer.parseInt(request.getParameter("replyId"));
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		int deleteBoardReply = new ReplyService().deleteBoardReply(boardReply);
		
		ArrayList<Reply> list = new ReplyService().selectAll(boardId);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
