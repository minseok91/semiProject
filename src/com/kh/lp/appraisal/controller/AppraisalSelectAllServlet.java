package com.kh.lp.appraisal.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.appraisal.model.service.AppraisalService;
import com.kh.lp.appraisal.model.vo.AppCom;
import com.kh.lp.common.PageInfo;

/**
 * Servlet implementation class AppraisalSelectAllServlet
 */
@WebServlet("/selectAll.app")
public class AppraisalSelectAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppraisalSelectAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount;
		int endPage;
		int startPage;
		int maxPage;
		int limit;
		int currentPage;
		
		currentPage = 1;
		limit = 10;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		listCount = new AppraisalService().listCount();
		
		maxPage = (int)((double) listCount/ limit + 0.9);
		System.out.println("maxPage :" + maxPage );
		startPage = (((int)((double)currentPage/ limit +0.9)) -1) * 10 + 1;
		endPage = startPage + 10 - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, startPage, endPage , maxPage, listCount);
		System.out.println("pi : "+ pi);
		
		
		ArrayList<AppCom> list = new AppraisalService().appPaging(currentPage, limit);
		
		String page = "";
		if(list != null) {
			page = "views/admin/Goods/appRequestCom.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "";
			request.setAttribute("msg", "감정완료목록 페이징 실패");
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
