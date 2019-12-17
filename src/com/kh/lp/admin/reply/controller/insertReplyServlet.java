package com.kh.lp.admin.reply.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.lp.admin.reply.model.service.ReplyService;
import com.kh.lp.admin.reply.model.vo.Reply;

/**
 * Servlet implementation class insertReplyServlet
 */
@WebServlet("/insertReply.re")
public class insertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		int memberId = Integer.parseInt(request.getParameter("memberId"));
		String comment = request.getParameter("comment");
		
		
		
		int inserReply = new ReplyService().inserReply(boardId, comment, memberId);
		ArrayList<Reply> list = new ReplyService().selectAll(boardId);
		Reply r = list.get(list.size()-1);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(r, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
