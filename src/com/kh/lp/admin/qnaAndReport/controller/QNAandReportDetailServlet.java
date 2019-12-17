package com.kh.lp.admin.qnaAndReport.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.qnaAndReport.model.service.QNAService;
import com.kh.lp.admin.qnaAndReport.model.vo.QNA;
import com.kh.lp.admin.report.model.service.ReportService;
import com.kh.lp.admin.report.model.vo.Report;

import lombok.extern.log4j.Log4j2;

/**
 * Servlet implementation class QNAandReportDetailServlet
 */
@Log4j2
@WebServlet("/QNAandReportDetail.qr")
public class QNAandReportDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QNAandReportDetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qnaId = request.getParameter("qnaId");
		String status = request.getParameter("type");


		String page = "views/admin/admin_qnaAndReportDetail.jsp";
		if(status == null) {
			status = "";
		}

		//신고글 리스트 읽어오는 곳
		if(status.equals("RT1") || status.equals("RT2")) {
			HashMap<String, Object> list = new ReportService().selectOne(qnaId);
			request.setAttribute("list", list);
			log.debug(list);
		} else {
			//문의글 리스트 읽어오는 곳
			//문의 읽으면 답변확인으로 상태 변경
			int update = new QNAService().updateStatus(qnaId);

			if(update > 0) {
				
				System.out.println(qnaId);
				HashMap<String, Object> list = new QNAService().selectOne(qnaId);
				QNA qnareply = new QNAService().selectQnaReply(qnaId);
				
				
				
				
				if(list != null) { 

					request.setAttribute("list", list); 
					request.setAttribute("qnareply", qnareply);
				}
				
			} 
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
