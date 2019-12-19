package com.kh.lp.admin.qnaAndReport.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.qnaAndReport.model.service.QNAService;
import com.kh.lp.admin.qnaAndReport.model.vo.QNA;
import com.kh.lp.item.model.service.ItemService;
import com.kh.lp.member.model.vo.Member;



/**
 * @Author         : 오수민
 * @CreateDate    : 2019. 12. 17
 * @ModifyDate    : 2019. 12. 17
 * @Description   :  유저페이지 > 마이페이지 > 문의및신고 > 문의내역 > 문의하기버튼 > 문의내용 입력창에서 정보 가져오는 서블렛
 * @param
 * @return
 */

@WebServlet("/qnaSend.qr")
public class QNASendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QNASendServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이지에서 가져온 parameter 값들 스트링 변수에 저장
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent");
		
		
		//QNA 객체 생성
		QNA sendQNA = new QNA();
		sendQNA.setQnaTitle(qnaTitle);
		sendQNA.setQnaContent(qnaContent);
		
		
		//로그인돼있는 회원 Member객체에 담기
		Member loginMember = (Member)(request.getSession().getAttribute("loginMember"));
		
		
		//결과처리
		int result = new QNAService().qnaSend(loginMember, sendQNA);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath() + "/qnaList.qr.jsp");
		}else {
			request.setAttribute("msg", "관리자문의 등록 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);	
		}
		
		
	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}





































