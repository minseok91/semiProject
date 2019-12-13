package com.kh.lp.admin.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.member.model.service.MemberService;
import com.kh.lp.admin.member.model.vo.Member;

/**
 * Servlet implementation class admin_blackListDetailServlet
 */
@WebServlet("/blackDetail.me")
public class admin_blackListDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin_blackListDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		System.out.println(userId);
		
		Member user = new MemberService().selectOne(userId);
		
		String page = "";
		if(user != null) {
			page = "views/admin/admin_userDetailPage.jsp";
			request.setAttribute("user", user);
			request.setAttribute("userInfo",2);
		} else {
			//에러 페이지
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
