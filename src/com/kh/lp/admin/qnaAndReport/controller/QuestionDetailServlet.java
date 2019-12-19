package com.kh.lp.admin.qnaAndReport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.qnaAndReport.model.service.QNAService;
import com.kh.lp.admin.qnaAndReport.model.vo.QNA;

/**
 * @Author         : 오수민
 * @CreateDate    : 2019. 12. 18
 * @ModifyDate    : 2019. 12. 18
 * @Description   :  유저페이지> 마이페이지 > 문의및신고 > 문의내역 리스트 클릭 > 상세보기 창에 정보 띄우는 서블렛
 * @param
 * @return
 */

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
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "문의내역 상세정보 가져오기 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}




































