package com.kh.lp.admin.qnaAndReport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.qnaAndReport.model.service.QNAService;
import com.kh.lp.admin.qnaAndReport.model.vo.QNA;

@WebServlet("/questionDetail.qr")
public class QuestionDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuestionDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qnaId = Integer.parseInt(request.getParameter("qnaId"));
		
		QNA questionDetail = new QNAService().getQnaDetail(qnaId);
		
		String page = "";
		
		if(questionDetail != null) {
			page = "views/myPage/queAndReport/questionDetail.jsp";
			request.setAttribute("questionDetail", questionDetail);
		} else {
			request.setAttribute("msg", "문의내역 상세정보 가져오기 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);	
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}




































