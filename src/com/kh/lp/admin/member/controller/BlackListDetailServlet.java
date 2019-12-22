package com.kh.lp.admin.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lp.admin.member.model.service.MemberService;
import com.kh.lp.member.model.vo.Member;

/**
 * Servlet implementation class admin_blackListDetailServlet
 */
@WebServlet("/blackDetail.me")
public class BlackListDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackListDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		
		
		Member user = new MemberService().selectOne(userId);
		
		ArrayList<Object> list = new ArrayList<>();
		
		list.add(user);
		list.add(0);
		list.add(0);
		list.add(0);
		
		String page = "";
		if(user != null) {
			page = "views/admin/Member/member/admin_memberDetailPage.jsp";
			request.setAttribute("list", list);
			request.setAttribute("userInfo","2");
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
