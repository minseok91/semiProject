package com.kh.lp.report.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.common.PageInfo;
import com.kh.lp.member.model.service.MemberService;
import com.kh.lp.report.model.service.ReportService;
import com.kh.lp.report.model.vo.Report;

/**
 * Servlet implementation class userReportServlet
 */
@WebServlet("/userReport.me")
public class userReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new ReportService().listReportCount(userId);
		System.out.println(listCount);
		maxPage = (int)((double)listCount/limit+0.9);
		startPage = (int)(((double)currentPage/limit+0.9)-1)*10 + 1;
		
		endPage = startPage + 10 - 1;
		
		if(maxPage <= endPage) {
			maxPage = endPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit,maxPage,startPage,endPage);
		ArrayList<Report> reportList = new ReportService().selectList(currentPage, limit, userId);
		System.out.println(reportList);
		String page = "";
		if(reportList != null) {
			page = "views/admin/admin_reportHistory.jsp";
			request.setAttribute("reportList", reportList);
			request.setAttribute("pi", pi);
		} else {
			
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
