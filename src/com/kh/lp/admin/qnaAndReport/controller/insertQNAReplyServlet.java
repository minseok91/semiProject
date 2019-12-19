package com.kh.lp.admin.qnaAndReport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.lp.admin.qnaAndReport.model.service.QNAService;
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
		
		System.out.println("QNA아이디 : "+QNAId);
		System.out.println("QNA답변 : "+comment);
		
		//QNA댓글을 입력하는 메소드
		int result = new ReplyService().insertReply(QNAId, comment);
		
		String qna = QNAId+"";
		String type = "QHT3";
		//답변이 성공하면 답변완료 상태를 변경한다.
		if(result > 0) {
			//QNA상태 변경
			int update = new QNAService().updateStatus(qna, type);
			int insertHistory = new QNAService().insertHistory(QNAId,type);
			if(update > 0) {
				System.out.println("답변 완료");
			} else {
				System.out.println("답변 실패");
			}
		}
		
		//QNA 답글을 읽어온다.
		QNA QNAReply = new ReplyService().selectQNAReply(QNAId);
		
		response.setContentType("apllication/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(QNAReply, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
