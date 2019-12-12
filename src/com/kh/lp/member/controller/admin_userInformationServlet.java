package com.kh.lp.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.member.model.service.MemberService;
import com.kh.lp.member.model.vo.Member;
import com.kh.lp.common.PageInfo;

/**
 * Servlet implementation class userInformationServlet
 */
@WebServlet("/userInfo.me")
public class admin_userInformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_userInformationServlet() {
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
		
		int listCount = new MemberService().listCount("MS1","MS2");
		maxPage = (int)((double)listCount/limit+0.9);
		startPage = (int)(((double)currentPage/limit+0.9)-1)*10 + 1;
		
		endPage = startPage + 10 - 1;
		if(endPage <= maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(currentPage, listCount, limit,maxPage,startPage,endPage);
		ArrayList<Member> userList = new MemberService().selectUser(currentPage,limit); 
		String Page = "";
		if(userList != null) {
			 Page = "views/admin/admin_userInformation.jsp";
			 request.setAttribute("list", userList);
			 request.setAttribute("pi", pi);
			 request.setAttribute("listCount", listCount);
		} else {
			
		}
		request.getRequestDispatcher(Page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
