package com.kh.lp.admin.board.controller.FAQ;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.board.model.service.BoardService;
import com.kh.lp.admin.board.model.vo.Board;

/**
 * Servlet implementation class BoardFAQInsertServlet
 */
@WebServlet("/InsertFAQ.bo")
public class BoardFAQInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFAQInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Board b = new Board();
		b.setBoardTitle(title);
		b.setBoardMemberNo(1);
		b.setBoardType("BT4");
		b.setBoardContent(content);
		
		int insertFAQ = new BoardService().insertFAQ(b);
		
		String page = "";
		if(insertFAQ > 0) {
			page = "selectFAQ.bo";
			response.sendRedirect(page);
		} else {
			//실패 에러 페이지
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
