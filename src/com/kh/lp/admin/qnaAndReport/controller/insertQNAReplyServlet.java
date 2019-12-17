package com.kh.lp.admin.qnaAndReport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.qnaAndReport.model.vo.QNA;
import com.kh.lp.admin.reply.model.service.ReplyService;

/**
 * Servlet implementation class insertQNAReplyServlet
 */
@WebServlet("/insertQNAReply.qr")
public class insertQNAReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertQNAReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int QNAId = Integer.parseInt(request.getParameter("boardId"));
		String comment = request.getParameter("comment");

		
		int result = new ReplyService().insertReply(QNAId, comment);
		
		QNA QNAReport = new ReplyService().selectQNAReply(QNAId);
		
		String page = "views/admin/admin_qnaAndReportDetail.jsp";
		if(QNAReport != null) {
			request.setAttribute("QNAReport", QNAReport);
			request.getRequestDispatcher(page).forward(request, response);
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
