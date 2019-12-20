package com.kh.lp.admin.qnaAndReport.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.lp.admin.qnaAndReport.model.service.QNAService;
import com.kh.lp.admin.qnaAndReport.model.vo.QNA;
import com.kh.lp.admin.report.model.service.ReportService;
import com.kh.lp.admin.report.model.vo.Report;
import com.kh.lp.common.PageInfo;

/**
 * Servlet implementation class typeSelectServlet
 */
@WebServlet("/typeSelect.tr")
public class TypeSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TypeSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		
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
		int listCount=0;
		
		if(type.equals("BT1")) {
			 listCount = new QNAService().QNACount();
		} else {
			 listCount = new ReportService().ReportCount();
		}
		
		maxPage = (int)((double)listCount/limit+0.9);
		startPage = (int)(((double)currentPage/limit+0.9)-1)*10 + 1;
		endPage = startPage + 10 - 1;
		if(endPage >= maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, startPage,endPage ,maxPage, listCount);
		ArrayList<HashMap<String, Object>> list = null;
		String page = "";
		if(type.equals("BT1")) {
			 
			list = new QNAService().selectType( currentPage, limit);
		} else {
			page = "신고";
			list = new ReportService().selectType(currentPage, limit);
		}
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
