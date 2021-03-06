package com.kh.lp.admin.qnaAndReport.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.member.model.service.MemberService;
import com.kh.lp.member.model.vo.Member;
import com.kh.lp.admin.qnaAndReport.model.service.QNAService;
import com.kh.lp.admin.qnaAndReport.model.vo.QNA;
import com.kh.lp.common.PageInfo;



/**
 * Servlet implementation class QNASelectServlet
 */
@WebServlet("/QNASelect.qr")
public class QNASelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QNASelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		int listCount = new QNAService().QNACount();
	
		
		maxPage = (int)((double)listCount/limit+0.9);
		startPage = (int)(((double)currentPage/limit+0.9)-1)*10 + 1;
		endPage = startPage + 10 - 1;
		if(endPage >= maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, startPage,endPage ,maxPage, listCount);
		ArrayList<QNA> list = new QNAService().selectAll(currentPage, limit);
		String page = "";
		
		
		System.out.println(list);
		
		if(list != null) {
			page = "views/admin/QNAAndReport/admin_QNAAndReport.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			//에러 페이지
		}
		System.out.println(pi);
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
